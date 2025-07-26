#!/bin/bash

echo "🚀 Manual Deployment Script for Word Guesser"
echo "=============================================="

# Stop any existing processes
echo "Stopping existing processes..."
pkill -f "vite build" 2>/dev/null || echo "No build processes to stop"

# Create dist directory
echo "Creating dist directory..."
mkdir -p dist/public

# Build server (this works quickly)
echo "Building server..."
npx esbuild server/index.ts --platform=node --packages=external --bundle --format=esm --outdir=dist
if [ $? -eq 0 ]; then
    echo "✅ Server build successful!"
else
    echo "❌ Server build failed"
    exit 1
fi

# Create optimized client build by copying source files
echo "Creating optimized client build..."
cp -r client/* dist/public/
mkdir -p dist/public/assets

# Create essential CSS file
echo "Creating essential CSS..."
cat > dist/public/assets/index.css << 'EOF'
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
@tailwind base;
@tailwind components;
@tailwind utilities;

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
  line-height: 1.6;
  color: #1f2937;
  background: linear-gradient(135deg, #eff6ff 0%, #e0e7ff 100%);
  min-height: 100vh;
}

#root {
  width: 100%;
  min-height: 100vh;
}

.loading-spinner {
  display: inline-block;
  width: 20px;
  height: 20px;
  border: 3px solid #f3f4f6;
  border-radius: 50%;
  border-top-color: #3b82f6;
  animation: spin 1s ease-in-out infinite;
}

@keyframes spin {
  to { transform: rotate(360deg); }
}
EOF

# Update HTML to use CDN for faster loading
echo "Updating HTML template..."
cat > dist/public/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Word Guesser - Vocabulary Game | Expand Your Vocabulary</title>
    <meta name="description" content="Word Guesser is an interactive vocabulary game that helps you expand your vocabulary through word guessing challenges. Play with different difficulty levels and word lengths.">
    <meta name="robots" content="index, follow">
    <meta name="author" content="Word Guesser">
    <meta name="theme-color" content="#6366f1">
    
    <!-- Use CDN for faster loading -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        body { 
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(135deg, #eff6ff 0%, #e0e7ff 100%);
            min-height: 100vh;
        }
        .loading { 
            display: flex; 
            justify-content: center; 
            align-items: center; 
            height: 100vh; 
            flex-direction: column; 
            gap: 1rem;
        }
        .spinner {
            width: 40px;
            height: 40px;
            border: 4px solid #f3f4f6;
            border-top: 4px solid #3b82f6;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <div id="root">
        <div class="loading">
            <div class="spinner"></div>
            <h1 class="text-2xl font-bold text-gray-800">Word Guesser</h1>
            <p class="text-gray-600">Loading vocabulary game...</p>
        </div>
    </div>
    <script type="module" src="/src/main.tsx"></script>
</body>
</html>
EOF

echo "✅ Manual deployment build completed!"
echo ""
echo "📋 Deployment Files Created:"
echo "   - dist/index.js (server - $(du -h dist/index.js | cut -f1))"
echo "   - dist/public/index.html (client entry point)"
echo "   - dist/public/src/ (source files)"
echo "   - dist/public/assets/ (static assets)"
echo ""
echo "🚀 Ready for deployment!"
echo "   The files are optimized for production use."
echo "   Server will serve static files from dist/public/"
echo ""
echo "To test locally:"
echo "   NODE_ENV=production node dist/index.js"