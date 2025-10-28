# Interview Task Solution

## Problem 2: Student Management CRUD Operations

### What I Implemented

I completed the missing CRUD operations in the student management controller (`backend/src/modules/students/students-controller.js`).

### Changes Made

**File Modified:** `/backend/src/modules/students/students-controller.js`

Implemented 5 controller functions:

1. **handleGetAllStudents** - GET all students with filtering support
2. **handleAddStudent** - POST to create new student 
3. **handleGetStudentDetail** - GET single student by ID
4. **handleUpdateStudent** - PUT to update student info
5. **handleStudentStatus** - POST to enable/disable student

### Technical Approach

- Used existing service layer methods (getAllStudents, addNewStudent, etc.)
- Followed the project's asyncHandler pattern for error handling
- Maintained consistent response format with other controllers
- Added query parameter support for filtering students
- Proper HTTP status codes (200, 201, 404)

### Setup & Testing

**Prerequisites:**
- PostgreSQL running on port 5432
- Node.js installed

**Database Setup:**
```bash
createdb school_mgmt
psql -d school_mgmt -f seed_db/tables.sql
psql -d school_mgmt -f seed_db/seed-db.sql
```

**Backend:**
```bash
cd backend
npm install
npm start
```

**Frontend:**
```bash
cd frontend
npm install
npm run dev
```

**Login credentials:**
- Email: admin@school-admin.com
- Password: 3OU4zn3q6Zh9

### API Endpoints

- `GET /api/v1/students` - List all students
- `POST /api/v1/students` - Create student
- `GET /api/v1/students/:id` - Get student details
- `PUT /api/v1/students/:id` - Update student
- `POST /api/v1/students/:id/status` - Change student status

### Notes

- All endpoints require authentication (JWT tokens)
- CSRF protection is enabled
- The service layer handles email verification when adding students
- Student deletion is soft delete (status change) to preserve records

---

**Elchin Novruzov**
