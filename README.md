# Cyclistic Bike-Share Case Study

**Google Data Analytics Professional Certificate – Capstone Project**
Nick Khurshid | April 2026

## Business Task

> *"How do annual members and casual riders use Cyclistic bikes differently?"*

The goal of this analysis is to identify behavioural differences between casual riders and annual members across time, location, and ride patterns — and to translate these insights into actionable marketing strategies that convert casual riders into annual members.

**Stakeholders:** Lily Moreno (Director of Marketing), Cyclistic Executive Team

## Interactive Dashboard

**[View Full Tableau Dashboard](https://public.tableau.com/app/profile/nick.khurshid)**

## Project Structure

```
cyclistic-case-study/
│
├── README.md                                ← You are here
│
├── docs/
│   └── Cyclistic_Case_Study_Analysis.docx   ← Full written analysis
│
├── presentation/
│   └── cyclistic_improved.pptx              ← Stakeholder presentation
│
├── sql/
│   ├── 01_data_consolidation.sql            ��� Combining 12 CSV files
│   ├── 02_data_cleaning.sql                 ← Cleaning & feature engineering
│   └── 03_analysis_queries.sql              ← Key analytical queries
│
└── assets/
    └── (Tableau chart screenshots)
```

## Tools & Technologies

| Tool | Purpose |
|---|---|
| **Google Cloud Storage** | Raw CSV file storage (`gs://cyclistic-data-nickkhurshid/`) |
| **Google BigQuery** | Data consolidation, cleaning & SQL analysis |
| **Tableau** | Interactive data visualizations & dashboard |
| **PowerPoint** | Stakeholder presentation |

**Data Source:** [Divvy Bikeshare 2023](https://divvybikes.com/system-data) — 12 monthly CSV files, 5M+ trip records, 13 data fields. Publicly available under Motivate International Inc.'s license.

## Key Findings

| Category | Casual Riders | Annual Members |
|---|---|---|
| **Ride Frequency** | Peaks on Saturday & Sunday | Steady Mon–Fri |
| **Ride Duration** | Significantly longer (leisure) | Shorter, consistent (commuting) |
| **Peak Times** | Afternoons | 08:00 AM & 05:00 PM |
| **Seasonality** | Sharp drop in winter | Stable year-round |
| **Station Patterns** | Parks, lakefront, tourist spots | Offices, transit hubs, residential |

**Core Insight:** Members ride Cyclistic for **functional commuting** on a fixed schedule. Casual riders use it for **recreational purposes**, driven by weather and weekends.

## Recommendations

### 1. Weekend-Only Membership Plan
Casual riders peak on Saturdays and Sundays. A leisure-focused membership tier targeting weekend usage directly matches their behavior and lowers the barrier to conversion.

### 2. Summer Conversion Campaign
Casual ridership surges May–August. Targeted digital promotions during peak season — such as a "First Year Discount" — maximize visibility when casual riders are most active.

### 3. Value-Based Pricing Communication
Use personalized savings estimates to show casual riders how much they would have saved on their specific trips with a membership. Real usage data makes the conversion argument compelling.

## File Descriptions

| File | Description |
|---|---|
| `docs/Cyclistic_Case_Study_Analysis.docx` | Complete written analysis following the Ask → Prepare → Process → Analyze → Share → Act framework |
| `presentation/cyclistic_improved.pptx` | 10-slide stakeholder presentation covering all 5 insights and 3 recommendations |
| `sql/01_data_consolidation.sql` | UNION ALL query to merge 12 monthly CSV files into one table |
| `sql/02_data_cleaning.sql` | Cleaning steps: duplicate removal, duration filtering, NULL handling, feature engineering |
| `sql/03_analysis_queries.sql` | Analytical queries: avg duration, rides by day/hour/month, station patterns |

## Contact

**Nick Khurshid**

- [Tableau Public](https://public.tableau.com/app/profile/nick.khurshid)
- [LinkedIn](https://www.linkedin.com/in/nick-khurshid-484672251/)