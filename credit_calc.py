import mysql.connector
from datetime import datetime

# Late payment penalty weights
late_payment_weights = {
    'last_30_days': 50,        # Worst impact
    'last_3_months': 30,       # Second worst
    'last_6_months': 20,       # Third worst
    'last_12_months': 10,      # Fourth worst
    'over_a_year_ago': 5       # Least impact
}

# Function to calculate the credit score
def calculate_student_credit_score(gpa, year_in_school, major_category, student_id, work_history, parental_income):
    # Define weights for each factor
    gpa_weight = 0.30
    year_in_school_weight = 0.10
    major_weight = 0.10
    payment_history_weight = 0.25
    work_history_weight = 0.15
    parental_income_weight = 0.10

    # Connect to the database to retrieve payment history
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='your_password',
        database='common_credit_app',
        auth_plugin='caching_sha2_password'
    )
    cursor = connection.cursor()

    # SQL query to get late payment data
    cursor.execute(f"""
        SELECT payment_date,
               CASE 
                   WHEN on_time = FALSE AND payment_date >= CURDATE() - INTERVAL 30 DAY THEN 'last_30_days'
                   WHEN on_time = FALSE AND payment_date >= CURDATE() - INTERVAL 90 DAY THEN 'last_3_months'
                   WHEN on_time = FALSE AND payment_date >= CURDATE() - INTERVAL 180 DAY THEN 'last_6_months'
                   WHEN on_time = FALSE AND payment_date >= CURDATE() - INTERVAL 365 DAY THEN 'last_12_months'
                   WHEN on_time = FALSE THEN 'over_a_year_ago'
                   ELSE NULL
               END AS late_category
        FROM Payments
        WHERE student_id = %s;
    """, (student_id,))

    # Fetch late payment data
    late_payments = cursor.fetchall()
    total_payments = 0
    # Calculate late payment penalty
    late_payment_penalty = 0
    for payment in late_payments:
        total_payments += 1
        late_category = payment[1]
        if late_category:
            late_payment_penalty += late_payment_weights[late_category]

    # Close the connection
    cursor.close()
    connection.close()

    if total_payments == 0:
        on_time_rate = 1.0
    else:
        on_time_rate = max(0.0, 1.0 - (late_payment_penalty / (total_payments * 50)))  # Adjust max penalty

    # Define major difficulty based on category
    major_difficulty = {
        "STEM": 1.2,
        "Business and Management": 1.1,
        "Humanities": 1.0,
        "Social Science": 1.0,
        "Art and Fine Arts": 0.9
    }

    # Adjust GPA contribution based on year in school
    year_in_school_adjustment = {
        1: 1.0,  # Freshman
        2: 1.05, # Sophomore
        3: 1.1,  # Junior
        4: 1.2   # Senior
    }

    # Calculate GPA factor
    gpa_factor = (float(gpa) / 4.0) * major_difficulty.get(major_category, 1.0) * year_in_school_adjustment.get(year_in_school, 1.0)

    # Calculate work history and parental income factors
    work_history_factor = float(work_history) / 3  # Max weight for 3 years
    parental_income_factor = float(parental_income) / 100000  # Normalize by $100,000

    # Base credit score calculation
    credit_score = (
        gpa_weight * gpa_factor +
        year_in_school_weight * year_in_school +
        major_weight * major_difficulty.get(major_category, 1.0) +
        payment_history_weight * on_time_rate +  # Assuming full on-time payments for simplicity
        work_history_weight * work_history_factor +
        parental_income_weight * parental_income_factor
    ) * 850  # Scale to a maximum score of 850
    print(credit_score)
    credit_score = max(300, min(850, int(credit_score))) 
    credit_score -= late_payment_penalty # Ensure the score stays between 300 and 850
    return credit_score


# Fetch student data from the Students table
def fetch_student_data():
    # Connect to the database
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='your_password',
        database='common_credit_app',
        auth_plugin='caching_sha2_password'
    )
    cursor = connection.cursor()

    # Query to get relevant student data
    cursor.execute("""
        SELECT gpa, year_in_school, major_category, student_id, work_history_years, parental_income
        FROM Students;
    """)

    # Fetch the student data
    student_data = cursor.fetchall()

    # Close the connection
    cursor.close()
    connection.close()

    # Return all student records
    return student_data


# Main workflow to fetch student data and calculate credit score
def main():
    students = fetch_student_data()

    for student in students:
        gpa, year_in_school, major_category, student_id, work_history, parental_income = student
        credit_score = calculate_student_credit_score(gpa, year_in_school, major_category, student_id, work_history, parental_income)
        print(f"Student ID: {student_id}, Credit Score: {credit_score}")


# Execute the main function
if __name__ == "__main__":
    main()
