# Sales Coach

AI-powered sales demo practice application. Practice your SaaS sales demo with real-time AI coaching and realistic prospect simulation.

## Features

- **Interactive Setup**: Provide your sales role, methodology, and product info
- **Dual AI Coaches**: Real-time coaching feedback + realistic client responses
- **Smart Product Learning**: Learn from product description or website URL
- **Multiple Sales Methodologies**: BANT, MEDDIC, GAP Selling, Challenger Sale, and more

## Quick Start

### Prerequisites
- Node.js 18+
- OpenAI API key

### Installation

```bash
git clone https://github.com/Wappsy/sales-coach.git
cd sales-coach
npm install
cp .env.example .env.local
# Add your OpenAI API key to .env.local
npm run dev
```

Visit [http://localhost:3000](http://localhost:3000)

## Deployment

Deploy to Vercel with one click - add `OPENAI_API_KEY` to environment variables.

##Tech Stack

- Next.js 15 (App Router)
- React 19
- TypeScript
- Shadcn/ui + Tailwind CSS
- OpenAI GPT-4
- Vercel

## License

MIT
