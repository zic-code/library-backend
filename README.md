# 📚 Library Tracker App — Backend (Flask + PostgreSQL)

This repository contains the backend REST API for the **Library Tracker App**, a full-stack application that allows users to search books, save reading progress, and write reviews.

The backend is built with **Flask + PostgreSQL** and exposes secure, token-protected CRUD API endpoints consumed by a React frontend.

---

## 🚀 Features

- Full CRUD REST API
- User authentication with **JWT** (JSON Web Token)
- Secure password hashing using **bcrypt**
- PostgreSQL relational database with **SQLAlchemy ORM**
- CORS-enabled for communication with React frontend
- Deployment ready (environment variables + Render)

---

## 🛠 Tech Stack

| Category | Technologies |
|----------|-------------|
| Language | Python |
| Framework | Flask |
| ORM | SQLAlchemy |
| Database | PostgreSQL |
| Authentication | JWT + bcrypt |
| Deployment | Render |
| Tools | Git/GitHub, Insomnia, Postman |

---

## 📡 REST API Endpoints

> All endpoints return JSON responses.

### 🔐 Authentication

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/auth/register` | Register a new user |
| POST | `/auth/login` | Log in and receive JWT token |

### 📚 Books (Protected — JWT required)

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/books` | Get all books saved by the user |
| POST | `/books` | Add a book to the user library |
| PUT | `/books/:id` | Update reading progress or book info |
| DELETE | `/books/:id` | Delete a saved book |

> Frontend sends the JWT token in the `Authorization` header:
>
> `Authorization: Bearer <token>`

---
