# Client-Only Build Instructions

## For Netlify Deployment (Frontend Only)

Since Netlify hosts static sites and your Word Guesser is a client-side React app, here's how to build just the frontend:

### Build Command for Client Only
```bash
# This builds only the React frontend without the Express server
npm run build:client
```

### What This Does
- Builds only the React frontend
- Outputs to `dist/public/` 
- Excludes the Express server (not needed for static hosting)
- Creates optimized, minified files for production

### Deployment Folder
- **Upload folder**: `dist/public/`
- **Contains**: 
  - `index.html` (main page)
  - `assets/` folder with CSS and JS files
  - All optimized and minified for fast loading

### Why This Works
Your Word Guesser app is designed to work client-side with:
- Local storage for game progress
- No database required for basic functionality
- All game logic in the frontend
- Static word lists (no API calls needed)

This makes it perfect for static hosting on Netlify!