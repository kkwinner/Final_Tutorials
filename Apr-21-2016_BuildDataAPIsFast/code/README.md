# The Server Demo

This demo is inspired by the work in the [Connexion Example Service](https://github.com/hjacobs/connexion-example).  The goal of this demo is to show how to quickly prop up an API to make use of data that you've been holding on to -- and to impress upon you how easy it is to liberate your data, not matter what form it may be in.  This example, will create endpoints over a MS Excel file!  

Sound interesting?  Read on!


## The Data Source
The data for the first part of the demo comes from the [National Center for Education Statistics](http://nces.ed.gov).  In particular we're going to make and API over some of the data in the [Integrated Postsecondary Data System](http://nces.ed.gov/ipeds) (IPEDS) which keeps track of a number of interesting statistics on higher education data.

## The API Problem
There is a wealth of information in the data that we'd like to expose, but the files are all in Excel.  What's more, we don't exactly have time (or energy just yet) to convert the files to CSV, import them into a database, etc.  For the AccessDB folks, this might be a simple problem to solve, but I'd rather just take the data and expose it as fast as possible.

Though it'd be nice to demo exposing all of this, I've only got an hour (remember), so the data I'd really like to start with are :

* average in state tuition and fees from 2006 (or so) to 2014
* average room and board (same time frame), and 
* average books and supplies cost

Seems simple enough, but there is a little hitch -- this data lives in two separate files.

## Finding the Data
We're going to use the survey data from IPEDS in this example.  In particular, there's an data set for the "Student charges for academic year programs".  Once we browse a bit, we'll see that the "Dictionary" has a summary of the data we're looking for.

We going to work with two files :

* 2010 dictionary: [http://nces.ed.gov/ipeds/datacenter/data/IC2010_AY_Dict.zip](http://nces.ed.gov/ipeds/datacenter/data/IC2010_AY_Dict.zip), which includes the data we need for 2007-2011, and
* 2014 dictionary: [http://nces.ed.gov/ipeds/datacenter/data/IC2014_AY_Dict.zip](http://nces.ed.gov/ipeds/datacenter/data/IC2014_AY_Dict.zip), which includes the summary data for 2011-2014. 

## Getting the data

Examining these files a little more closely, we can see the follow table gives us a mapping of where we can find what we're looking for:

| Data |    Location Notes |
|------|-------------------|
| Average published in-state tuition and fees (2007-10)  | [ic2010_ay.xls](data/ic2010_ay.xls) StatisticsRV sheet; cells E87-E98  |
| Average published in-state tuition and fees (2010-14)  | [ic2014_ay.xls](data/ic2010_ay.xls) Statistics sheet; cells E72-E81 |
| Average books and supplies costs (2007-10)  | [ic2010_ay.xls](data/ic2010_ay.xls) StatisticsRV sheet; cells E101-E104  |
| Average books and supplies costs (2011-14)  | [ic2014_ay.xls](data/ic2014_ay.xls) StatisticsRV sheet; cells E98-E101  |
| Average room and board (2007-10)  | [ic2010_ay.xls](data/ic2010_ay.xls) StatisticsRV sheet; cells E105-E108 |
| Average room and board (2011-14)  | [ic2014_ay.xls](data/ic2014_ay.xls) StatisticsRV sheet; cells E102-105 |

# The Server Code

The API we're going to develop will return JSON, and we will wrap the Excel file to demonstrate how it can be done, only out of convenience, but _not_ as a recommended practice - except in special cases that might actually warrant it.  

## Endpoints
For the sake of this example, we are going to have two endpoints listed in the table below:
 
| Endpoint|    Description |
|------|-------------------|
| `/summary/costs`  | Provides the links to the endpoints to obtain all the costs data in the API.  |
| `/summary/costs/{year}` | Provides the costs return data for  the supplied year (e.g. tuition+fees, room and board, books and supplies) | 

## Implementation
The core implementation can be found in [server](./server/api_server.py) file.

The API specification can be found in [apispec](./server/apispec/data_api.yaml).  For more information about YAML, go [here](), and of course, [here for the OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification/).