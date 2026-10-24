# E-Commerce Sentiment Project — Plan

## 1. Core Question

Reddit hosts a lot of discussion. Getting a gist of what customers and users
are talking about right now is a good indicator of the general opinion —
whether it's promotions, complaints about customer service, or product
recommendations. It gives a general idea of what the discussion is about at
each point in time.

**Focus: Ulta Beauty.**

This project analyzes the top discussion topics and keywords about Ulta Beauty
on Reddit, and how sentiment varies across those topics.

Scope note: competitors (Sephora, drugstore brands) are a future integration.
For now the goal is to understand the shape of Ulta conversation and decide
which angles are worth expanding later.

## 2. Power BI Dashboard Vision

A 1-page dashboard showing:

1. **Top discussion keywords** — bar chart ranking keywords specific to Ulta
   by mention count.
2. **Topics by category** — grouped column chart showing how many posts fall
   into each topic category (promotions, complaints, shipping, etc.).
3. **Sentiment by topic** — sentiment score (VADER compound, -1 to +1) per
   category, showing which topics skew positive or negative.

## 3. Topic Classification

**Method:** Assign topic labels to each post by matching keywords from a
defined list per category. Multi-label via boolean columns
(`is_promotion`, `is_complaint`, ...). Unmatched posts → `is_other=True`.

**Matching rule:** lowercase input text, regex word boundaries, multi-label
allowed (a post can match multiple categories), unmatched → `is_other`.

**Categories and keywords:**

- `promotions` — TODO: list keywords (e.g., sale, deal, coupon, GWP, 21 days of beauty)
- `complaints` — TODO
- `shipping` — TODO
- `products` — TODO
- `rewards` — TODO
- `platform` — TODO (app/website experience)
- `instore` — TODO
- `other` — catch-all for unmatched posts

Keyword lists are v1 drafts and will be refined after exploration
(Phase 2) shows what language people actually use.

## 4. Sentiment Analysis

**Method:** VADER compound score per post, stored as `sentiment_compound`
(float, -1 to +1).

Sentiment is independent of topic. The dashboard cross-tabulates them —
average sentiment per topic category.

**Known limitations to document in README:**

- Sarcasm may be mis-scored.
- Domain slang may be mis-scored.
- Emoji-heavy posts may be mis-scored.

Will include concrete examples in the README once real data is loaded.

## 5. Phases (Input → Output)

| # | Phase | Input | Output |
|---|-------|-------|--------|
| 1 | Data acquisition (throwaway) | Reddit API data (Arctic Shift) | `data/raw/posts.csv` |
| 2 | Exploration | raw CSV | Notebook answering questions about the data |
| 3 | Cleaning + enrichment (topics + VADER sentiment) | raw CSV | `data/clean/posts_clean.csv` with topic flags and `sentiment_compound` |
| 4 | Load to Postgres | clean CSV | `clean_reddit_posts` table |
| 5 | SQL analytics | Postgres | `sql/01_analysis_queries.sql` — grouped queries ready for dashboard |
| 6 | Power BI | Postgres | 1-page dashboard |

Note: sentiment is computed in Phase 3 (Python), not Phase 5. This lets SQL
analytics query sentiment alongside topics.