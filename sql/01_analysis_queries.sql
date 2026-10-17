SELECT COUNT(*) FROM raw_reddit_posts;

SELECT subreddit, COUNT(*) AS n,
       ROUND(AVG(score), 1) AS avg_score,
       MIN(created_datetime) AS earliest,
       MAX(created_datetime) AS latest
FROM raw_reddit_posts
GROUP BY subreddit
ORDER BY n DESC;

SELECT subreddit, title, score, created_datetime
FROM raw_reddit_posts
WHERE selftext = '' OR selftext IS NULL
LIMIT 5;