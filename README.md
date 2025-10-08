# Golden Triangle Portfolio Performance (2019-2023)

### 📜 Table of Contents
---
- [Project Brief](#%EF%B8%8F-project-brief)
- [Data Schema](#-data-schema)
- [Technologies & Skills Used](#-technologies--skills-used)
- [Slide Deck](#-slide-deck)
- [Tableau Dashboard](#-tableau-dashboard)
- [Summary of Insights for the Sales & Risk Managers](#-summary-of-insights-for-the-sales--risk-managers)
- [Recommendations](#-recommendations)
- [Future Improvements](#-future-improvements)
- [Contact Information](#-contact-information)

### ✏️ Project Brief
---
Golden Triangle is a fictional lending company from the Philippines whose primary target market includes startups or SMEs, while their secondary target market includes large enterprises. Their product lineup includes loan plans that are easy to avail, flexible, and tailored to businesses. Prior to the pandemic, the company's performance had been strong. However, the onset of the COVID-19 pandemic in the Philippines uncovered an underlying critical issue within its operations -- the lack of a credit risk management framework. Golden Triangle's portfolio was severely impacted as continued operational disruptions occured. Now, both the Sales and Risk Managers want to analyze 2019-2023 portfolio performance to understand what happened and inform recovery strategies. The Risk Manager specifically requested the addition of a dashboard for their team to monitor ongoing risk performance and trends.

The deliverables of this project are as follows:
- **Slide deck:** For both Sales & Risk Manager - portfolio performance insights
- **Risk management dashboard:** For Risk Manager's team - ongoing monitoring

Insights & recommendations are provided in the following areas:
- **Client Financing Behavior & Acquisition Trends:** Evaluation of client acquisition volumes, loan origination volume shifts, & changes in average loan size
- **Portfolio at Risk (PAR):** An analysis of the portfolio's total outstanding balance that's at risk of defaulting

### 📂 Data Schema
---
The database seen below is primarily composed of two tables: dim_client & loan_details. A total of 4,200 rows records were found in the dim_client table, while the latter contained 24,949 records. During the data visualization process, I discovered that Tableau was unable to gather most clients' city coordinates, which I required for the Geographic Analysis tab in the Risk Management Dashboard. For this reason, the clients' geographical data were extracted for geocoding in [Geoapify](https://www.geoapify.com/tools/geocoding-online/) before it was stored in the geo_data table. The said table is composed of 510 unique records.

<img width="800" height="600" alt="Image" src="https://github.com/user-attachments/assets/f55206cf-3d08-4cd4-9cc4-f177949cec5b" />

### 💻 Technologies & Skills Used
---
- SQL
- PostgreSQL
- Tableau

### 📣 Slide Deck
---
A link to the Canva slide deck can be found [here](https://www.canva.com/design/DAGzInPnv7Y/IVHace-sYd9Iw1ZkjbaVlQ/edit?utm_content=DAGzInPnv7Y&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton). Scroll down to view the Summary of Insights for the Sales & Risk Managers.

### 📊 Tableau Dashboard
---
A link to the interactive Tableau dashboard can be found [here](https://public.tableau.com/shared/C3HGMPZ4F?:display_count=n&:origin=viz_share_link)

<div class='tableauPlaceholder' id='viz1759338369314' style='position: relative'><noscript><a href='#'><img alt='Portfolio Health ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Po&#47;PortfolioRiskManagementDashboard&#47;PortfolioHealth&#47;1_rss.png' style='border: none' /></a></noscript><object class='tableauViz'  style='display:none;'><param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> <param name='embed_code_version' value='3' /> <param name='site_root' value='' /><param name='name' value='PortfolioRiskManagementDashboard&#47;PortfolioHealth' /><param name='tabs' value='no' /><param name='toolbar' value='yes' /><param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Po&#47;PortfolioRiskManagementDashboard&#47;PortfolioHealth&#47;1.png' /> <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' /><param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' /><param name='display_count' value='yes' /><param name='language' value='en-US' /></object></div>

### 💡 Summary of Insights for the Sales & Risk Managers
---

#### 👥 Client Acquisition
- There has been a steady increase in client acquisition throughout 2019, peaking at 2,985 clients during the 4th quarter of 2019. The first known COVID-19 patient in the Philippines was declared in the 1st quarter of 2020 and public hasn't felt the negative effects of the pandemic quite yet, which explains the relatively strong performance. However, as the spread of the virus proliferated and disrupted business operations, client acquisition sharply declined by 66.23% in the 2nd quarter of 2020 and as the Philippines' economy officially entered a technical recession
- Clients from 2020 to 2023 were mostly composed of repeat customers. Since quarantine has been officially lifted in the 3rd quarter of 2020, it signified the country's strong ability to contain the COVID-19 pandemic
<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/5f58141c-e386-4eb6-a6db-2817f78cf720" />

#### 📈 Average Origination Volume & Average Loan Size
- The average origination volume plummeted in the 2nd quarter of 2020 and while it has been steadily increasing since then, the origination volume is sitll below its 2019 performance and thus, hasn't broken its downward trend.
- Conversely, clients' average loan size has been maintaining an upward trend since 2019
- This is indicative of a phenomenon where less and less clients are availing loan plans, yet each individual loan plan's principal amount is steadily increasing. This correlates with the decline in clients back in the 2nd quarter of 2020. The economy's entry to the technical recession could also explain the rise in the principal loan amounts, as companies require funding to sustain operations after disruptions caused by the COVID-19 pandemic
<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/252d2184-5cef-4f74-8900-1b34aaf7ab9d" />
<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/666f7c8f-72bc-43dc-ae21-1e71a3ac9c17" />

#### 💰 Non-performing vs. Performing Clients & Portfolio at Risk (PAR)
- The company's non-performing clients only amount to 12.24% of the entire client base, yet they contribute to 39.97% of the portfolio that's at risk of defaulting or are already defaulting. We can infer that clients within the 12.24% are major clients, individuals with high initial loan amounts
- This also indicates that the portfolio is highly concentrated towards a small group of people, increasing risk
<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/87acfe6d-1aa8-4f7d-b382-66fdb136918c" />

#### ⌛ Portfolio at Risk by Delinquency Period
- Although only 9.13% loan plans are 90+ days overdue, it amounts to 39.97% of the portfolio’s total outstanding balance. In other words, PHP 565.43 million is at risk of loss. 
- There is a strong possibility that clients with loans plans that are 90+ days overdue have prior bad debts -- money owed to a financial institution / entity that is rendered uncollectible due to the client's inability or unwillingness to pay
- Bearing this in mind, we can infer that there may have been a lapse in the company's lending policies or credit assessment procedures. If Golden Triangle had a robust system for assessing clients for loan approvals, the issue would've been lessened or kept to a minimum
<img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/ae4483a1-77a4-4b8a-8b8f-7fab9cde490c" />

### 🎯 Recommendations
---
Based on the uncovered insights, the following recommendations have been provided:

#### 1️⃣ Recommendations to the Sales Manager
- The company should focus on driving client acquisition with a strong focus on securing new clients while maintaining repeat clients. Partner with the Marketing Team to launch “post-pandemic” marketing campaigns, expand market reach, & drive client acquisition
- Re-introduce smaller loan products, since many clients likely need post-pandemic recovery funds
- Consult with Executive Management a/o the Legal Department to gradually loosen lending policies while maintaining good credit quality
- Work closely with the Risk Management Team to pinpoint areas for growth

#### 2️⃣ Recommendations to the Risk Manager
- The company diversify the portfolio & target underrepresented business segments
- Review & revise credit assessment & lending policies
- Intensify & improve collection efforts (also consider restructuring loans)
- Consider taking legal actions against defaulting clients

### 🧠 Future Improvements?
---
1. Incorporate colorblind-accessible designs for UI/UX
2. Introduce narrative layers into the design, so non-technical audiences can understand the data
3. Addition of predictive modeling to strengthen dashboard use
4. Maximize the dashboard lifecycle by creating high-use designs

### 📞 Contact Information
---
- **Author:** Usha Nicole C. Cobrado
- **LinkedIn:** [https://www.linkedin.com/in/usha-nicole-cobrado/](https://www.linkedin.com/in/usha-nicole-cobrado/)
- **Email:** [usha.cobrado@gmail.com](mailto:usha.cobrado@gmail.com)
