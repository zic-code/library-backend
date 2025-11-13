📚 Library Tracker App — Backend (Node.js + Express.js + PostgreSQL)

This repository contains the backend REST API for the Library Tracker App,
a full-stack web application that allows users to search books, save reading progress, and write reviews.

The backend is built with Node.js + Express.js and uses PostgreSQL for data storage.
It provides secure, token-protected CRUD API endpoints that are consumed by a React frontend.

🚀 Features

Full CRUD REST API

User authentication with JWT (JSON Web Token)

Secure password hashing using bcrypt

PostgreSQL integration using node-postgres (pg)

CORS-enabled for communication with the React frontend

Deployment-ready configuration (Render + environment variables)

🛠 Tech Stack
Category	Technologies
Language	JavaScript (Node.js)
Framework	Express.js
Database	PostgreSQL
ORM / Query Tool	node-postgres (pg)
Authentication	JWT + bcrypt
Deployment	Render
Tools	Git/GitHub, Insomnia, Postman
📡 REST API Endpoints

All endpoints return JSON responses.
Protected routes require JWT authentication.

🔐 Authentication
Method	Endpoint	Description
POST	/auth/register	Register a new user
POST	/auth/login	Log in and receive a JWT token
📚 Books (Protected — JWT required)
Method	Endpoint	Description
GET	/books	Get all books saved by the user
POST	/books	Add a book to the user’s library
PUT	/books/:id	Update reading progress or book information
DELETE	/books/:id	Delete a saved book
💬 Reviews (optional)
Method	Endpoint	Description
GET	/reviews/:bookId	Get all reviews for a specific book
POST	/reviews/:bookId	Add a review for a book
PUT	/reviews/:id	Edit an existing review
DELETE	/reviews/:id	Delete a review
🧩 System Architecture
React (Frontend)
     ↓ Axios HTTP Requests
Express.js (Backend)
     ↓ node-postgres (pg)
PostgreSQL (Database)

🎥 Demo

Below is a short demo video showing the main features of the Library Tracker App in action:

![demo](https://github.com/user-attachments/assets/10e438e5-a1dd-4f9b-ad53-0e76df4ac138)

Demonstrates login, book search, add, update, and review —
showing full CRUD and REST API integration between React and Node.js.
