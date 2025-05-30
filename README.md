# AEP ShopStream Loyalty Demo

This repository contains mock customer data and SQL queries for practicing Adobe Experience Platform (AEP) features such as schema creation, dataset design, and Query Service — specifically for the fictional **ShopStream** loyalty program.

## 📦 Contents

- `shopstream-loyalty-data.json` — Sample customer data for upload into AEP.
- `queries/` — SQL queries for segmentation and analytics using AEP Query Service.
- `screenshots/` — Visuals of schema setup, dataset structure, and more.

## 🧾 Sample Fields

- `customerID`
- `firstName`, `lastName`
- `emailAddress`
- `phoneNumber`
- `dateOfBirth`
- `loyaltyJoinDate`
- `loyaltyTier` (values: silver, gold, platinum)
- `totalPointsEarned`

## 🎯 Use Case: Customer Segmentation for Loyalty Campaign

You can use this data to simulate customer segmentation tasks, such as:

- Finding customers with more than 2000 loyalty points.
- Filtering members who joined in the last 6 months.
- Segmenting by loyalty tier (gold, platinum, etc.).
- Practicing AEP Query Service using nested XDM fields.

## 🛠 How to Use

1. Upload `shopstream-loyalty-data.json` to a dataset in your AEP sandbox.
2. Create or use a schema matching the included sample fields.
3. Run queries from the `queries/` folder inside **Query Service**.
4. View segmentation results and test your campaign logic.

## 📸 Screenshots

Schema
![image](https://github.com/user-attachments/assets/2984fca7-8b7a-4649-9444-3c9af6285a76)

Query output
![image](https://github.com/user-attachments/assets/9e332d80-85db-4536-9533-4eb0754ba573)


## 🔐 Disclaimer

This project contains **mock/demo data only**. No real user information is included.

---

### ✅ Example Query (from `/queries/01_high_loyalty.sql`)

```sql
SELECT
  _adlsplatformapac.customerID AS member_id,
  CONCAT(_adlsplatformapac.firstName, ' ', _adlsplatformapac.lastName) AS full_name,
  _adlsplatformapac.emailAddress AS email,
  _adlsplatformapac.totalPointsEarned AS lifetime_points,
  _adlsplatformapac.loyaltyJoinDate AS join_date
FROM
  SanD_ShopStream_Loyalty_Historical
WHERE
  _adlsplatformapac.totalPointsEarned > 2000
  AND _adlsplatformapac.loyaltyJoinDate >= date_add(DAY, -180, CURRENT_DATE)
