# Databases (Codecademy)

A repository of code and notes taken while studying databases in Codecademy.

## The Relational Database Management System (RDBMS)

- Allows you to create, update, and administer a relational database. 
- Most RDBMSs use SQL to access the database. 

A **database** is a set of data stored in a computer,
usually structured in a way that makes the data easily accessible.

A **relational database** is a type of database that allows for identification and access of data
*in relation to* other data in the database.
- Data in a relational database is often organised into **tables**. 
- The rows in a table are often called **records**.
- The columns in a table have a descriptive **header** and a specific **data type**.

**SQL** is a programming language used to communicate with data stored in an RDBMS. 
- The syntax differs depending on the RDBMS you're using.

Popular RDBMSs:

- MySQL
- PostgreSQL
- OracleDB
- SQLServer
- SQLite

If your file ends in `.sqlite`, you're working with SQLite.

If your file ends in `.sql`, you're working with PostgreSQL. 

SQLite and PostgreSQL have different data types:

- To store text in SQLite, you'll use the `TEXT` data type.
- To store text in PostgreSQL, you'll have multiple options,
including `varchar(n)`, `char(n)`, or `text`.
There are subtle differences between these options.

Relational databases are typically ACID compliant, ensuring high integrity of data. 

## NoSQL

Stands for 'Not-only-SQL', 'Non-relational SQL', or 'Non-SQL'. 

Any database technology that stores data differently to relational databases. 

Used when a more flexible and/or more scalable database solution is required than SQL.

Designed with scalability as a priority. 

Doesn't require a **schema**, unlike SQL.
This enables it to deal with unstructured or semi-structured data in different formats.

Requires less organisation, therefore developers can concentrate on simply
**using** the data rather than additionally figuring out how to store it.

Usually sacrifices integrity for increased availability and distribution of data,
BUT some NoSQL databases do offer ACID compliance.

No standard language for NoSQL. 
While some NoSQL databases use query languages similar to SQL, most don't.
Typically, each database uses a different language to set up, manage, and query data.

### Types of NoSQL databases:

#### Key-value database

Organises individual records as key-value pairs. 

Keys must be unique.

Here, we're prioritising fast queries over fancy features. 

Popular options: Redis and Amazon DynamoDB.

#### Document based (or document-oriented) database

Consists of data stored in hierarchical structures.

Some supported document formats: JSON, BSON, XML, YAML. 

Considered an extension of the key-value database. 

Popular option: MongoDB. 

#### Graph database

Data is stored in vertices (nodes) and establishes relationships via edges (links or lines). 

Much simpler to set up manage, and query, than relational databases. 

Popular option: Neo4j.

#### Column-oriented database

Stores data in columns instead of rows:

![Column-oriented database](https://static-assets.codecademy.com/Courses/Backend-Backfill/ART1440-column-oriented.svg)

Popular option: Amazon Redshift.

## SQL

`SELECT` - Retrieves data from a database. 

`*` (asterisk operator) - used with `SELECT` to specify **all columns**. 

`FROM` - Specifies where to get the data *from*: which tables we're querying.

`CREATE` - Defines a new database object. 



