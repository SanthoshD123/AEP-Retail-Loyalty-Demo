# 🛍️ AEP ShopStream Loyalty Demo

A comprehensive demonstration dataset and query collection for **Adobe Experience Platform (AEP)** featuring a fictional loyalty program called **ShopStream**. This repository provides hands-on practice with schema creation, dataset management, Query Service, and customer segmentation workflows.

## 🎯 Purpose

This demo enables you to:
- Practice AEP schema design and XDM field mapping
- Learn Query Service SQL syntax with nested field structures
- Experiment with customer segmentation strategies
- Test loyalty program analytics and reporting
- Understand AEP data ingestion patterns

## 📂 Repository Structure

```
├── README.md                           # This file
├── shopstream-loyalty-data.json        # Sample customer dataset (10 records)
└── queries/
    ├── 01_basic_query.sql             # Basic data retrieval
    ├── 02_filter_high_points.sql      # Platinum tier filtering
    └── 03_segment_recent_joiners.sql  # High-value customer segmentation
```

## 📊 Dataset Overview

**File:** `shopstream-loyalty-data.json`  
**Records:** 10 sample customers  
**Format:** JSON with nested XDM structure under `_adlsplatformapac`

### Data Schema

| Field | Type | Description | Sample Values |
|-------|------|-------------|---------------|
| `customerID` | String | Unique customer identifier | CUST001, CUST002 |
| `firstName` | String | Customer first name | John, Jane |
| `lastName` | String | Customer last name | Doe, Smith |
| `emailAddress` | String | Primary email address | john.doe@example.com |
| `phoneNumber` | String | Phone number with country code | +11234567890 |
| `dateOfBirth` | Date | Birth date (YYYY-MM-DD) | 1985-03-25 |
| `loyaltyJoinDate` | Date | Program enrollment date | 2020-01-15 |
| `loyaltyTier` | String | Current tier level | silver, gold, platinum |
| `totalPointsEarned` | Integer | Lifetime points accumulated | 600 - 5100 |

### Data Distribution
- **Silver Tier:** 3 customers (600-950 points)
- **Gold Tier:** 4 customers (1500-3100 points)  
- **Platinum Tier:** 3 customers (4200-5100 points)
- **Join Dates:** 2018-2023 (5-year span)
- **Age Range:** Born 1978-1995

## 🚀 Getting Started

### Prerequisites
- Access to Adobe Experience Platform sandbox
- Query Service enabled
- Basic understanding of SQL and XDM schemas

### Step 1: Schema Creation
1. Navigate to **Schemas** in AEP
2. Create a new schema based on **XDM Individual Profile**
3. Add field group or create custom fields matching the data structure
4. Enable schema for **Profile** if needed

### Step 2: Dataset Setup
1. Go to **Datasets** and create a new dataset
2. Select your created schema
3. Enable for **Profile** if using Real-time Customer Profile

### Step 3: Data Ingestion
1. Upload `shopstream-loyalty-data.json` via:
   - **Batch ingestion** (recommended for demo)
   - **Streaming ingestion** (for real-time scenarios)
   - **Source connectors** (for production workflows)

### Step 4: Query Execution
1. Open **Query Service** 
2. Run queries from the `queries/` folder
3. Modify table name `SanD_ShopStream_Loyalty_Historical` to match your dataset

## 📝 Sample Queries

### Basic Customer Listing
```sql
-- Get all customers with formatted names
SELECT
  _adlsplatformapac.customerID AS member_id,
  CONCAT(_adlsplatformapac.firstName, ' ', _adlsplatformapac.lastName) AS full_name,
  _adlsplatformapac.loyaltyTier AS tier,
  _adlsplatformapac.totalPointsEarned AS points
FROM SanD_ShopStream_Loyalty_Historical
LIMIT 50;
```

### High-Value Customer Segmentation
```sql
-- Find gold/platinum customers with 3000+ points
SELECT
  _adlsplatformapac.customerID,
  _adlsplatformapac.emailAddress,
  _adlsplatformapac.loyaltyTier,
  _adlsplatformapac.totalPointsEarned
FROM SanD_ShopStream_Loyalty_Historical
WHERE
  _adlsplatformapac.totalPointsEarned > 3000
  AND _adlsplatformapac.loyaltyTier IN ('gold', 'platinum');
```

### Recent Joiners Analysis
```sql
-- Members who joined in last 6 months with high engagement
SELECT
  _adlsplatformapac.customerID,
  _adlsplatformapac.loyaltyJoinDate,
  _adlsplatformapac.totalPointsEarned
FROM SanD_ShopStream_Loyalty_Historical
WHERE
  _adlsplatformapac.loyaltyJoinDate >= date_add(DAY, -180, CURRENT_DATE)
  AND _adlsplatformapac.totalPointsEarned > 2000;
```

## 🎯 Use Cases & Learning Objectives

### Customer Segmentation
- **VIP Customers:** Platinum tier with 4000+ points
- **Growth Opportunity:** Silver customers ready for upgrade
- **New Member Onboarding:** Recent joiners needing engagement
- **Retention Risk:** Long-time members with low recent activity

### Analytics Practice
- Calculate average points by tier
- Identify seasonal joining patterns
- Analyze point accumulation trends
- Create age-based segments

### AEP Feature Exploration
- **Real-time Customer Profile** unification
- **Audience Manager** segment creation
- **Journey Optimizer** campaign targeting
- **Customer Journey Analytics** reporting

## 🔧 Advanced Customization

### Extending the Dataset
Add these fields to enhance your learning:
- `lastPurchaseDate` - Recent activity tracking
- `preferredCategories` - Product interest arrays
- `communicationPreferences` - Channel preferences
- `geographicLocation` - Location-based segmentation

### Complex Query Examples
- Multi-table joins with purchase history
- Window functions for ranking customers
- Date calculations for tenure analysis
- Aggregations for tier performance metrics

## 📸 Screenshots

Schema
![image](https://github.com/user-attachments/assets/2984fca7-8b7a-4649-9444-3c9af6285a76)

Query output
![image](https://github.com/user-attachments/assets/9e332d80-85db-4536-9533-4eb0754ba573)

## 🛠️ Troubleshooting

### Common Issues
- **Query Errors:** Verify dataset name matches your AEP environment
- **Field Access:** Ensure proper XDM path (`_adlsplatformapac.fieldName`)
- **Data Types:** Check date formats and numeric field casting
- **Permissions:** Confirm Query Service access and dataset permissions

### Best Practices
- Always preview data before running complex queries
- Use `LIMIT` clauses during development
- Comment your SQL for documentation
- Test incrementally with small result sets

## 📚 Learning Resources

- [Adobe Experience Platform Documentation](https://experienceleague.adobe.com/docs/experience-platform/)
- [Query Service Guide](https://experienceleague.adobe.com/docs/experience-platform/query/home.html)
- [XDM Schema Composition](https://experienceleague.adobe.com/docs/experience-platform/xdm/schema/composition.html)
- [Real-time Customer Profile](https://experienceleague.adobe.com/docs/experience-platform/profile/home.html)

## 🔒 Data Privacy & Compliance

**Important:** This repository contains **mock data only**. No real customer information is included. All data is fictional and generated for educational purposes.

For production use:
- Implement proper data governance policies
- Follow GDPR/CCPA compliance requirements  
- Use appropriate data classification labels
- Implement access controls and audit logging

## 🤝 Contributing

Feel free to:
- Add more sample queries
- Extend the dataset with additional fields
- Create advanced use case examples
- Submit documentation improvements

## 📄 License

This demo project is provided for educational purposes. Please ensure compliance with Adobe's terms of service when using with actual AEP instances.

---

**Happy Learning with Adobe Experience Platform! 🎉**
