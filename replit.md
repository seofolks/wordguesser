# Word Guesser - Vocabulary Game Application

## Overview

This is a full-stack vocabulary game application called "Word Guesser" built with React, Express, and Drizzle ORM. Players guess words based on their definitions, track their progress, and maintain game statistics. The application features a modern UI with shadcn/ui components and uses PostgreSQL for data persistence.

## System Architecture

### Frontend Architecture
- **Framework**: React 18 with TypeScript
- **Routing**: Wouter for client-side routing
- **State Management**: TanStack Query (React Query) for server state management
- **UI Components**: shadcn/ui component library with Radix UI primitives
- **Styling**: Tailwind CSS with CSS custom properties for theming
- **Build Tool**: Vite for development and production builds

### Backend Architecture
- **Runtime**: Node.js with Express.js server
- **Language**: TypeScript with ES modules
- **API Design**: RESTful API with JSON responses
- **External Integration**: Dictionary API (dictionaryapi.dev) for word definitions
- **Development**: Hot reload with Vite middleware integration
- **SSR Implementation**: Static HTML pages served for search engines while maintaining client-side app

### Data Storage
- **Database**: PostgreSQL (configured in Replit environment)
- **ORM**: Drizzle ORM with schema-first approach
- **Migrations**: Drizzle Kit for database migrations
- **Connection**: Neon Database serverless driver
- **Schema Location**: Shared schema definitions in `/shared/schema.ts`

## Key Components

### Database Schema
- **users**: User authentication and profiles
- **game_stats**: Player statistics (score, streak, total games)
- **recent_words**: History of attempted words with results

### API Endpoints
- `GET /api/word/random?difficulty=easy|medium|hard`: Fetch random word with definition based on difficulty
- `GET /api/word/three-letter`: Fetch random 3-letter word with definition
- `GET /api/word/four-letter`: Fetch random 4-letter word with definition
- `GET /api/word/five-letter`: Fetch random 5-letter word with definition
- `GET /api/word/six-letter`: Fetch random 6-letter word with definition
- `GET /api/word/seven-letter`: Fetch random 7-letter word with definition
- `GET /api/word/eight-letter`: Fetch random 8-letter word with definition
- `GET /api/word/nine-letter`: Fetch random 9-letter word with definition
- `GET /api/word/ten-letter`: Fetch random 10-letter word with definition
- `POST /api/game/guess`: Submit word guess and get validation
- `GET /api/game/stats`: Retrieve player statistics
- `POST /api/game/stats`: Update player statistics
- `GET /api/game/recent-words`: Get recent word attempts
- `POST /api/game/recent-words`: Add new word attempt

### Game Components
- **DifficultySelector**: Choose between Easy, Medium, and Hard difficulty levels
- **GameArea**: Main game interface with word guessing and adaptive hints
- **GameStats**: Display player statistics (score, streak, games played)
- **RecentWords**: Show history of recent word attempts
- **SessionResults**: Results screen with animations, social sharing, and performance metrics
- **ThreeLetterGame**: Dedicated page for 3-letter word challenges
- **FourLetterGame**: Dedicated page for 4-letter word challenges
- **FiveLetterGame**: Dedicated page for 5-letter word challenges
- **SixLetterGame**: Dedicated page for 6-letter word challenges
- **SevenLetterGame**: Dedicated page for 7-letter word challenges
- **EightLetterGame**: Dedicated page for 8-letter word challenges
- **NineLetterGame**: Dedicated page for 9-letter word challenges
- **TenLetterGame**: Dedicated page for 10-letter word challenges

### Difficulty System
- **Easy**: 4-6 letter words, 10 attempts, up to 4 hints available (Default)
- **Medium**: 7-9 letter words, 10 attempts, up to 4 hints available  
- **Hard**: 10+ letter words, 10 attempts, up to 4 hints available

### Enhanced Hint System
- **First Letter**: Shows the starting letter of the word
- **Synonyms**: Displays similar words or part of speech if no synonyms available
- **Syllables**: Shows the number of syllables in the word
- **Example**: Provides a sentence using the word (with word masked as "___")
- **Vowels**: Lists all unique vowels contained in the word
- **Pattern**: Shows consonants (*) and vowels (_) pattern

## Data Flow

1. **Game Initialization**: Fetch random word from dictionary API
2. **Player Interaction**: Submit guesses through game interface
3. **Validation**: Server validates guesses and updates statistics
4. **State Updates**: React Query manages client-side cache invalidation
5. **Persistence**: Game data stored in PostgreSQL via Drizzle ORM

## External Dependencies

### Dictionary API Integration
- **Service**: dictionaryapi.dev for word definitions
- **Fallback**: Predefined word list for offline functionality
- **Data Structure**: Word, definition, part of speech, and origin

### UI Library Stack
- **Base**: Radix UI primitives for accessibility
- **Styling**: Tailwind CSS with custom CSS variables
- **Icons**: Lucide React icon library
- **Components**: Comprehensive shadcn/ui component set

## Deployment Strategy

### Development Environment
- **Runtime**: Node.js 20 with PostgreSQL 16
- **Command**: `npm run dev` starts development server on port 5000
- **Hot Reload**: Vite middleware integration for instant updates

### Production Build
- **Frontend**: Vite builds to `dist/public` (may timeout due to large dependencies)
- **Backend**: ESBuild bundles server code to `dist/index.js` (working correctly)
- **Deployment**: Autoscale deployment target on Replit
- **Environment**: Production mode with optimized builds

### Known Issue: Build Timeout
The client build process may timeout during deployment due to the large number of dependencies (1700+ modules). The server build completes successfully in ~15ms, but the client build takes too long.

**Solution**: Use the deployment button in Replit, which handles build timeouts automatically with cloud resources.

### Configuration
- **Database**: Environment variable `DATABASE_URL` for connection
- **Port**: External port 80 maps to internal port 5000
- **Static Files**: Express serves built frontend assets
- **SSR**: Server-side rendering working for search engines

## SEO Optimization for Search Engines

### Implementation Status: ✅ COMPLETED

Your Word Guesser application now includes comprehensive SEO optimizations specifically designed to help Google bots crawl and index your content:

#### ✅ **Server-Side SEO Features**
- **Sitemap.xml**: Auto-generated sitemap at `/sitemap.xml` with all 11 pages
- **Robots.txt**: Proper robots.txt at `/robots.txt` allowing all search engine crawling
- **Structured Data**: JSON-LD structured data for rich search results
- **Meta Tag Optimization**: Clean meta tags without deprecated keywords

#### ✅ **Page-Specific SEO**
- **Homepage**: Main application structured data with educational context
- **All Letter Pages**: Individual page structured data with breadcrumbs
- **Challenges Page**: Comprehensive game overview structured data
- **Privacy Policy**: Legal page optimization

#### ✅ **Google Bot Benefits**
- **Content Discovery**: Sitemap helps bots find all pages efficiently
- **Content Understanding**: Structured data explains your educational game content
- **Crawl Instructions**: Robots.txt provides clear crawling guidelines
- **Rich Snippets**: Structured data enables enhanced search results

#### ✅ **SEO Best Practices Implemented**
- Removed outdated keywords meta tags (Google ignores these since 2009)
- Added educational and game-specific structured data
- Implemented proper canonical URLs
- Added breadcrumb structured data for navigation context

**Result**: Your application is now fully optimized for search engine crawling and indexing, making it discoverable through Google search while maintaining your current client-side architecture.

## Changelog

```
Changelog:
- July 13, 2025. ADDED: Google Search Console verification meta tag to all pages for search engine verification
- July 12, 2025. DEPLOYMENT ISSUE DIAGNOSED: Build process times out due to 1700+ dependencies, but production server works correctly
- July 12, 2025. VERIFIED: Production server starts successfully and serves correct content on port 5000
- July 12, 2025. SOLUTION: Use Replit deployment button which handles build timeouts with cloud resources
- July 12, 2025. COMPLETED: True Server-Side Rendering (SSR) implementation without HTML files - serves React-rendered content directly to Google bots
- July 12, 2025. Fixed SSR template path to use client/index.html instead of non-existent dist/public/index.html  
- July 12, 2025. Removed static HTML pages approach and implemented proper SSR middleware that injects content into #root div
- July 12, 2025. Fixed ES module imports in server routes (removed require statements for fs and path)
- July 12, 2025. Successfully implemented bot detection that serves server-rendered content to search engines while maintaining client-side app for users
- July 12, 2025. COMPLETED: Full SSR implementation with static HTML pages for ALL game pages (21 total pages)
- July 12, 2025. Created static HTML versions for all 8 individual letter games (3-10 letters) with proper no-JS fallback
- July 12, 2025. Implemented bot detection and automatic redirection to static pages for search engines
- July 12, 2025. All pages now show content when JavaScript is disabled, including individual game pages
- July 12, 2025. Successfully implemented server-side rendering (SSR) with static HTML pages for search engines
- July 12, 2025. Created /index.html and /challenges.html with full content visible in page source
- July 12, 2025. Added static HTML pages to sitemap.xml and robots.txt for proper search engine discovery
- July 12, 2025. Implemented SSR solution that serves static HTML to bots while maintaining client-side app for users
- July 12, 2025. Verified content is now visible in page source and accessible when JavaScript is disabled
- July 12, 2025. Implemented comprehensive SEO optimization for Google bot crawling without full SSR conversion
- July 12, 2025. Added sitemap.xml and robots.txt endpoints for search engine discovery
- July 12, 2025. Created StructuredData component with JSON-LD for rich search results
- July 12, 2025. Enhanced server routes with SEO functionality while maintaining client-side architecture
- July 12, 2025. Optimized mobile navigation layout with responsive sizing and positioning
- July 12, 2025. Changed Home navigation from button to text link for cleaner mobile appearance
- July 12, 2025. Fixed keywords and robots meta tag removal from HTML template
- July 12, 2025. Updated header navigation to link "Challenges" button directly to the new Challenges page
- July 12, 2025. Simplified footer navigation across all pages to link to central Challenges page instead of individual game links
- July 12, 2025. Changed footer "Challenges" sections to "Explore More" with single "View All Challenges" link
- July 12, 2025. Updated Privacy Policy and Challenges page footers with appropriate navigation links
- July 12, 2025. Removed dropdown menu from navigation header for cleaner, more direct navigation experience
- July 12, 2025. Created dedicated Challenges page with comprehensive overview of all 8 word length games (3-10 letters)
- July 12, 2025. Fixed breadcrumb navigation DOM nesting error by removing nested anchor tags in wouter Link components
- July 12, 2025. Added clickable breadcrumb navigation linking all letter pages back to the new Challenges page
- July 12, 2025. Implemented card-based design for Challenges page with difficulty levels, descriptions, and example words
- July 12, 2025. Added breadcrumb navigation component to all 8 letter pages (3-10 letters) for improved user experience
- July 12, 2025. Completed branding consistency by removing all remaining "WordWiz" references and replacing with "Word Guesser"
- July 12, 2025. Fixed favicon serving by adding static file serving for public directory in server configuration
- July 11, 2025. Removed X-Robots-Tag noindex settings from all pages to allow search engine indexing
- July 11, 2025. Updated SEOHead component to always use 'index, follow' for search engine optimization
- July 11, 2025. Fixed remaining "WordWiz" references to "Word Guesser" in meta tags and app names
- July 11, 2025. Added copyright footer strip with "© 2025 Word Guesser. All rights reserved."
- July 11, 2025. Removed "Powered by Dictionary API" from all page footers
- July 11, 2025. Standardized footer layout with consistent spacing and Privacy Policy links
- July 11, 2025. Applied consistent spacing between Recent Words and How to Play sections
- July 08, 2025. Changed brand name from "WordWiz" to "Word Guesser" across all pages and components
- July 08, 2025. Updated all SEO meta tags, titles, and descriptions to reflect new brand name
- July 08, 2025. Added comprehensive "How to Play" section with 6-step tutorial on homepage
- July 08, 2025. Added FAQ section with 8 common questions and answers about gameplay
- July 08, 2025. Implemented complete SEO optimization with custom meta tags for all 9 pages
- July 08, 2025. Added SEOHead component for dynamic meta tag management with Open Graph and Twitter Cards
- June 30, 2025. Created 7 additional word length pages (3, 4, 6, 7, 8, 9, 10 letters) with same functionality as five-letter mode
- June 30, 2025. Added comprehensive word lists for each length with 50+ curated words per category
- June 30, 2025. Implemented dedicated API endpoints for each word length with exclude-words functionality
- June 30, 2025. Created dedicated five-letter word game page with same functionality but no difficulty selection
- June 30, 2025. Added navigation between main game and five-letter mode with cross-page links
- June 30, 2025. Implemented separate API endpoint for five-letter words with dedicated word list
- June 30, 2025. Added auto-continue session system with 5-second countdown after results
- June 30, 2025. Implemented word tracking to prevent repeating words within same session
- June 30, 2025. Added 10-guess session system with results screen and social sharing
- June 30, 2025. Implemented animated results screen with performance-based scoring and feedback
- June 30, 2025. Added session progress tracking with visual progress bar
- June 30, 2025. Set Easy difficulty as default starting level for new players
- June 30, 2025. Updated all difficulty levels to 10 attempts per word (standardized guessing)
- June 30, 2025. Added bidirectional hint navigation with "Previous Hint" button on hints 2-4
- June 30, 2025. Updated all difficulty levels to have 4 hints available
- June 30, 2025. Fixed hint numbering to increment sequentially (Hint #1, #2, #3, #4)
- June 30, 2025. Removed point-cost system from hints - all hints are now free to use
- June 30, 2025. Enhanced hint system with 6 advanced hint types using Dictionary API data
- June 30, 2025. Removed redundant word length hint (already shown in dashboard)
- June 30, 2025. Added difficulty level system with Easy/Medium/Hard modes
- June 25, 2025. Initial setup - Complete word guessing game with dictionary API integration
```

## User Preferences

```
Preferred communication style: Simple, everyday language.
```