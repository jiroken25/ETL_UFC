
# Project Name: ETL_UFC Project Member: Dan, Kenjiro

1. Data source

* UFC match data:
up to 8 Jun 2019
https://www.kaggle.com/rajeevw/ufcdata?select=data.csv

* after 8 June 2019 to 25 August 2020
http://www.ufcstats.com/statistics/events/completed?page=all

* UFC fighter data:
https://www.kaggle.com/rajeevw/ufcdata?select=raw_fighter_details.csv

2. Data extract method

* For CSV file: Use Pandas to read CSV
* For web-page : Use Splinter and Beautiful soup. Get all URL info from the webpage and in each page, identify winner and loser, and weight_class. When getting the information, get data type alignment with fight table so that in future we could insert data into the table. 


3. Transform

### fight table
* Winner is given by color. 
=> Identify winner and loser name and store them in pandas dataframe.
* Some fights have no winner/loser 
=> Drop those draw or no-winner fights
* Choose only required column
=> Date, Location, weight_class, winner name, and loser name were saved in pandas dataframe.

### fighter info table
* Weight and Height info is given in American Unit.
=> Converted them into cm / kg

* Choose only required columne
=> fighter_name	height	weight were saved in pandas dataframe.


4. Load

* To Postgres

a. SQL create table as described in 5

b. Use SQLalchemy to create engine and upload df transformed in 3.

c. Confirm the data is uploaded correctly.

* to SQLite

a. Create Base and class for tables.

b. Use SQLalchemy to create engine and upload df transformed in 3.

c. Confirm the data is uploaded correctly.


5. Data Scheme

* match table:id(type:int, primary key) ,Date(type:date), Location(type:str), weight_class(type:str), winner name(type:str), and loser name(type:str)

* Fighter table :id(type:int, primary key),fighter_name(type:str), height(float), weight(float)

* match new Table:id(type:int, primary key) ,Date(type:date), Location(type:str), weight_class(type:str), winner name(type:str), and loser name(type:str)


6. Data utilization

* Using JOIN we could show winner and loser height /weight and could compare.
* Using insert to add new match information to original match table




