Bash Shell Script Database Management System (DBMS) Project

Overview:
The Bash Shell Script Database Management System (DBMS) project aims to develop a command-line interface (CLI) application that allows users to store and retrieve data from the hard disk using bash scripting. The project will offer functionalities such as creating, listing, connecting to, and dropping databases, as well as creating, listing, dropping, inserting into, selecting from, deleting from, and updating rows in tables.

Project Features:

Main Menu:

Create Database: Enables users to create a new database.
List Databases: Displays a list of existing databases.
Connect To Database: Allows users to connect to a specific database.
Drop Database: Permits users to delete an existing database.
Database Menu:
Upon connecting to a specific database, users will have access to the following menu:

Create Table: Enables users to create a new table within the connected database.
List Tables: Displays a list of tables existing in the connected database.
Drop Table: Allows users to delete a table from the connected database.
Insert Into Table: Facilitates inserting new rows into a table.
Select From Table: Retrieves and displays rows from a table based on specified conditions.
Delete From Table: Removes rows from a table based on specified conditions.
Update Row: Modifies existing rows in a table based on specified conditions.
Implementation Details:

Database Storage: Databases will be stored as directories relative to the location of the script file. Absolute paths will not be used to ensure portability.

Table Storage: Tables will be stored as files, which can be in CSV file format. The metadata and raw data of the tables stored in separate files.

Metadata: When creating a table, metadata such as table name, number of columns, and names of columns will be stored.

Primary Key: chosen by user.

Data Types: Data types (digits or strings) of columns will be tracked, and user input will be validated based on these data types to ensure data integrity.

Data Display: The output of select queries will be formatted in a human-readable format for ease of interpretation.

Usage:
To use the DBMS, execute the script file and navigate through the menu options using the command-line interface. Follow the prompts to create, connect to, and interact with databases and tables.

Contributing:
Contributions to the project are welcome. Feel free to fork the repository, make changes, and submit pull requests.



Contact:
For any inquiries or feedback, please contact me at heba.hasan180@gmail.com.

Acknowledgments:
Special thanks to Abdelrhman Shehata for their valuable contributions and resources that helped in the development of this project
