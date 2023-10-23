#!/usr/bin/python3
"""Returns to-do list information for a given employee ID."""
import requests
import sys


def get_employee_todo_progress(employee_id):
    """
    Retrieve and display an employee's TODO list progress for a given
    employee ID.

    Args:
        employee_id (int): The ID of the employee for whom you want to
        fetch the progress.

    Returns:
        None: This function displays the progress on the standard output.
    """
    # Define the base URL of the API
    base_url = 'https://jsonplaceholder.typicode.com/'

    # Make a GET request to fetch the user data
    user_response = requests.get(base_url + f'users/{employee_id}')
    user_data = user_response.json()

    # Make a GET request to fetch the TODO list data for the employee
    todo_response = requests.get(base_url + f'todos?userId={employee_id}')
    todo_data = todo_response.json()

    # Calculate the number of completed tasks and total tasks
    completed_tasks = sum(1 for task in todo_data if task['completed'])
    total_tasks = len(todo_data)

    # Display the employee's TODO list progress
    print(
        f'Employee {user_data["name"]} is done '
        'with tasks({completed_tasks}/{total_tasks}):'
         )
    for task in todo_data:
        if task['completed']:
            print(f'\t{task["title"]}')


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python script.py <employee_id>")
        sys.exit(1)

    employee_id = int(sys.argv[1])
    get_employee_todo_progress(employee_id)
