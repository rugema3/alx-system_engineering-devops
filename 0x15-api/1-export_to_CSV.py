#!/usr/bin/python3
"""Get employee todo list and save on csv file."""
import csv
import requests
import sys


def get_employee_todo_progress(employee_id):
    """
    Retrieve the employee's TODO list and export it to a CSV file.

    Args:
        employee_id (int): The ID of the employee for whom you want to
        fetch the TODO list.

    Returns:
        None: This function exports the data to a CSV file.
    """
    url = "https://jsonplaceholder.typicode.com/"
    user = requests.get(url + "users/{}".format(employee_id)).json()
    todos = requests.get(url + "todos", params={"userId": employee_id}).json()

    # Define the CSV file name as USER_ID.csv
    csv_file_name = f"{employee_id}.csv"

    with open(csv_file_name, mode='w', newline='') as csv_file:
        csv_writer = csv.writer(csv_file)
        # Write the CSV header
        csv_writer.writerow([
            "USER_ID",
            "USERNAME",
            "TASK_COMPLETED_STATUS",
            "TASK_TITLE"
            ])

        for todo in todos:
            # Write a row for each task
            csv_writer.writerow([
                user.get("id"),
                user.get("username"),
                str(todo.get("completed")),
                todo.get("title")
                ])


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <employee_id>")
        sys.exit(1)

    employee_id = int(sys.argv[1])
    get_employee_todo_progress(employee_id)
