# GitHub + Netlify Deployment Guide

## Complete Setup for Automatic Deployments

This method connects your React app to GitHub, then links GitHub to Netlify for automatic deployments whenever you make changes.

## Step 1: Prepare Your Code for GitHub

### Create .gitignore (if not exists)
Make sure these folders/files are ignored:
```
node_modules/
dist/
.env
.env.local
.DS_Store
*.log
```

### Verify Your Files
Your project should include:
- ✅ `netlify.toml` (already created)
- ✅ All React source code in `client/` folder
- ✅ `package.json` with build scripts
- ✅ `vite.config.ts` configured correctly

## Step 2: Push to GitHub

### Option A: Create New Repository
1. **Go to GitHub**: Visit [github.com](https://github.com)
2. **Sign in**: Use your GitHub account
3. **New Repository**: Click "New" or "+" → "New repository"
4. **Repository Settings**:
   - Name: `word-guesser-game` (or your preferred name)
   - Visibility: Public (required for free Netlify)
   - Don't initialize with README (you already have files)
5. **Create Repository**

### Option B: Use Existing Repository
Skip to Step 3 if you already have a GitHub repository.

## Step 3: Upload Your Code to GitHub

### Method 1: Command Line (if you have Git installed)
```bash
# Initialize git in your project
git init

# Add all files
git add .

# Commit files
git commit -m "Initial Word Guesser React app"

# Add your GitHub repository as origin
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO-NAME.git

# Push to GitHub
git push -u origin main
```

### Method 2: GitHub Web Interface (Easier)
1. **Go to your new repository** on GitHub
2. **Click "uploading an existing file"**
3. **Drag your entire project folder** (except node_modules)
4. **Commit changes** with message "Initial Word Guesser app"

## Step 4: Connect Netlify to GitHub

### 1. Sign up for Netlify
- Go to [netlify.com](https://netlify.com)
- Click "Sign up"
- **Choose "Sign up with GitHub"** (this connects accounts automatically)

### 2. Import from Git
- On Netlify dashboard, click **"Add new site"**
- Select **"Import an existing project"**
- Choose **"Deploy with GitHub"**
- **Authorize Netlify** to access your GitHub account

### 3. Select Repository
- Find your `word-guesser-game` repository
- Click **"Deploy"** or **"Configure"**

### 4. Configure Build Settings
**Important**: Set these exact settings:

```
Base directory: (leave empty)
Build command: vite build
Publish directory: dist/public
```

### 5. Deploy Site
- Click **"Deploy site"**
- Wait 2-3 minutes for first build
- Your site will be live at `random-name.netlify.app`

## Step 5: Customize Your Site

### Change Site Name
1. Go to **Site settings** → **General**
2. Click **"Change site name"**
3. Enter: `word-guesser-yourusername` or similar
4. Your new URL: `word-guesser-yourusername.netlify.app`

### Add Custom Domain (Optional)
1. Go to **Domain settings**
2. Click **"Add custom domain"**
3. Enter your domain name
4. Follow DNS setup instructions

## Step 6: Automatic Updates

Now whenever you make changes:

### Local Development
1. **Make changes** to your React code
2. **Test locally**: `npm run dev`
3. **Commit changes**: Add and commit to Git
4. **Push to GitHub**: `git push`
5. **Automatic deployment**: Netlify rebuilds and deploys automatically

### GitHub Web Interface
1. **Edit files** directly on GitHub
2. **Commit changes**
3. **Automatic deployment** happens within 2-3 minutes

## Step 7: Monitor Deployments

### Netlify Dashboard
- **Deploy log**: See build progress and errors
- **Deploy previews**: Test changes before going live
- **Analytics**: Track site visits and performance

### Build Status
- ✅ **Success**: Green checkmark, site updated
- ❌ **Failed**: Red X, check logs for errors
- 🟡 **Building**: Yellow dot, deployment in progress

## Troubleshooting

### Common Issues

**Build Fails**
- Check build logs in Netlify dashboard
- Verify `vite build` works locally
- Ensure all dependencies in `package.json`

**Page Not Found**
- Verify `netlify.toml` is in root directory
- Check publish directory is `dist/public`

**Assets Not Loading**
- Ensure build completed successfully
- Check browser console for errors

### Getting Help
- **Netlify Support**: Excellent free support chat
- **Build Logs**: Always check these first for errors
- **GitHub Issues**: Repository-specific problems

## What You Get

### Free Tier Includes
- **100GB bandwidth** per month
- **Unlimited personal projects**
- **HTTPS** with automatic SSL
- **Global CDN** for fast loading
- **Form handling** for contact forms
- **Deploy previews** for testing

### Automatic Features
- **Branch deployments**: Test feature branches
- **Rollback**: Restore previous versions instantly  
- **Performance optimization**: Automatic image optimization
- **Security headers**: Already configured in netlify.toml

## Your Live App Features

All Word Guesser features work perfectly:
- ✅ All 8 word length games (3-10 letters)
- ✅ Progressive difficulty levels
- ✅ Hint system with multiple types
- ✅ Score tracking and statistics
- ✅ Session management (10-word challenges)
- ✅ Mobile responsive design
- ✅ Local storage for game progress
- ✅ SEO optimization with meta tags

## Next Steps After Deployment

1. **Test your live site** thoroughly
2. **Share the URL** with others
3. **Monitor performance** in Netlify analytics
4. **Make improvements** and push updates
5. **Consider custom domain** if needed

Your Word Guesser app will be live with professional hosting, automatic deployments, and all the features working perfectly!