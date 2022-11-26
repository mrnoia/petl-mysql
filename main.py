#!/usr/bin/env python
# coding: utf-8

# In[1]:


import os
import sys
import petl
import pymysql
import configparser
import requests
import datetime
import json
import decimal


# In[2]:


# get data from configuration file
config = configparser.ConfigParser()
try:
    config.read('ETLDemo.ini')
except Exception as e:
    print('could not read configuration file:' + str(e))
    sys.exit()


# In[3]:


# read settings from configuration file
startDate = config['CONFIG']['startDate']
url = config['CONFIG']['url']
hostname = config['CONFIG']['server']
database = config['CONFIG']['database']
username = config['CONFIG']['db_user']
password = config['CONFIG']['db_pass']


# In[4]:


# request data from URL
try:
    BOCResponse = requests.get(url+startDate)
except Exception as e:
    print('could not make request:' + str(e))
    sys.exit()
#print (BOCResponse.text)


# In[5]:


# initialize list of lists for data storage
BOCDates = []
BOCRates = []


# In[6]:


# check response status and process BOC JSON object
if (BOCResponse.status_code == 200):
    BOCRaw = json.loads(BOCResponse.text)
    
    # extract observation data into column arrays
    for row in BOCRaw['observations']:
        BOCDates.append(datetime.datetime.strptime(row['d'],'%Y-%m-%d'))
        BOCRates.append(decimal.Decimal(row['FXUSDCAD']['v']))
        
    # create petl table from column arrays and rename the columns
    exchangeRates = petl.fromcolumns([BOCDates,BOCRates],header=['e_date','rate'])
    #print (exchangeRates)
    
    # load expense document
    try:
        expenses = petl.io.xlsx.fromxlsx('Expenses.xlsx',sheet='Github')
    except Exception as e:
        print('could not open expenses.xlsx:' + str(e))
        sys.exit()
    
    #rename columns
    
    expenses = petl.rename(expenses, 'date', 'e_date')
    #expenses = petl.rename(expenses, 'date', 'e_date')
    #expenses = petl.rename(expenses, 'date', 'e_date')    
    
    print(expenses) 
    
    # join tables
    expenses = petl.outerjoin(exchangeRates,expenses,key='e_date')

    # fill down missing values
    expenses = petl.filldown(expenses,'rate')

    # remove dates with no expenses
    expenses = petl.select(expenses,lambda rec: rec.USD != None)

    # add CDN column
    expenses = petl.addfield(expenses,'CAD', lambda rec: decimal.Decimal(rec.USD) * rec.rate)
    print(expenses)
    
    # intialize database connection
    try:
        connection = pymysql.connect(password=password, database=database,host=hostname,user=username)        
        connection.cursor().execute('SET SQL_MODE=ANSI_QUOTES')
    except Exception as e:
        print('could not connect to database:' + str(e))
        sys.exit()
    # populate Expenses database table
    try:
        petl.io.todb (expenses,connection,'expenses')    
    except Exception as e:
        print('could not write to database:' + str(e))
    #print (expenses)    


# In[ ]:




