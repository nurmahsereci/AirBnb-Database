# A Use Case of Airbnb Database 

**This project is a Computer Science Undergraduate student project.**

## Database Schema Overview

The Airbnb database comprises a total of 20 tables:

amenities, amenity_listing, complaint, employee, guest, guest_booked_place, host, host_offered_place, income, language, listing, location, media, notification, payment, place, reservation, review, role, user

Each table stores specific information related to users, places, reservations, payments, and others.

The database facilitates the registration and management of users, including guests, hosts, and employees. Places available for rent are managed through the database. Hosts can list their places, and guests can browse and book them. The database handles reservations made by guests. Reservations are linked to specific listings and guests. Guests can submit reviews for properties they have stayed in. Payment transactions are recorded in the database. The system tracks income generated through reservations, providing insights into revenue generation for hosts and the platform. Users can file complaints regarding their experiences on the platform. The database handles notifications sent to users.

**The images in the media have been deleted in order not to violate copyrights.**

## Prerequisites

| Technologies                |
|-----------------------------|
| MySQL Workbench             |
| MySQL Community Server      |
| MySQL Shell                 |


Download and install MySQL: If you haven't already, download and install MySQL server, MySQL Workbench, and MySQL shell from the official website: https://www.mysql.com/

## Clone the Repository:
- Clone the database repository locally. Run this command (Terminal on Mac or Git Bash on Windows:If you don’t already have Git Bash, you’ll have to download it to complete this process.):

```
git clone https://github.com/nurmahsereci/AirBnb-Database.git
```

## Installations of the Project:

1. Open MySQL Workbench and set up a new connection.
2. Connect to the server you created in the previous step from MySQL Workbench.
3. Open the Data Import Screen: You can do this in two ways: Either click on the Administration tab on the left, then click Data Import/Restore, or click on the Server menu at the top and click on Data Import.
4. Select the ‘Import from Self-Contained File’ option.
5. Next, select the file: Click on the small button with the two dots on the far right to browse for the SQL file.
6. Browse to the location of the ‘airbnb_database’ SQL file, select it, and click Open.
7. Create a new schema at the ‘Default Target Schema’ part.
8. Make sure 'Dump Structure and Data' is selected.
9. Click the ‘Start Import’ button on the bottom right.
10. You should see ‘It has finished and the data is now imported’.
11. Go to the ‘Schemas’ tab and refresh.
12. You should see the newly created schema and all the new tables created.
13. If you want to test the schema, you can execute the SQL file named 'test_cases' after opening it from the 'Open a SQL script file in a new query tab' tab.
14. Additionally, you can execute statements in the SQL file named 'metadata' to access the information schema.

You can now use it to manage places, reservations, payments, and other aspects of the Airbnb platform. Refer to the database schema overview for details on table structures and functionalities.

## License


## Contact Information 
- Author: Nur Mahsereci
- Email: nurmahsereci@gmail.com
- **If you encounter any issues during the setup process or while running the application, feel free to ask for further assistance!**
