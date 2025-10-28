# Setup Instructions

## Prerequisites
- Node.js (v16 or higher)
- PostgreSQL (v12 or higher)

## Database Setup

1. **Start PostgreSQL service**
   - Windows: PostgreSQL should auto-start
   - Mac (Homebrew): `brew services start postgresql`
   - Linux: `sudo systemctl start postgresql`

2. **Create the database**

   Using default postgres user:
   ```bash
   psql -U postgres -c "CREATE DATABASE school_mgmt;"
   ```

   If you don't have a postgres user (common on Mac Homebrew installations):
   ```bash
   createdb school_mgmt
   ```

3. **Update database credentials** (if needed)
   
   If your PostgreSQL uses different credentials, edit `demo_testing/backend/.env`:
   ```
   DATABASE_URL=postgresql://YOUR_USERNAME:YOUR_PASSWORD@localhost:5432/school_mgmt
   ```
   
   Common configurations:
   - Windows/Linux default: `postgresql://postgres:postgres@localhost:5432/school_mgmt`
   - Mac Homebrew: `postgresql://YOUR_MAC_USERNAME@localhost:5432/school_mgmt`

4. **Initialize database schema**
   
   Using postgres user:
   ```bash
   psql -U postgres -d school_mgmt -f demo_testing/backend/src/db/schema.sql
   ```
   
   Or on Mac (Homebrew):
   ```bash
   psql -d school_mgmt -f demo_testing/backend/src/db/schema.sql
   ```

## Backend Setup

1. Navigate to backend directory:
```bash
cd demo_testing/backend
```

2. Install dependencies:
```bash
npm install
```

3. Start the server:
```bash
npm start
```

Server should start on http://localhost:5001 (or the port specified in .env)

## Frontend Setup

1. Navigate to frontend directory:
```bash
cd demo_testing/frontend
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm run dev
```

Frontend should start on http://localhost:5173

## Default Login Credentials

- Email: admin@school-admin.com
- Password: admin123

## Common Issues

**Database connection error:**
- Verify PostgreSQL is running: `pg_isready`
- Check database exists: `psql -l | grep school_mgmt`
- Verify credentials in `demo_testing/backend/.env` match your PostgreSQL setup
- The default .env uses `postgres:postgres` - update if your setup is different

**Port already in use:**
- Backend: Change `PORT` in `demo_testing/backend/.env`
- Frontend: Change port in vite config or kill existing process

**Email service errors:**
- Email functionality is optional. Server will run without a valid RESEND_API_KEY.
- You can ignore "Email service not configured" warnings.
