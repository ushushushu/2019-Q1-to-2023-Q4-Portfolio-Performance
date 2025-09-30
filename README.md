# 2019-Q1-to-2023-Q4-Portfolio-Performance

Golden Triangle is a fictional lending company from the Philippines whose primary target market includes startups or SMEs, while their secondary target market includes large enterprises. Their product lineup includes loan plans that are easy to avail, flexible, and tailored to businesses. They have been dubbed as one of the high-growth companies in Asia-Pacific in 2019, highlighting their need for data analytics. Assume it is January 2024 and the quarantine to combat the COVID-19 pandemic has just been lifted. The Risk Manager wants to determine the company's lending portflio from 2019 to 2023, the height of the COVID-19 pandemic timeline in the Philippines. Additionally, he also wants to make a decision on what risk mitigation strategies should be implemented in the incoming year. The Risk Manager also wants to look at a snapshot of the data for the Risk Management team to quickly understand risk performance, track progress, and make informed decisions. The Sales Manager also wants to make a decision on what strategies to implement based on key findings.

This project aims to:
1. Create a slide deck presentation with actionable recommendations for Golden Triangle's Risk & Sales Managers
2. Create a dashboard for the Risk Management team

Data Schema:

CREATE TABLE dim_client (
	client_uuid TEXT,
	company_size TEXT,
	industry TEXT,
	subindustry TEXT,
	company_type TEXT,
	segment TEXT,
	country TEXT,
	province TEXT,
	city TEXT,
	annual_revenue NUMERIC,
	employee_count INTEGER,
	year_established INTEGER
);

CREATE TABLE loan_details (
	client_uuid TEXT,
	loan_uuid TEXT,
	loan_type TEXT,
	contract_date DATE,
	initial_loan_amount NUMERIC,
	loan_end_date DATE,
	original_loan_end_date DATE,
	current_principal_outstanding NUMERIC,
	days_past_due INTEGER
);

_Note: NULL values are expressed in actuall NULL, or text values like 'NULL' and 'N/A'._

🔗 Link to Tableau dashboard:
https://public.tableau.com/shared/C3HGMPZ4F?:display_count=n&:origin=viz_share_link
