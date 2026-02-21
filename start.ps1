# Breast Cancer Classifier - Quick Start Script (PowerShell)

Write-Host "🚀 Breast Cancer Classifier - Environment Setup" -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

# Check Docker
try {
    $dockerVersion = docker --version
    Write-Host "✅ Docker found: $dockerVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Docker not found! Please install Docker Desktop first." -ForegroundColor Red
    Write-Host "   Visit: https://www.docker.com/products/docker-desktop" -ForegroundColor Yellow
    exit 1
}

# Check if Docker is running
try {
    docker info | Out-Null
    Write-Host "✅ Docker is running" -ForegroundColor Green
} catch {
    Write-Host "❌ Docker is not running! Please start Docker Desktop." -ForegroundColor Red
    exit 1
}

Write-Host ""

# Menu
Write-Host "Choose an option:" -ForegroundColor Yellow
Write-Host "1. Open in VS Code Dev Container (Recommended)"
Write-Host "2. Run with Docker Compose (Jupyter Lab)"
Write-Host "3. Build Docker image only"
Write-Host "4. Exit"
Write-Host ""

$choice = Read-Host "Enter your choice [1-4]"

switch ($choice) {
    "1" {
        Write-Host ""
        Write-Host "📦 Opening in VS Code Dev Container..." -ForegroundColor Cyan
        
        if (Get-Command code -ErrorAction SilentlyContinue) {
            code .
            Write-Host ""
            Write-Host "✅ VS Code opened!" -ForegroundColor Green
            Write-Host "📝 Next steps:" -ForegroundColor Yellow
            Write-Host "   1. Press F1 or Ctrl+Shift+P"
            Write-Host "   2. Type: 'Dev Containers: Reopen in Container'"
            Write-Host "   3. Wait for container to build (first time takes ~5-10 min)"
        } else {
            Write-Host "❌ VS Code command not found!" -ForegroundColor Red
            Write-Host "   Please open VS Code manually and use Command Palette:" -ForegroundColor Yellow
            Write-Host "   F1 → 'Dev Containers: Reopen in Container'"
        }
    }
    
    "2" {
        Write-Host ""
        Write-Host "🐳 Starting with Docker Compose..." -ForegroundColor Cyan
        docker-compose up -d
        Write-Host ""
        Write-Host "✅ Container started!" -ForegroundColor Green
        Write-Host "🌐 Jupyter Lab: http://localhost:8888" -ForegroundColor Cyan
        Write-Host "📊 TensorBoard: http://localhost:6006" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "To stop: docker-compose down" -ForegroundColor Yellow
    }
    
    "3" {
        Write-Host ""
        Write-Host "🔨 Building Docker image..." -ForegroundColor Cyan
        docker build -t breast-cancer-classifier .
        Write-Host ""
        Write-Host "✅ Image built successfully!" -ForegroundColor Green
        Write-Host "To run manually:"
        Write-Host "docker run -it -p 8888:8888 -p 6006:6006 -v `"${PWD}:/workspace`" breast-cancer-classifier" -ForegroundColor Yellow
    }
    
    "4" {
        Write-Host "👋 Goodbye!" -ForegroundColor Cyan
        exit 0
    }
    
    default {
        Write-Host "❌ Invalid option!" -ForegroundColor Red
        exit 1
    }
}

Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "📚 For more information, see: DEVCONTAINER_README.md" -ForegroundColor Yellow
Write-Host "================================================" -ForegroundColor Cyan
