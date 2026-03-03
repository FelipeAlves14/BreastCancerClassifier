#!/bin/bash

# Breast Cancer Classifier - Quick Start Script

echo "🚀 Breast Cancer Classifier - Environment Setup"
echo "================================================"
echo ""

# Check Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker not found! Please install Docker Desktop first."
    echo "   Visit: https://www.docker.com/products/docker-desktop"
    exit 1
fi

echo "✅ Docker found: $(docker --version)"

# Check if Docker is running
if ! docker info &> /dev/null; then
    echo "❌ Docker is not running! Please start Docker Desktop."
    exit 1
fi

echo "✅ Docker is running"
echo ""

# Menu
echo "Choose an option:"
echo "1. Open in VS Code Dev Container (Recommended)"
echo "2. Run with Docker Compose (Jupyter Lab)"
echo "3. Build Docker image only"
echo "4. Exit"
echo ""
read -p "Enter your choice [1-4]: " choice

case $choice in
    1)
        echo ""
        echo "📦 Opening in VS Code Dev Container..."
        if command -v code &> /dev/null; then
            code .
            echo ""
            echo "✅ VS Code opened!"
            echo "📝 Next steps:"
            echo "   1. Press F1 or Ctrl+Shift+P"
            echo "   2. Type: 'Dev Containers: Reopen in Container'"
            echo "   3. Wait for container to build (first time takes ~5-10 min)"
        else
            echo "❌ VS Code command not found!"
            echo "   Please open VS Code manually and use Command Palette:"
            echo "   F1 → 'Dev Containers: Reopen in Container'"
        fi
        ;;
    
    2)
        echo ""
        echo "🐳 Starting with Docker Compose..."
        docker-compose up -d
        echo ""
        echo "✅ Container started!"
        echo "🌐 Jupyter Lab: http://localhost:8888"
        echo "📊 TensorBoard: http://localhost:6006"
        echo ""
        echo "To stop: docker-compose down"
        ;;
    
    3)
        echo ""
        echo "🔨 Building Docker image..."
        docker build -t breast-cancer-classifier .
        echo ""
        echo "✅ Image built successfully!"
        echo "To run manually: docker run -it -p 8888:8888 -p 6006:6006 -v $(pwd):/workspace breast-cancer-classifier"
        ;;
    
    4)
        echo "👋 Goodbye!"
        exit 0
        ;;
    
    *)
        echo "❌ Invalid option!"
        exit 1
        ;;
esac

echo ""
echo "================================================"
echo "📚 For more information, see: DEVCONTAINER_README.md"
echo "================================================"
