# Udacity Project - Design for Performance and Scalability

This is one of the project in Udacity AWS Cloud Architect Nanodegree.

## Project Overview

In this project, I have:
- Designed, provisioned, and monitored infrastructure in AWS using industry-standard and open source tools. 
- Practiced the skills I have learned throughout the course to optimize infrastructure for cost and performance. 
- Used Terraform to provision and configure AWS services in a global configuration.

## Project Files
- `Exercise_1`: Contains the terraform code to create EC2 instances in AWS.
- `Exercise_2`: Contains code to deploy lamda function in AWS.
- `screenshots`: This folder contains all the screenshots taken at time of doing project.
- `Udacity_Diagram_1.pdf`: Contains a cost-effective AWS infrastructure architecture for a new social media application development project for 50,000 single-region users.
- `Udacity_Diagram_2.pdf`: Contains a SERVERLESS architecture schematic for a new application development project.
- `UdacityCloudTrailLog.csv`: Contains a portion of the CloudTrail log.
- `Initial_Cost_Estimate.csv`: Cost estimated using [AWS Pricing Calculator](https://calculator.aws/#/) for the architecture to run in AWS created in `Udacity_Diagram_1.pdf`.
    - Targeted a monthly estimate between $8,000-$10,000.
- `Reduced_Cost_Estimate.csv`: Cost estimated using [AWS Pricing Calculator](https://calculator.aws/#/) for the architecture to run in AWS created in `Udacity_Diagram_1.pdf`.
    - Targeted a monthly estimate to a maximum of $6,500.
- `Increased_Cost Estimate.csv`: Cost estimated using [AWS Pricing Calculator](https://calculator.aws/#/) for the architecture to run in AWS created in `Udacity_Diagram_1.pdf`.
    - Targeted a monthly estimate to a maximum of $20,000.

### How I reduced the estimate to $6,500

Below is the list of changes and reasons for the solution:

- `Change`: Scaled down to lower configuration EC2 instance type`(t2.xlarge -> t2.large)`.
    - **Reason**: Changing the EC2 instance configuration can effect the performance for a little bit but instances can be auto scaled if and when needed.
- `Change`: Changed pricing from on-demand to reserved instances.
    - **Reason**: Reserving instances for 1 year will reduce the cost for the architecture. But it will lock the application platform to use the same infrastrcuture for one year. Although more resources can be added any time if and when needed.
- `Change`: Scaled down RDS instance from `db.m5.4xlarge to db.m5.2xlarge`.
    - **Reason**: Scaling down will have the database performance issue but it can be bearable according to the application requirements.
    
### How I come up with an estimated cost of $20,000

Below is the list of changes and reasons for the solution:

- `Change`: Added more EC2 instances and load balancer.
    - **Reason**: This will provide high availability for the application. Even if `Northern Virginia` region is completely down, application will be up and running in `Ohio` region.
- `Change`: Added RDS database instance in `Ohio` region.
    - **Reason**: This will reduce the latency for users accessing application in other region. Because data can be fetched from `Ohio` region read replica RDS database instance.
- `Change`: Scaled up RDS database instances.
    - **Reason**: This will improve the database performance and will be more effecting in case of huge traffic on application platform.
