# 💇‍♀️ Salon Appointment Scheduler

A Bash + PostgreSQL project that manages a salon’s customer appointments directly from the terminal.  
Built as part of the **FreeCodeCamp Relational Database Certification**.

---

## 📁 Project Structure

```

.
├── salon.sql              # SQL file to create and populate the database
├── salon.sh               # Bash script to manage user interaction
├── README.md              # Project documentation
└── .gitignore             # (optional) excludes unnecessary files

````

---

## 🧠 Overview

The project connects a **Bash script** (`salon.sh`) with a **PostgreSQL database** (`salon`) to manage services and appointments.

The user can:
1. View available salon services  
2. Select a service  
3. Enter their name and phone number  
4. Schedule an appointment  

The system saves and displays all details in a friendly, terminal-based interface.

---

## 🧩 Database Schema

**Tables:**

- `services`  
  - `service_id` (PK)  
  - `name`  

- `customers`  
  - `customer_id` (PK)  
  - `phone` (unique)  
  - `name`  

- `appointments`  
  - `appointment_id` (PK)  
  - `customer_id` (FK → customers)  
  - `service_id` (FK → services)  
  - `time`  

All tables are linked via foreign keys with cascade relationships for data consistency.

---

## 🚀 Setup Instructions

### 1. Clone the repository
```bash
git clone https://github.com/<your-username>/salon-appointment-scheduler.git
cd salon-appointment-scheduler
````

### 2. Load the database

```bash
psql --username=freecodecamp --dbname=postgres
\i salon.sql
```

### 3. Make the script executable

```bash
chmod +x salon.sh
```

### 4. Run the program

```bash
./salon.sh
```

---

## 🧾 Example Interaction

```bash
Welcome to My Salon, how can I help you?

1) cut
2) color
3) perm
4) style
5) trim
# 2
What's your phone number?
# 555-5555
What's your name?
# Ahlem
What time would you like your color, Ahlem?
# 2pm
I have put you down for a color at 2pm, Ahlem.
```

---

## 🧰 Technologies Used

* Bash scripting
* PostgreSQL (DDL + DML)
* SQL joins and subqueries
* Command-line interface I/O

---

## 🧑‍💻 Author

**Ahlem Lounas**
🎓 FreeCodeCamp – Relational Database Certification
💇 *"Automating salon scheduling, one command at a time."*

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

```
