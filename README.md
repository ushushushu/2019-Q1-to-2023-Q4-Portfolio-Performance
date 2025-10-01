# 2019-Q1-to-2023-Q4-Portfolio-Performance

### Project Brief
---
Golden Triangle is a fictional lending company from the Philippines whose primary target market includes startups or SMEs, while their secondary target market includes large enterprises. Their product lineup includes loan plans that are easy to avail, flexible, and tailored to businesses. They have been dubbed as one of the high-growth companies in Asia-Pacific in 2019, highlighting their need for data analytics. Assume it is January 2024 and the quarantine to combat the COVID-19 pandemic has just been lifted. Both the Sales & Risk Managers are interested in analyzing the company's portfolio from 2019-2023 to create a definitive plan concerning post-pandemic recovery initiatives. The latter is also interested in seeing a snapshot of the data for his team to easily understand the risk performance & trends.

The deliverables of this project are as follows:
1. Slide deck
2. Risk management dashboard

### Data Schema

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

### Slide Deck
---
A link to the Canva slide deck can be found [here](https://www.canva.com/design/DAGzInPnv7Y/IVHace-sYd9Iw1ZkjbaVlQ/edit?utm_content=DAGzInPnv7Y&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)

### Tableau Dashboard
---
A link to the interactive Tableau dashboard can be found [here](https://public.tableau.com/shared/C3HGMPZ4F?:display_count=n&:origin=viz_share_link)

<div class='tableauPlaceholder' id='viz1759338369314' style='position: relative'><noscript><a href='#'><img alt='Portfolio Health ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Po&#47;PortfolioRiskManagementDashboard&#47;PortfolioHealth&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='PortfolioRiskManagementDashboard&#47;PortfolioHealth' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Po&#47;PortfolioRiskManagementDashboard&#47;PortfolioHealth&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en-US' /></object></div>

### Summary of Insights
---

#### **Client Acquisition**
- There has been a steady increase in client acquisition throughout 2019, peaking at 2,985 clients during the 4th quarter of 2019. The first known COVID-19 patient in the Philippines was declared in the 1st quarter of 2020 and public hasn't felt the negative effects of the pandemic quite yet, which explains the relatively strong performance. However, as the spread of the virus proliferated and disrupted business operations, client acquisition sharply declined by 66.23% in the 2nd quarter of 2020 and as the Philippines' economy officially entered a technical recession
- Clients from 2020 to 2023 were mostly composed of repeat customers. Since quarantine has been officially lifted in the 3rd quarter of 2020, it signified the country's strong ability to contain the COVID-19 pandemic
- From 2024 onward, the company should focus on driving client acquisition with a strong focus on securing new clients while maintaining repeat clients. Partner with the Marketing Team to launch “post-pandemic” marketing campaigns, expand market reach, & drive client acquisition

### Average Origination Volume & Average Loan Size
- The average origination volume plummeted in the 2nd quarter of 2020 and while it has been steadily increasing since then, the origination volume is sitll below its 2019 performance and thus, hasn't broken its downward trend.
- Conversely, clients' average loan size has been maintaining an upward trend since 2019
- This is indicative of a phenomenon where less and less clients are availing loan plans, yet each individual loan plan's principal amount is steadily increasing. This correlates with the decline in clients back in the 2nd quarter of 2020. The economy's entry to the technical recession could also explain the rise in the principal loan amounts, as companies require funding to sustain operations after disruptions caused by the COVID-19 pandemic
- From 2024 onwards, the company should consider the following recommendations:
	1. Re-introduce smaller loan products, since many clients likely need post-pandemic recovery funds
 	2. Consult with Executive Management a/o the Legal Department to gradually loosen lending policies while maintaining good credit quality
  	3. Work closely with the Risk Management Team to pinpoint areas for growth

#### Non-performing vs. Performing Clients & Portfolio at Risk (PAR)
- The company's non-performing clients only amount to 12.24% of the entire client base, yet they contribute to 39.97% of the portfolio that's at risk of defaulting or are already defaulting. We can infer that clients within the 12.24% are major clients, individuals with high initial loan amounts
- This also indicates that the portfolio is highly concentrated towards a small group of people, increasing risk
- From 2024 onwards, the company diversify the portfolio & target underrepresented business segments

#### Portfolio at Risk by Delinquency Period
- Although only 9.13% loan plans are 90+ days overdue, it amounts to 39.97% of the portfolio’s total outstanding balance. In other words, PHP 565.43 million is at risk of loss. 
- There is a strong possibility that clients with loans plans that are 90+ days overdue have prior bad debts -- money owed to a financial institution / entity that is rendered uncollectible due to the client's inability or unwillingness to pay
- Bearing this in mind, we can infer that there may have been a lapse in the company's lending policies or credit assessment procedures. If Golden Triangle had a robust system for assessing clients for loan approvals, the issue would've been lessened or kept to a minimum
- From 2024 onwards, the company should consider the following recommendations:
	1. 	Review & revise credit assessment & lending policies
 	2. Intensify & improve collection efforts (also consider restructuring loans)
	3. Consider taking legal actions against defaulting clients
