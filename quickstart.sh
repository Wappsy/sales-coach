#!/bin/bash
# Sales Coach - Quick Start Script
# Run this to get your development environment ready

echo "🚀 Sales Coach - Quick Start Setup"
echo "===================================="
echo ""

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Please install Node.js 18+ from https://nodejs.org"
    exit 1
fi

echo "✅ Node.js $(node --version) detected"
echo ""

# Clone and setup
PROJECT_DIR="${HOME}/Desktop/Projects/sales-coach"

if [ -d "$PROJECT_DIR" ]; then
    echo "📂 Project directory exists at $PROJECT_DIR"
else
    echo "📥 Cloning repository..."
    mkdir -p "${HOME}/Desktop/Projects"
    git clone https://github.com/Wappsy/sales-coach.git "$PROJECT_DIR"
fi

cd "$PROJECT_DIR"
echo "📍 Working directory: $(pwd)"
echo ""

# Install dependencies
echo "📦 Installing dependencies..."
npm install --legacy-peer-deps
echo "✅ Dependencies installed"
echo ""

# Setup environment
if [ ! -f ".env.local" ]; then
    echo "⚙️  Setting up environment..."
    cp .env.example .env.local
    echo ""
    echo "📝 Please edit .env.local and add your OpenAI API key:"
    echo "   Get your key from: https://platform.openai.com/api-keys"
    echo ""
    read -p "Press Enter after adding your API key..."
fi

# Start development server
echo ""
echo "🎯 Starting development server..."
echo ""
echo "Opening http://localhost:3000 in your browser..."
echo ""
npm run dev
