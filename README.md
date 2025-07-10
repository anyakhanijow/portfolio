# Portfolio

Technical Skills: SQL, Python, Tableau, R,  Excel, PowerPoint

## Education

B.S., Business Analytics & Information Technology | Rutgers Business School (May 2025)

## Notable Courses 

Investment Modeling with R, Enterprise Architecture, Time Series Modeling, Management Information Systems, Statistical Methods in Business

## Projects 

### SQL Project 

The company needed to gain deeper insights into customer purchasing behavior, product performance, and sales trends across different markets. Inconsistent product data and incomplete customer information made it difficult to analyze revenue drivers and optimize marketing and operational strategies.

Using SQL, I performed a comprehensive data exploration and analysis on transactional invoice and product data. My analyses included:

- Identifying data quality issues (missing product descriptions or null customer IDs)
- Segmenting purchases by customer and country
- Evaluating sales performance by product and time period
- Analyzing revenue contributions from different stock codes
- Understanding product returns and low-quantity order patterns

<a href="https://github.com/anyakhanijow/portfolio/blob/main/IndivProjectAK.sql">SQL Code 

Key Insights: 

- Data integrity issues were uncovered, such as missing product descriptions and null customer IDs, highlighting the need for better master data management.
- Top-selling and least-selling products were identified monthly, enabling targeted promotions and inventory optimization.
- Country-level customer analysis helped understand which markets have more loyal (known) customers versus anonymous transactions.
- Detailed order analysis for specific products provided granular insight into order values and could inform pricing or bundling strategies.
- Returns or negative quantity analysis suggested potential quality issues or fraud, guiding managers to investigate further.



### MIS Project

The streaming industry has become increasingly competitive, with major providers vying for viewership through different content strategies. This project aimed to analyze the content catalogs of top streaming platforms to understand genre distribution, content types, ratings, and pricing value — ultimately informing strategic decisions for content development and customer retention.

I consolidated detailed data from JustWatch US and IMDb, merging provider, show, and rating datasets into a unified database. I then visualized key metrics using Tableau and Excel, focusing on:

- Distribution of content types (TV shows vs. movies)
- Average ratings by provider
- Genre popularity across platforms
- Price-to-content value comparisons


Excel dashboard: 

<a href="https://github.com/anyakhanijow/portfolio/blob/main/Basic%20Dashboard%20Final.xlsx">Streaming Services Data Cleaned


Tableau Dashboard: 

<img width="676" height="540" alt="image" src="https://github.com/user-attachments/assets/4760f854-8b60-4538-9687-3502768746e0" />

Key Insights: 

- Prime Video offers the highest average ratings for movies, while Netflix dominates in the TV show segment. However, Prime Video’s catalog is heavily skewed toward movies, which may limit subscriber engagement since TV shows encourage repeat visits.
- TV shows account for ~75% of overall streaming viewership (based on industry research), indicating an opportunity for platforms focused on movies (like Prime Video) to expand into serial content to increase stickiness and reduce churn.
- Netflix, despite being more expensive, provides higher runtime value since its entire catalog is included without additional rental fees, unlike Prime Video where some content incurs extra costs. This supports its stronger subscriber loyalty.
- Drama and comedy are consistently the most popular genres across all providers. Platforms with lower engagement (e.g., Disney Plus) should consider expanding high-performing drama content to capture broader audiences and boost total watch time.

Managerial Perspective: 

Streaming platforms should optimize their content mix by investing more in TV show production — especially drama and comedy — to drive sustained subscriber engagement. Furthermore, offering complete catalogs without hidden rental costs (like Netflix) can create stronger value propositions, even at higher price points.

** NOTE: The underlying data pipeline was built using SQL to merge multi-source tables (provider, genre, show details, IMDb ratings). This enabled a comprehensive and clean dataset for analysis and visualization, ensuring business insights were based on robust and well-integrated information.



### Investment Modeling with R example 

Using Data.rds, Calculate the ey for: tsla, nvda, nio, f, nflx, aapl, msft, amd, dis, pep, ko
As of the beginning of 2017, buy the top 4 ey's into $5000 equal-weighted portfolio
As of the beginning of 2018, buy the bottom 4 ey's into $5000 equally weighted portfolio (use the same ey's from 2017)
Using quantmod, what was the annual compound return of this strategy as of the beginning of 2019?


<img width="1411" height="843" alt="Screenshot 2025-07-10 at 3 31 55 PM" src="https://github.com/user-attachments/assets/04363d42-9763-4907-ae6e-861865403cad" />

The answer using uniroot would be 12.7% 






