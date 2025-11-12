#!/bin/bash
# salon.sh - FreeCodeCamp Salon Appointment Scheduler
if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=salontest --no-align --tuples-only -c"
else
  PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"
fi

# Function: display the list of available services
display_services() {
  echo "$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")" | \
  while IFS="|" read SERVICE_ID SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
}

# Welcome message
echo "Welcome to the salon, how can I help you?"

# Display services
display_services

# Ask for service id
read SERVICE_ID_SELECTED
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")

# If service does not exist, loop until valid
while [[ -z $SERVICE_NAME ]]
do
  echo "I could not find that service. What would you like today?"
  display_services
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
done

# Ask for phone number
echo "What's your phone number?"
read CUSTOMER_PHONE

# Check if the customer exists
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")

# If new customer, ask for name and insert
if [[ -z $CUSTOMER_NAME ]]
then
  echo "I don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
fi

# Get customer_id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")

# Ask for time
echo "What time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

# Insert appointment
INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")

# Final confirmation
echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
