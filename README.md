# Transforming and Analyzing E-commerce Data with SQL

## Project/Goals 🎯

The goal for the project is to analyze and transform the E-commerce dataset while find patterns and unique features.

## Workbook Instructions 📝
This project is organized into data, images, and src folders:

 - [`'data'`](https://github.com/Jaghs/SQL-project/tree/main/data): folder contains E-commerce dataset
 - [`'images'`]([https://github.com/Jaghs/demand-prediction-project/tree/main/images](https://github.com/Jaghs/SQL-project/tree/main/images): folder contains Entity Relationship Diagram (ERD)
- [`'workbooks'`](https://github.com/Jaghs/SQL-project/tree/main/workbooks): folder contains 4 workbooks where my SQL queries are:

  1. [`'cleaning_data'`](https://github.com/Jaghs/SQL-project/blob/main/workbooks/cleaning_data.md): Queries used to clean the data

  2. [`'starting_with_questions'`](https://github.com/Jaghs/SQL-project/blob/main/workbooks/starting_with_questions.md): Answering questions about the data with queries

  3. [`'starting_with_data'`](https://github.com/Jaghs/SQL-project/blob/main/workbooks/starting_with_data.md): Using the data I created my own questions to answer with queries 

  4. [`'QA'`](https://github.com/Jaghs/SQL-project/blob/main/workbooks/QA.md): My quality assurance process and how I identified and fixed my risk areas with queries

## Workflow 🔄️

1. Loading csv files into PostgreSQL and properly formatting data 
2. Data cleaning the databases and looking for potential issues that could alter results
3. Going through the required problems and using queries to answer the questions to achieve certain results
4. Double checking my data outputs through QA and validation queries

## QA Process ⚙️

1. The risk areas encompassed columns with blank or null values, including the 'userid' column from the analytics table. Another risk involved having unique data that was not duplicated, as well as data that may be linked to other tables but lacked explicit statements or contained mistyped column names
2. After finding such risks I created queries to validate if these were indeed errors or just part of the data
3. Running these queries show me that there were duplicate values, incorrect column names and null values that had to be removed
4. I also made efforts to ensure the cleanliness of my queries by using uppercase for functions and breaking down lengthy queries into multiple parts. Additionally, I included comments to enhance code readability and maintainability

## Results 📊

The data provided told me alot about the process of the ecommerce business. I used the databases to gain a specialized insight on certain areas of the business such as revenue, top-selling products, average number of visitors, and unique patterns. 

- Top revenue generating countries were Canada, India, Russia, UK and US
- Most of the items sold relate to the home and apparel side such as bottles, clothing, and small misc. household items
-Interesting result was that the French country of Martuneek had the highest average number of pageviews at 25

## Challenges 🚧

It was challenging to go through a lot of data in the short amount of time. However, this allowed me to work under pressure and learn newer/faster ways of completeing tasks. I also found it challenging knowing when to use certain functions over others and how I could be more efficient/cleaner with my queries.


## Future Goals 💡

Given more time it would be much easier to go through all the data in detail and allow for a deeper understanding of the datasets. My queries could have also been improved to be more efficient and have less clutter.

