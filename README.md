# ecommerce-sentiment-pipeline

End-to-end local data pipeline analyzing customer sentiment across Ulta, Sephora, and competitor subreddits.

## Architecture
Reddit archives (Arctic Shift API) → Python/pandas → PostgreSQL → SQL analytics → Power BI

## Phases
- [x] Phase 1: Extraction (Arctic Shift API) + load to PostgreSQL `raw_reddit_posts`
- [ ] Phase 2: Cleaning & sentiment scoring
- [ ] Phase 3: SQL analytics (CTEs, window functions)
- [ ] Phase 4: Power BI dashboard

## Stack
Python, pandas, SQLAlchemy, PostgreSQL, SQL, Power BI

## Notes
Reddit's official API and `.json` endpoints were shut down in May 2026.
Arctic Shift was chosen as the primary archive source; PullPush was evaluated
but has an aggressive rate limit (~100 req/hour) that makes it unsuitable for bulk extraction.
