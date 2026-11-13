# Insurance Data Analytics

**End-to-end analysis of 5,000 insurance policies using MySQL, Excel, Power BI and Tableau.**

**Tools:** MySQL | Excel | Power BI | Tableau | PowerPoint

![Power BI Dashboard](powerbi%20dashboard.png)

### Key Findings at a Glance
- **Only 33.6% of policies are active.** 1,682 out of 5,000 policies are active, and the rest are lapsed or terminated.
- **Total claims reached $251.4M**, with Health the highest claim category and Life the lowest ($57.2M).
- **Customers aged 65+ are the largest group**, and policy sales stayed steady at about 480 to 510 per year after 2016.

---

## Project Overview

**Business problem:** An insurance company needs a clear view of its policies, customers, premiums and claims to track performance and make better decisions.

**What I did:**
1. Wrote 21 MySQL queries to answer business questions and calculate KPIs.
2. Built interactive dashboards in Excel, Power BI and Tableau.
3. Found trends in policy status, claims and customer demographics.
4. Summarized the results and recommendations in a presentation.

## Dataset

| Item | Details |
|---|---|
| Domain | Insurance |
| Records | 5,000 policies / customers |
| Time period | December 2014 to December 2024 |
| Policy types | Auto, Health, Life, Property |
| Fields | Customer demographics, policy details, premium amount, coverage amount, claim amount, claim status, policy status |

## Key KPIs

| KPI | Value |
|---|---|
| Total Policies | 5,000 |
| Total Customers | 5,000 |
| Total Claim Amount | $251.4M |
| Average Premium | $1.05K |
| Average Coverage | $254.56K |
| Active Policies | 1,682 (33.64%) |

---

## Dashboards

### Excel Dashboard
Interactive dashboard with slicers for policy type, gender, marital status and claim status.

![Excel Dashboard](excel%20dashboard%20%282%29.png)

### Power BI Dashboard
Executive view of KPIs, premiums vs claims by policy category, customer demographics and policy trends over the years.

![Power BI Dashboard](powerbi%20dashboard.png)

### Tableau Dashboard
Interactive visuals to explore gender, age group, policy type and yearly policy trends.

![Tableau Dashboard](tableau%20dashboard.png)

---

## Key Insights

1. **Retention is the biggest concern.** Policy status is split almost evenly: Active 1,682, Terminated 1,678 and Lapsed 1,640. Only about one in three policies is active.
2. **Claim cost differs by policy type.** Health has the highest total claims and Life has the lowest at $57.2M. Auto and Property are close to each other at about $63M each.
3. **Claims are very high compared to premiums.** Total claims ($251.4M) are far more than total premiums collected (about $5.3M). A real insurer could not run like this, so this is a point to check in the data.
4. **Older customers are the largest group.** The 65+ age group has the most policies, and the 18-24 group has the fewest.
5. **Gender is evenly spread.** Male, female and other each make up about one-third of customers.
6. **Policy sales were steady.** After a peak in 2016 (537 policies), yearly sales stayed between about 480 and 510.
7. **Claim status is evenly split.** Approved 34%, Pending 33% and Denied 33%, so a large share of claims is still pending.
8. **Claim payouts change by month.** They were highest in December (about $22.1M) and lowest in September (about $19.3M).

## Business Recommendations

- **Improve retention:** Find out why policies lapse or terminate, and run renewal campaigns.
- **Control claim cost:** Track claims by policy type and review the high-claim categories.
- **Speed up claim processing:** One-third of claims are pending, which can hurt customer experience.
- **Review pricing:** Claims are much higher than premiums, so premium levels should be checked.
- **Attract younger customers:** The 18-24 group is under-represented.

---

## SQL Analysis

I wrote **21 SQL queries** to answer business questions and calculate KPIs. All queries are in [SQL KPI QUE.sql](SQL%20KPI%20QUE.sql).

**Database:** `insurance_db`
**Tables used:** `customer information`, `policy details`, `claims`

| Area | Business questions answered |
|---|---|
| Core KPIs | Total customers, total policies, total claim amount, average coverage, average premium |
| Policy status | Active percentage, count of active / lapsed / terminated policies, status with the most policies, active-to-inactive ratio |
| Customer demographics | Age group with the most policies, top 3 age groups, gender with the highest participation, male vs female difference |
| Policy types | Types with the most and fewest policies, Auto vs Health comparison, policy count by type |
| Premium trend | Average premium by year, highest vs lowest premium difference |
| Time trend | Number of policies ending each year (2016 to 2034) |

**SQL skills used:**
- Aggregate functions: `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`
- `GROUP BY`, `ORDER BY`, `LIMIT`
- `CASE WHEN` for age groups and conditional counts
- `JOIN` to combine customer and policy tables
- `NULLIF` and `ROUND` for safe ratio calculation
- Date functions such as `YEAR()`
- Data cleaning with `ALTER TABLE ... RENAME COLUMN`

---

## Repository Files

| File | Description |
|---|---|
| [EXCEL Dashboard.xlsx](EXCEL%20Dashboard.xlsx) | Excel workbook with interactive dashboard |
| [Power BI dashboard.pbix](Power%20BI%20dashboard.pbix) | Power BI dashboard file |
| [TABLEAU DASHBOARD.twbx](TABLEAU%20DASHBOARD.twbx) | Tableau packaged workbook |
| [SQL KPI QUE.sql](SQL%20KPI%20QUE.sql) | MySQL queries for KPI calculation |
| [Insurance Data Analysis ppt.pptx](Insurance%20Data%20Analysis%20ppt.pptx) | Project presentation |

## How to Use

1. Download or clone this repository.
2. Open the `.xlsx` file in Excel, the `.pbix` file in Power BI Desktop and the `.twbx` file in Tableau.
3. To run the SQL, create a database named `insurance_db` in MySQL, load the data, and run the queries from the `.sql` file.

---

## About Me

**Sunaina Rajput** | Data Analyst Intern

- GitHub: [sunainabalod](https://github.com/sunainabalod)
- LinkedIn: 
- Email: sunainarajput2670@gmail.com
