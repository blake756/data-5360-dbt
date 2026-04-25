Eco Essentials Project README
Overview
Throughout the course of a semester, we built a data pipeline for a fictional company called Eco Essentials through practicing concepts we learned in an introductory data warehousing course. Using tools such as Github, dbt, Snowflake, Fivetran, and Tableau, we transitioned data into an optimized data warehouse and analyzed six months of the company’s performance. We then created visualizations to influence the marketing strategy of the company moving forward, focusing on consumer behavior and highlighting the strengths of email campaigns. 
Step 1: Enterprise Data Warehouse Design

We were given two data sources from this fictional company to start with. The first source was a transactional database for online purchases that tracked products, promotional campaigns the company put on, customer information, and order information. The second was a table that tracked when marketing emails were sent to customers and how customers interacted with the emails sent. The first step in our process was to take these sources and turn them into an optimal galaxy schema. We identified conformed dimensions such as the date dimension and turned in a rough draft for approval. 

Step 2: Extract, Load, and Transform

The second step was the most difficult part of the project. We received feedback on our initial database design and removed redundant information. For example, we originally had two dimensions for customers and subscribers and we realized we should have combined them into one. We then created code that makes the models for each dimension and fact table and built them on dbt. All of the data sources mentioned above were saved in an S3 bucket and we loaded it into dbt using staging tables. After the model design was complete, we each sent our completed models to Snowflake and performed quality checks on the data, ensuring each model loaded properly and eliminating any mistakes. 

Step 3:  Testing and Scheduling

After we created the models, we added tests to them to ensure data quality. We added four tests, including unique, not_null, accepted_values, and relationships tests. 
In a work setting, we would have implemented more but we just included a few for the time being. We also launched a connection from the tables to Fivetran, and we changed the frequency to 24 hours. After the tests were added, we created a dbt job that recreated the fact and dimension tables daily to ingest new data as it entered the pipeline. 

Step 4: Data Visualization and Communication

After the dbt tests were created and we connected this project to Fivetran, we connected the data in Snowflake to Tableau through a private key file. Once the tables populated into the data source page of Tableau, we had to connect them through the key relationships we established when creating our models. After this, we thought of the story that we wanted to tell with the data we’ve worked with all semester and we came up with some visualizations to present to a fictional team of Eco Essentials leaders. 
Takeaways For Analysis
We measured the effectiveness of email marketing campaigns by comparing them to monthly sales using a line chart. We also analyzed customers by state with a map visualization to identify regions where the company can expand advertising efforts. Additionally, we created a bar chart to show how consumers interacted with marketing emails, tracking metrics such as opens and clicks. Overall, we examined trends in campaign performance and found that customers who purchase more tend to receive more emails with discounts.
Takeaways From The Project
This project was a wonderful introduction to industry standard software and best practices used in data warehousing. Prior to starting this project, neither of us had used these tools and they proved challenging to learn. There were many times where our dbt tests failed or our schemas were incorrect. Throughout our careers, we will likely have to use software we are unfamiliar with to deliver value to the people we work for and the larger communities we are a part of. We learned about the strengths and weaknesses between normalized databases and star schemas and found that different organizations have different needs. 
This project also recalled knowledge that we have earned through years of study and it combined concepts from multiple data engineering and business classes we have taken. Proper data analysts are in charge of maintaining data with integrity and proper methods while delivering insights to stakeholders using soft skills like leadership and communication. It is the balance between these different skill sets that help organizations make decisions when decision-making isn’t easy. This project showed us the work we are brave enough to take on; working with technology to best work with people. 





