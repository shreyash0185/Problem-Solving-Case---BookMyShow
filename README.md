# Problem-Solving-Case---BookMyShow
## 📌 Problem Statement
BookMyShow is a ticketing platform where users can book tickets for movie shows.  
For a given theatre, the app displays the next 7 dates, and upon selecting a date, it lists all shows running in that theatre along with their timings.

This project models the scenario in SQL, ensuring the schema follows **1NF, 2NF, 3NF, and BCNF** normalization principles.

---

## 📂 Deliverables
1. **Database Design Document** (`BookMyShow_SQL_Assignment.docx`)  
   - Entities & Attributes  
   - Table Structures  
   - Example Rows  
   - SQL Queries (P1 & P2)

2. **SQL File** (`bookmyshow_case.sql`)  
   - Executable SQL for table creation  
   - Sample inserts  
   - Query to list shows for a given date & theatre  

---

## 🗄 Database Schema

### Entities
- 🎭 **Theatre** → theatre details  
- 🖥 **Screen** → screens in a theatre  
- 🎬 **Movie** → movies running  
- 🎧 **Format** → technology (2D, 3D, Dolby, IMAX, etc.)  
- ⏰ **Show** → ties everything (Movie + Theatre + Screen + Format + Date + Time + Price)  

---

## ⚙️ SQL Setup
Run the following command to set up the schema and sample data:

```sql
SOURCE bookmyshow_case.sql;
