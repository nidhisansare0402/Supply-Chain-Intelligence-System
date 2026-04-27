# Supply Chain Intelligence & Optimization System

### Transforming Order Data into Actionable Business Insights

---

## Project Overview

This project focuses on analyzing supply chain and order data to identify inefficiencies in demand, customer behavior, and channel performance.

The goal is to help businesses improve inventory planning, optimize logistics, and enhance decision-making using data-driven insights.

---

## Problem Statement

The company is facing inefficiencies in managing supply chain operations, leading to:

- Late deliveries and poor demand visibility  
- Ineffective inventory planning  
- Uneven demand across regions  
- Lack of clarity on customer and channel performance  

---

## Tools & Technologies

- **Excel** → Data Cleaning & Preparation  
- **MySQL** → Data Analysis  
- **Power BI** → Dashboard & Visualization  
- **Word** → Reporting  

---

## Dataset Summary

- ~28,471 records after cleaning  
- Includes:
  - Order details (date, status)
  - Customer data (age, gender)
  - Product data (category, size)
  - Sales data (amount, quantity)
  - Geography (city, pincode)
  - Channels (Amazon, Myntra, Flipkart, Ajio)

---

## Data Cleaning

- Removed duplicates  
- Standardized categorical values (gender, category, channel)  
- Converted amount to numeric format  
- Fixed date formatting issues  
- Created new features:
  - Month, Year  
  - Revenue Bucket  
  - Customer Type  
  - Customer Segmentation  

---

## SQL Analysis

Key business questions solved:

- Which categories generate highest revenue?
- What are monthly demand trends?
- Which cities drive maximum revenue?
- Which channels perform best?
- What is the repeat customer percentage?
- Who are the top customers?

Techniques used:
- Aggregations (SUM, COUNT, AVG)
- CASE statements
- Subqueries
- Window functions

---

## Dashboard Overview

### Page 1: Executive Overview
- Total Revenue, Orders, AOV, Repeat Customer %
- Monthly trend analysis
- Revenue by category
- Order status distribution

---

### Page 2: Demand & Geography
- Geographic demand distribution (map)
- Top cities by revenue & orders
- Category demand analysis
- Size-wise distribution

---

### Page 3: Customer & Channel Insights
- Revenue & orders by channel
- AOV comparison
- Customer segmentation
- Top customers

---

## Key Insights

- Demand is concentrated in metro cities like Bengaluru, Hyderabad, and Delhi  
- Set and Kurta categories dominate product demand  
- Amazon contributes the highest revenue and order volume  
- Most customers are low to medium spenders  
- A small group of high-value customers drives significant revenue  

---

## Business Recommendations

- Focus inventory in high-demand regions  
- Increase stock for top-performing categories  
- Optimize multi-channel strategy  
- Retain high-value customers with loyalty programs  
- Improve performance in low-demand regions  

---

## Challenges Faced

- Data inconsistencies in categorical columns  
- Currency formatting issues  
- Date conversion errors in SQL  
- Map location inaccuracies  
- Duplicate records  

---

## Learnings

- Importance of clean data  
- Real-world data challenges    
- Building business-focused dashboards  
- Translating insights into recommendations  

---

## Dashboard Preview
<img width="929" height="647" alt="image" src="https://github.com/user-attachments/assets/4495cb51-7de1-4430-a96d-cc15618b3ce7" />


<img width="1041" height="726" alt="image" src="https://github.com/user-attachments/assets/734ca448-a632-4d19-9c2a-e0675c6d8315" />


<img width="1043" height="724" alt="image" src="https://github.com/user-attachments/assets/7ec765e5-0bf6-4e4e-a9b2-5c3f5c7cc8ce" />


---

## Project Structure
<img width="873" height="187" alt="image" src="https://github.com/user-attachments/assets/034fae56-76f5-41f6-bebc-7ff0114e2a09" />


---

## Conclusion

This project demonstrates how data analytics can be used to improve supply chain decision-making by identifying demand patterns, optimizing channels, and understanding customer behavior.

---

## Author

**Nidhi Sansare**
