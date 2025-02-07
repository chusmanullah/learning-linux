#!/bin/bash

# Database credentials
DB_HOST="localhost"
DB_USER="your_db_username"
DB_PASS="your_db_password"
DB_NAME="your_database_name"
TABLE_NAME="customers"

# Function to generate a unique ID
generate_unique_id() {
    echo $(uuidgen | tr '[:upper:]' '[:lower:]')
}

# Function to validate email format
validate_email() {
    local email=$1
    if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to validate phone number format (basic validation)
validate_phone() {
    local phone=$1
    if [[ "$phone" =~ ^[0-9]{10}$ ]]; then
        return 0
    else
        return 1
    fi
}

# Show the form and collect customer data
echo "Welcome to the Customer Registration Form!"
read -p "Enter your name: " name
read -p "Enter your email: " email
read -p "Enter your phone number (10 digits): " phone
read -p "Enter your comment: " comment

# Validate email and phone number
if ! validate_email "$email"; then
    echo "Invalid email format. Please try again."
    exit 1
fi

if ! validate_phone "$phone"; then
    echo "Invalid phone number. Please enter a 10-digit number."
    exit 1
fi

# Generate a unique ID for the customer
unique_id=$(generate_unique_id)

# Insert data into the MySQL database
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" <<EOF
INSERT INTO $TABLE_NAME (unique_id, name, email, phone, comment)
VALUES ('$unique_id', '$name', '$email', '$phone', '$comment');
EOF

# Check if the insertion was successful
if [ $? -eq 0 ]; then
    echo "Customer data saved successfully!"
    echo "Your unique ID is: $unique_id"
else
    echo "Error: Failed to save customer data."
fi