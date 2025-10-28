# Troubleshooting Guide

## Common Issues and Solutions

### Issue 1: Server won't start - "role postgres does not exist"

**Solution:**
Edit `demo_testing/backend/.env` and update the DATABASE_URL:

- **Windows/Standard PostgreSQL:** `postgresql://postgres:YOUR_PASSWORD@localhost:5432/school_mgmt`
- **Mac (Homebrew):** `postgresql://YOUR_USERNAME@localhost:5432/school_mgmt`

To find your PostgreSQL username:
```bash
whoami
```

### Issue 2: Database doesn't exist

**Create the database:**

Windows/Linux:
```bash
psql -U postgres -c "CREATE DATABASE school_mgmt;"
```

Mac (Homebrew):
```bash
createdb school_mgmt
```

### Issue 3: Cannot connect to PostgreSQL

**Check if PostgreSQL is running:**
```bash
# Windows
pg_isready

# Mac
brew services list | grep postgresql
```

**Start PostgreSQL if not running:**
```bash
# Windows - use Services panel or:
pg_ctl start

# Mac
brew services start postgresql
```

### Issue 4: Schema not initialized

**Load the database schema:**

Windows/Linux:
```bash
cd demo_testing/backend
psql -U postgres -d school_mgmt -f src/db/schema.sql
```

Mac:
```bash
cd demo_testing/backend
psql -d school_mgmt -f src/db/schema.sql
```

### Issue 5: Login fails with "Invalid credential"

**Reset admin password:**
```bash
cd demo_testing/backend
node -e "const argon2 = require('argon2'); argon2.hash('admin123').then(hash => console.log(hash));"
```

Copy the output hash and run:
```bash
# Windows/Linux
psql -U postgres -d school_mgmt -c "UPDATE users SET password = 'PASTE_HASH_HERE' WHERE email = 'admin@school-admin.com';"

# Mac
psql -d school_mgmt -c "UPDATE users SET password = 'PASTE_HASH_HERE' WHERE email = 'admin@school-admin.com';"
```

### Issue 6: Port already in use

**Change the port in `demo_testing/backend/.env`:**
```
PORT=5001
```

And update `demo_testing/frontend/.env`:
```
VITE_API_URL=http://localhost:5001
```

## Step-by-Step Fresh Setup

### Step 1: Ensure PostgreSQL is installed and running
```bash
psql --version
pg_isready
```

### Step 2: Create database
```bash
# Windows/Linux
psql -U postgres -c "CREATE DATABASE school_mgmt;"

# Mac
createdb school_mgmt
```

### Step 3: Setup Backend
```bash
cd demo_testing/backend
cp .env.example .env
# Edit .env file to match your PostgreSQL credentials
npm install
```

### Step 4: Initialize Database Schema
```bash
# Windows/Linux
psql -U postgres -d school_mgmt -f src/db/schema.sql

# Mac
psql -d school_mgmt -f src/db/schema.sql
```

### Step 5: Start Backend
```bash
npm start
```

Should see: "Server running on port 5000"

### Step 6: Setup Frontend (new terminal)
```bash
cd demo_testing/frontend
cp .env.example .env
npm install
npm run dev
```

### Step 7: Access Application
Open browser: http://localhost:5173

Login with:
- Email: admin@school-admin.com
- Password: admin123

## Still Having Issues?

Please provide:
1. Your operating system (Windows/Mac/Linux)
2. PostgreSQL version (`psql --version`)
3. Error messages from terminal
4. Screenshots of the errors

This will help diagnose the specific issue.
