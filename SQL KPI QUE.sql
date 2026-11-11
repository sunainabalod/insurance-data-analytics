CREATE DATABASE IF NOT EXISTS insurance_db;
USE insurance_db;

-- 1. What is the total number of customers available in the policy database?
SELECT COUNT(*) AS total_customers 
FROM `customer information`;


-- 2. What is the total number of policies issued?
SELECT COUNT(*) AS total_policies 
FROM `policy details`;

-- 3. What is the total claim amount generated from all policies?
SELECT SUM(`Claim Amount`) AS total_claim_amount 
FROM `claims`;


-- 4. What is the average coverage amount per policy?
SELECT AVG(`Coverage Amount`) AS avg_coverage_amount 
FROM `policy details`;

-- 5. What is the average premium amount collected per policy?
SELECT AVG(`Premium Amount`) AS avg_premium_amount 
FROM `policy details`;


-- 6. What percentage of policies are currently active?
SELECT 
    (COUNT(CASE WHEN `Status` = 'Active' THEN 1 END) * 100.0 / COUNT(*)) AS active_policy_percentage
FROM `policy details`;


-- 7. How many policies are in active, lapsed, and terminated status?
SELECT 
    `Status`, 
    COUNT(*) AS policy_count
FROM `policy details`
GROUP BY `Status`;


-- 8. Which policy status has the highest number of policies?
SELECT 
    `Status`, 
    COUNT(*) AS policy_count
FROM `policy details`
GROUP BY `Status`
ORDER BY policy_count DESC
LIMIT 1;


-- 9. What is the ratio between active policies and inactive policies?
SELECT 
    COUNT(CASE WHEN `Status` = 'Active' THEN 1 END) AS active_policies,
    COUNT(CASE WHEN `Status` <> 'Active' THEN 1 END) AS inactive_policies,
    ROUND(
        COUNT(CASE WHEN `Status` = 'Active' THEN 1 END) / 
        NULLIF(COUNT(CASE WHEN `Status` <> 'Active' THEN 1 END), 0), 
        2
    ) AS active_to_inactive_ratio
FROM `policy details`;


ALTER TABLE `customer information` RENAME COLUMN `ï»¿Customer ID` TO `Customer_ID`;        --------- extra step



-- 10. Which age group has the highest number of policies?
SELECT 
    CASE 
        WHEN c.`Age` BETWEEN 18 AND 29 THEN '18-29'
        WHEN c.`Age` BETWEEN 30 AND 39 THEN '30-39'
        WHEN c.`Age` BETWEEN 40 AND 49 THEN '40-49'
        WHEN c.`Age` BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS policy_count
FROM `policy details` p
JOIN `customer information` c 
    ON p.`Customer ID` = c.`Customer_ID`
GROUP BY age_group
ORDER BY policy_count DESC
LIMIT 1;


-- 11. Identify the top three age groups by policy count
SELECT 
    CASE 
        WHEN c.`Age` BETWEEN 18 AND 29 THEN '18-29'
        WHEN c.`Age` BETWEEN 30 AND 39 THEN '30-39'
        WHEN c.`Age` BETWEEN 40 AND 49 THEN '40-49'
        WHEN c.`Age` BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS total_policies
FROM `policy details` p
JOIN `customer information` c 
    ON p.`Customer ID` = c.`Customer_ID`
GROUP BY age_group
ORDER BY total_policies DESC
LIMIT 3;



-- 12. Which gender has the highest policy participation?
SELECT 
    c.`Gender`,
    COUNT(*) AS policy_count
FROM `policy details` p
JOIN `customer information` c 
    ON p.`Customer ID` = c.`Customer_ID`
GROUP BY c.`Gender`
ORDER BY policy_count DESC
LIMIT 1;



-- 13. What is the difference between male and female policy counts?
SELECT 
    SUM(CASE WHEN c.`Gender` = 'Male' THEN 1 ELSE 0 END) AS male_count,
    SUM(CASE WHEN c.`Gender` = 'Female' THEN 1 ELSE 0 END) AS female_count,
    ABS(
        SUM(CASE WHEN c.`Gender` = 'Male' THEN 1 ELSE 0 END) - 
        SUM(CASE WHEN c.`Gender` = 'Female' THEN 1 ELSE 0 END)
    ) AS policy_count_difference
FROM `policy details` p
JOIN `customer information` c 
    ON p.`Customer ID` = c.`Customer_ID`;



-- 14. Which policy type has the maximum number of policies?
SELECT 
    `Policy Type`, 
    COUNT(*) AS policy_count
FROM `policy details`
GROUP BY `Policy Type`
ORDER BY policy_count DESC
LIMIT 1;



-- 15. Which policy type has the minimum number of policies?
SELECT 
    `Policy Type`, 
    COUNT(*) AS policy_count
FROM `policy details`
GROUP BY `Policy Type`
ORDER BY policy_count ASC
LIMIT 1;



-- 16. Compare Auto and Health policy counts.
SELECT 
    `Policy Type`, 
    COUNT(*) AS policy_count
FROM `policy details`
WHERE `Policy Type` IN ('Auto', 'Health')
GROUP BY `Policy Type`;



-- 17. What is the total number of policies across all policy types?
SELECT 
    `Policy Type`, 
    COUNT(*) AS total_policies
FROM `policy details`
GROUP BY `Policy Type`
ORDER BY total_policies DESC;



-- 18. What is the average premium amount across all policies?
SELECT 
    AVG(`Premium Amount`) AS avg_premium_amount
FROM `policy details`;

-- 19. Is the premium growth trend increasing or decreasing over time?
SELECT 
    YEAR(`Policy Start Date`) AS policy_year, 
    AVG(`Premium Amount`) AS avg_premium_amount
FROM `policy details`
GROUP BY policy_year
ORDER BY policy_year ASC;



-- 20. Calculate the difference between the highest and lowest premium growth rates.
SELECT 
    MAX(`Premium Amount`) - MIN(`Premium Amount`) AS premium_difference
FROM `policy details`;



-- 21. What is the yearly trend of policies ending from 2016 to 2034?
SELECT 
    YEAR(`Policy End Date`) AS ending_year, 
    COUNT(*) AS ending_policies_count
FROM `policy details`
WHERE YEAR(`Policy End Date`) BETWEEN 2016 AND 2034
GROUP BY ending_year
ORDER BY ending_year ASC;
