# Sales Coach - Setup & Development Guide

## Project Overview

Sales Coach is an AI-powered web application that enables sales professionals to practice SaaS demo pitches with real-time AI coaching and realistic prospect simulation.

**Repository**: https://github.com/Wappsy/sales-coach

## Technology Stack

### Frontend
- **Next.js 15** - Latest React framework with App Router
- **React 19** - Latest React version  
- **TypeScript** - Type-safe development
- **Shadcn/ui** - Modern component library
- **Tailwind CSS 4** - Utility-first styling

### Backend
- **Next.js API Routes** - Serverless functions
- **Node.js Runtime**

### AI/ML
- **OpenAI GPT-4 Mini** - For coaching and client simulation
- **Function Calling** - Structured responses

### Infrastructure & Deployment
- **Vercel** - Recommended hosting (optimized for Next.js)
- **GitHub** - Version control

## Project Architecture

```
sales-coach/
├── src/
│   ├── app/
│   │   ├── api/
│   │   │   ├── coach/          # Coaching endpoint
│   │   │   └── product/        # Product processing endpoint
│   │   ├── layout.tsx          # Root layout
│   │   ├── page.tsx            # Main entry point
│   │   └── globals.css         # Global styles
│   ├── components/
│   │   ├── SetupForm.tsx       # 3-step onboarding form
│   │   ├── ChatView.tsx        # Main chat interface
│   │   └── ui/                 # Shadcn components
│   └── lib/
│       ├── ai-service.ts       # OpenAI integration
│       ├── types.ts            # TypeScript interfaces
│       └── utils.ts            # Utility functions
├── public/                      # Static assets
├── package.json
├── tsconfig.json
├── next.config.ts
├── tailwind.config.ts
└── vercel.json                 # Vercel configuration
```

## Getting Started

### 1. Clone & Setup

```bash
git clone https://github.com/Wappsy/sales-coach.git
cd sales-coach
npm install
```

### 2. Environment Configuration

```bash
cp .env.example .env.local
```

Add your OpenAI API key:
```
OPENAI_API_KEY=sk-proj-xxxxxxxxxxxxx
```

### 3. Run Locally

```bash
npm run dev
```

Visit http://localhost:3000

### 4. Build for Production

```bash
npm run build
npm start
```

## Feature Breakdown

### Phase 1: Setup
Users provide:
- **Sales Role** - Their position (AE, SDR, Manager, etc.)
- **Sales Methodology** - BANT, MEDDIC, GAP, Challenger Sale, etc. (optional)
- **Product Information** - Via description or website URL

### Phase 2: AI Product Analysis
The AI:
- Extracts key features
- Identifies target market
- Creates structured summary
- Prepares coaching context

### Phase 3: Practice Session
Interactive 3-way conversation:
1. **User** - Delivers pitch/response
2. **AI Client** - Responds realistically with objections
3. **AI Coach** - Provides real-time feedback based on sales methodology

## API Endpoints

### POST /api/coach
Handles both coaching and client responses.

**Request**:
```json
{
  "userMessage": "Here's our product demo",
  "type": "client|coach",
  "context": {
    "userRole": "Account Executive",
    "salesMethodology": "BANT",
    "productInfo": { /* product details */ },
    "conversationHistory": [ /* previous messages */ ]
  }
}
```

**Response**:
```json
{
  "message": "Great opening! Here's my feedback..."
}
```

### POST /api/product
Processes product information.

**Request**:
```json
{
  "source": "description|website",
  "data": {
    "description": "Our product is...",
    // OR
    "url": "https://example.com"
  }
}
```

**Response**:
```json
{
  "name": "Product Name",
  "description": "Short description",
  "keyFeatures": ["Feature 1", "Feature 2"],
  "targetMarket": "Target customer profile",
  "summary": "Detailed summary for coaching"
}
```

## Deployment to Vercel

### Option 1: Via Vercel CLI

```bash
npm install -g vercel
vercel
```

### Option 2: Via GitHub Integration

1. Push code to GitHub
2. Go to vercel.com and import the repository
3. Set environment variables in Vercel dashboard:
   - `OPENAI_API_KEY=your_key`
4. Deploy!

## Environment Setup for Development

### Required
- `OPENAI_API_KEY` - OpenAI API key (get from https://platform.openai.com)

### Optional
- `NODE_ENV` - Set to "development" or "production"

## Key Implementation Details

### AI Coaching System
- Uses GPT-4 Mini for cost-effective coaching
- Maintains conversation context for continuous improvement
- Tailors feedback based on selected sales methodology
- Real-time streaming responses

### Product Research
- Web scraping with content extraction
- HTML parsing and summarization
- Structured JSON output for consistent coaching

### UI/UX Components
- Multi-step form with progress indicators
- Real-time chat interface
- Color-coded messages (user=blue, client=amber, coach=green)
- Responsive design for all screen sizes

## Performance Optimizations

- Next.js automatic code splitting
- Image optimization via next/image
- CSS-in-JS with Tailwind's JIT compilation
- API route caching where applicable
- Client-side state management with React hooks

## Security Considerations

1. **API Keys**
   - Never commit .env.local to git
   - Use Vercel environment variables for production
   - Rotate keys regularly

2. **Data Privacy**
   - No persistent storage of conversation data
   - OpenAI API handles data per their privacy policy
   - Users should not share sensitive company info

3. **Rate Limiting**
   - Implement rate limiting in production
   - Monitor OpenAI API usage
   - Set spending limits on OpenAI account

## Common Issues & Solutions

### Issue: OpenAI API errors
**Solution**: Verify API key is correct and has sufficient credits

### Issue: Slow responses
**Solution**: Check internet connection, OpenAI service status

### Issue: Product extraction fails
**Solution**: Ensure website is publicly accessible and not behind authentication

## Future Enhancements

- [ ] Session recording and playback
- [ ] Performance analytics dashboard
- [ ] Custom role profiles
- [ ] Team collaboration features
- [ ] CRM integration
- [ ] Voice input/output
- [ ] Multi-language support
- [ ] Export reports

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## Support

For issues and questions:
- Create a GitHub issue
- Check existing issues for solutions
- Review the deployment docs

## License

MIT - Feel free to use and modify

---

**Happy practicing! Your users will master their sales demos in no time.**
