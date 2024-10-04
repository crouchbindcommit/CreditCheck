from flask import Flask, request, jsonify
from flask_cors import CORS
import mysql.connector

app = Flask(__name__)
CORS(app)  # Enable CORS to allow cross-origin access from your Vue frontend

# Database connection
def connect_db():
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='your_password',
        database='common_credit_app',
        auth_plugin='caching_sha2_password'
    )
    return connection

# Route to get student details
@app.route('/api/students', methods=['GET'])
def get_students():
    connection = connect_db()
    cursor = connection.cursor(dictionary=True)
    
    query = "SELECT * FROM Students"
    cursor.execute(query)
    
    students = cursor.fetchall()
    cursor.close()
    connection.close()
    
    return jsonify(students)

# Route to add a new student
@app.route('/api/students', methods=['POST'])
def add_student():
    data = request.json  # Get the JSON data sent by the frontend

    connection = connect_db()
    cursor = connection.cursor()

    query = """INSERT INTO Students (gpa, year_in_school, major_category, work_history_years, parental_income, uname)
               VALUES (%s, %s, %s, %s, %s, %s)"""
    values = (data['gpa'], data['year_in_school'], data['major_category'],
              data['work_history_years'], data['parental_income'], data['uname'])

    cursor.execute(query, values)
    connection.commit()

    cursor.close()
    connection.close()

    return jsonify({"message": "Student added successfully"}), 201

# Route to get payments for a specific student
@app.route('/api/students/<int:student_id>/payments', methods=['GET'])
def get_student_payments(student_id):
    connection = connect_db()
    cursor = connection.cursor(dictionary=True)

    query = "SELECT * FROM Payments WHERE student_id = %s"
    cursor.execute(query, (student_id,))

    payments = cursor.fetchall()
    cursor.close()
    connection.close()

    return jsonify(payments)

# Route to add a new payment
@app.route('/api/students/<int:student_id>/payments', methods=['POST'])
def add_payment(student_id):
    data = request.json

    connection = connect_db()
    cursor = connection.cursor()

    query = "INSERT INTO Payments (student_id, payment_date, on_time) VALUES (%s, %s, %s)"
    values = (student_id, data['payment_date'], data['on_time'])

    cursor.execute(query, values)
    connection.commit()

    cursor.close()
    connection.close()

    return jsonify({"message": "Payment added successfully"}), 201

if __name__ == "__main__":
    app.run(debug=True)
