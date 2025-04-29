# ***Botswana Bank Customer Churn Report***

![Churn Analysis Visual](image.png)

# ***Project Overview***  
This project analyzes customer data from **Botswana Bank** to understand churn behavior, identify key patterns, and derive actionable insights for improving **customer retention** and **business profitability**.

# ***Purpose of the Data*** 
The main objectives of this analysis are to:  
- Identify the **key drivers** behind customer churn.  
- Understand **customer behavior** and **demographics**.  
- Provide **recommendations** to improve retention strategies.  
- Segment customers based on **risk** and **profitability** factors.

# ***Data Description*** 
The dataset includes **115,640 customers** and consists of **34 columns** covering:  

- **Demographic Information**: Age, Gender, Marital Status, Date of Birth.  
- **Financial Data**: Income, Credit Score, Outstanding Loans, Balance.  
- **Behavioral Data**: Number of Products, Complaints, Communication Preferences.  
- **Churn Details**: Churn Flag, Reason, Date.  

### *Key Columns:*
- `Churn_Flag`: Indicates if a customer has churned.  
- `Customer_Tenure`: Duration of customer relationship with the bank.  
- `Risk_Indicator`: Categorizes customers as High, Mid, or Low Risk.  


# ***Technical Overview*** 

*Tools Used*:  
- **SQL** – For Exploratory Data Analysis (EDA)  
- **Python** – For deeper statistical analysis  
- **Power BI** – Used for dashboarding (not included in this documentation)  

*Libraries/Technologies*:  
- `Pandas`, `NumPy` – Data manipulation  
- SQL – Complex querying  
- Correlation and Regression analysis techniques  



# ***Executive Summary*** 

### *Who churned the most?*  
- **Divorced customers** have the highest churn rates among all marital statuses. This highlights a life-stage-related churn pattern and reveals a need for personalized retention strategies.

### *What is the age difference between churned and non-churned customers?*  
- **No major difference**:  
  - Average age of active customers: **47.2**  
  - Average age of churned customers: **47.08**  

### *What is the gender distribution among churned customers?*  
- **Very balanced**:  
  - Churned Males: **7,070**  
  - Churned Females: **7,024**  

### *How many products does an average active customer hold?*  
- Median number of products for active customers: **3**

### *Retention Rate by Segment:*  
- **Corporate**: 87.9%  
- **Retail**: 87.84%  
- **SME**: 87.7%

### *Churn Rate by Communication Channel:*  
- **Email**: 12.2%  
- **Phone**: 12.2%

### *Risk Segmentation:*  
- High-risk customers typically have **low credit scores** and **poor credit history**.

### *Top Churn Reasons:*  
- **Service Issues**, **Account Closure**, **Relocation**

### *Occupational Insights:*  
- Highest churn professions include **Engineers**, **Biochemists**, and **Surveyors**

### *Credit Score Stats:*  
- **Max**: 850  
- **Min**: 300  
- **Average**: 574.29  

# ***Key Insights*** 

### *1. Churn & Marital Status*  
- Divorced individuals are significantly more likely to churn, suggesting life transitions affect banking relationships.

### *2. Tenure vs Credit Score*  
- Correlation = **-0.002** ➝ No strong link. Tenure doesn't predict creditworthiness.

### *3. Complaints Correlate with Churn*  
- Positive correlation = **0.20** ➝ More complaints = higher churn probability.

### *4. Risk Category Breakdown*  
- **Low Risk** = 63.57% of customers. These are the most stable group.

### *5. Engagement Score*  
- Average = **5.60**. Higher scores align with **greater loyalty** and reduced churn.

### *6. omplaint Rate by Tenure*  
- Surprisingly similar:  
  - Loyal Customers = 5.00  
  - New Customers = 5.01  

### *7. Income Gap*  
- Low-income customers have slightly higher churn: **12.33%**

### *8. Credit Utilization by Segment*  
- Retail = **2.07**  
- Corporate = **1.14**

### *9. Product Penetration*  
- Median number of products per customer is **~3** across all segments.

# ***Recommendations***

### *Target Divorced & Low-Income Customers* 
- **Strategy**: Launch loyalty programs and exclusive benefits for these groups.  
- **Execution**: Financial wellness workshops, one-on-one advisory, customized offers.  
- **Expected Outcome**: Higher emotional engagement and retention of vulnerable groups.


### *Enhance Service Quality*
- **Strategy**: Focus on reducing service-related churn, a top driver.  
- **Execution**: Train staff better, introduce 24/7 support, and monitor complaint turnaround.  
- **Expected Outcome**: Lower churn, improved brand image, better satisfaction scores.


### *Proactive Risk Management* 
- **Strategy**: Offer financial counseling to high-risk groups.  
- **Execution**: Credit repair programs, progress tracking dashboards, credit score simulators.  
- **Expected Outcome**: Improved financial health and reduced churn risk.



### *Optimize Communication Channels*
- **Strategy**: Explore real-time, engaging channels like mobile app notifications.  
- **Execution**: Push notifications, in-app chatbots, personalization via AI.  
- **Expected Outcome**: Higher engagement, reduced missed messages, improved loyalty.



### *Streamline Complaint Handling*  
- **Strategy**: Speed up resolution and track complaint severity.  
- **Execution**: Ticket-based systems, empowered reps, satisfaction-based follow-ups.  
- **Expected Outcome**: Stronger trust, lower frustration, fewer customer exits.



### *Focus on Retail Customers*  
- **Strategy**: Monitor credit utilization and offer custom financial products.  
- **Execution**: Alerts for credit spikes, bonus offers for usage control, cashback rewards.  
- **Expected Outcome**: More loyalty, better financial outcomes, reduced churn.



# ***Data Limitations*** 
- No access to **real-time transactions** limits behavioral pattern mining.  
- **No economic context** like inflation or interest rates considered.  
- **Date columns** could be better used for tenure & seasonality trends.  
- Methodologies for **Engagement Score** and **Balance-to-Income Ratio** are not standardized across segments.



# ***Conclusion*** 
Botswana Bank's churn behavior is **moderately influenced** by marital status, income, service quality, and risk indicators.  
By targeting **divorced**, **low-income**, and **high-risk** customers through **personalized**, **proactive**, and **digital-first strategies**, the bank can significantly reduce churn and drive **sustainable profitability**.



