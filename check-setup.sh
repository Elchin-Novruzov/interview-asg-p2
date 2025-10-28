#!/bin/bash

echo "=== School Management System - Setup Checker ==="
echo ""

# Check PostgreSQL
echo "1. Checking PostgreSQL installation..."
if command -v psql &> /dev/null; then
    echo "   ✓ PostgreSQL is installed: $(psql --version)"
else
    echo "   ✗ PostgreSQL is NOT installed"
    echo "   Please install PostgreSQL first"
    exit 1
fi

# Check if PostgreSQL is running
echo ""
echo "2. Checking PostgreSQL service..."
if pg_isready &> /dev/null; then
    echo "   ✓ PostgreSQL service is running"
else
    echo "   ✗ PostgreSQL service is NOT running"
    echo "   Please start PostgreSQL service"
    exit 1
fi

# Check Node.js
echo ""
echo "3. Checking Node.js installation..."
if command -v node &> /dev/null; then
    echo "   ✓ Node.js is installed: $(node --version)"
else
    echo "   ✗ Node.js is NOT installed"
    echo "   Please install Node.js (v16 or higher)"
    exit 1
fi

# Check npm
echo ""
echo "4. Checking npm installation..."
if command -v npm &> /dev/null; then
    echo "   ✓ npm is installed: $(npm --version)"
else
    echo "   ✗ npm is NOT installed"
    exit 1
fi

# Check if database exists
echo ""
echo "5. Checking if school_mgmt database exists..."
if psql -lqt 2>/dev/null | cut -d \| -f 1 | grep -qw school_mgmt; then
    echo "   ✓ Database 'school_mgmt' exists"
else
    echo "   ✗ Database 'school_mgmt' does NOT exist"
    echo "   Run: createdb school_mgmt"
    echo "   Or:  psql -U postgres -c \"CREATE DATABASE school_mgmt;\""
fi

# Check backend .env file
echo ""
echo "6. Checking backend configuration..."
if [ -f "demo_testing/backend/.env" ]; then
    echo "   ✓ Backend .env file exists"
else
    echo "   ✗ Backend .env file is missing"
    echo "   Run: cp demo_testing/backend/.env.example demo_testing/backend/.env"
fi

# Check frontend .env file
echo ""
echo "7. Checking frontend configuration..."
if [ -f "demo_testing/frontend/.env" ]; then
    echo "   ✓ Frontend .env file exists"
else
    echo "   ✗ Frontend .env file is missing"
    echo "   Run: cp demo_testing/frontend/.env.example demo_testing/frontend/.env"
fi

# Check backend dependencies
echo ""
echo "8. Checking backend dependencies..."
if [ -d "demo_testing/backend/node_modules" ]; then
    echo "   ✓ Backend dependencies installed"
else
    echo "   ✗ Backend dependencies NOT installed"
    echo "   Run: cd demo_testing/backend && npm install"
fi

# Check frontend dependencies
echo ""
echo "9. Checking frontend dependencies..."
if [ -d "demo_testing/frontend/node_modules" ]; then
    echo "   ✓ Frontend dependencies installed"
else
    echo "   ✗ Frontend dependencies NOT installed"
    echo "   Run: cd demo_testing/frontend && npm install"
fi

echo ""
echo "=== Setup Check Complete ==="
echo ""
echo "If all checks passed, you can start the application:"
echo "  Backend:  cd demo_testing/backend && npm start"
echo "  Frontend: cd demo_testing/frontend && npm run dev"
