# PythonFundamentals_FlaskREST_WebForum

Implements a RESTful backend for a simple web forum using **Flask** in **Python**.  
The API supports creating, reading, and deleting posts while extending baseline functionality with users, user profiles, threaded replies, and search endpoints. Data is stored in memory using synchronized dictionaries with a threading lock for concurrency safety. Testing is handled through **Postman** and automated via **Newman**.

## File Layout
```
project/
├── app.py                              # Flask application and API endpoints
├── run.sh                              # Starts the Flask development server
├── setup.sh                            # Installs dependencies
├── test.sh                             # Executes Newman API tests
├── cdurkin_cs515_project3_collection.postman_collection.json
├── cdurkin_project3_enviroment.postman_environment.json
└── README.md
```
---

## Overview

This project builds a backend API for a basic web forum, supporting user accounts, post creation, threaded replies, and search features. The API is implemented using Flask with structured endpoints that return JSON responses and adhere to RESTful conventions.  

Key features include:
- `POST /post`: Create new posts (with user verification and optional parent linkage for replies)
- `GET /post/<id>`: Retrieve posts and any direct replies
- `DELETE /post/<id>/delete/<key>`: Delete posts securely with user verification
- `POST /user`: Create users with screen names and unique keys
- `PUT /user/<id>/edit`: Edit user profiles
- `GET /posts/search/datetime`: Filter posts by time range
- `GET /posts/search/user`: Return all posts by a specific user

---

## Setup and Run Instructions

To install dependencies and start the Flask server locally:

```bash
# Install any dependencies (Flask is assumed pre-installed)
./setup.sh

# Start the Flask development server
./run.sh
```

To run all automated Postman/Newman tests:

```bash
./test.sh
```

---

## Implementation Summary

The backend uses Flask routes mapped to Python functions that perform data validation, store and retrieve posts, and handle user authentication through keys.  
Thread safety is enforced using a `threading.Lock`. All timestamps are stored in ISO 8601 UTC format for consistent datetime comparisons.

---

## Testing Summary

Testing was performed in **Postman** and automated with **Newman**, using exported JSON collections and environment variables. Each test validates proper HTTP response codes, field presence, and logical consistency.  

Scripts:
- `run.sh`: Launches Flask
- `test.sh`: Runs Newman tests for all endpoints
- `setup.sh`: Installs optional dependencies

---

## Known Issues

- **Delete Function:** Returns HTTP 415 error in some environments due to media type handling.
- **Reply Parent Check:** Reply tests sometimes misalign environment variables.
- **Autograder:** `test.sh` failed during CI due to environment configuration mismatch.

---

## Extensions Implemented

1. **Users and User Keys** – user creation with unique screen names.  
2. **User Profiles** – endpoints for retrieving and editing user metadata.  
3. **Threaded Replies** – hierarchical reply structure with parent/child IDs.  
4. **Date/Time Search** – query posts by ISO 8601 date range.  
5. **User Search** – return posts by specified user ID.

--
