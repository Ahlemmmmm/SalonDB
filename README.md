# 🌌 Celestial Bodies Database

This project builds a complete PostgreSQL database about celestial bodies — including galaxies, stars, planets, and moons — as part of the **FreeCodeCamp Relational Database Certification**.

---

## 📁 Project Structure

```

.
├── universe.sql          # Main SQL script that creates and populates the database
├── README.md             # Project documentation
└── .gitignore            # Optional: excludes unnecessary files

````

---

## 🧠 Overview

The **universe** database models astronomical entities and their relationships:
- **Galaxies** contain multiple stars  
- **Stars** may have several planets  
- **Planets** may have multiple moons  

Each table includes descriptive columns, primary keys, foreign keys, and constraints to ensure data integrity.

---

## 🧩 Database Schema

**Tables included:**
- `galaxy` – contains galaxy information (e.g., name, type, distance)
- `star` – contains data about stars and links to their galaxy
- `planet` – stores planet data and links to their star
- `moon` – lists all moons linked to a planet
- `planet_type` – defines types of planets (e.g., gas giant, terrestrial)

---

## 🚀 Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone https://github.com/<your-username>/celestial-bodies-database.git
   cd celestial-bodies-database
````

2. **Access PostgreSQL:**

   ```bash
   psql --username=freecodecamp --dbname=postgres
   ```

3. **Create and connect to the universe database:**

   ```sql
   CREATE DATABASE universe;
   \c universe;
   ```

4. **Run the SQL script:**

   ```bash
   \i universe.sql
   ```

5. **Verify that all tests pass** on the FreeCodeCamp platform.

---

## 🧾 Example Queries

```sql
-- List all galaxies
SELECT name FROM galaxy;

-- Find all planets orbiting a given star
SELECT planet.name
FROM planet
JOIN star ON planet.star_id = star.star_id
WHERE star.name = 'Sun';

-- Count total number of moons
SELECT COUNT(*) FROM moon;
```

---

## 🧰 Technologies Used

* PostgreSQL 15+
* SQL (DDL, DML)
* Relational modeling principles
* Foreign key relationships and constraints

---

## 🏁 Author

**Ahlem Lounas**
🎓 FreeCodeCamp – Relational Database Certification
💫 *"Exploring the universe one table at a time."*

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

```
