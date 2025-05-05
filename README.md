# Donor-Rating-App-For-Nonprofits
Custom Jupyter Notebook and Shiny R Studio App For Predicting Likely Donors

# 🎯 Donor Behavior Prediction & Interactive Analytics Dashboard

This project demonstrates the use of predictive modeling and interactive dashboard development to help a nonprofit organization identify and target **repeat donors**. The solution includes:

- A **Jupyter notebook** for data analysis and model building
- An **R Shiny dashboard** for data exploration and donor segmentation
- Exportable donor scoring for actionable insights

This project is ideal for use in a data science portfolio to demonstrate applied machine learning, business insight generation, and dashboard deployment skills.

---

## 📊 Project Goals

- Predict the likelihood that a donor will give again using a logistic regression model
- Score donors on a scale of **1 to 5** based on their probability of repeat giving
- Visualize donor distribution, segmentation, and behavioral trends
- Build a **Shiny dashboard** to interactively explore donor patterns and support fundraising strategy

---

## 🧪 Machine Learning Model (in R)

A logistic regression model was used to predict repeat donor behavior based on:

- **Demographic and behavioral variables**: age, gender, donation amount, communication channel, donation frequency, and recency
- Model output: predicted probability of becoming a repeat donor
- Donors were segmented into **quintiles (1–5)** based on their predicted likelihood

The model was developed and validated inside a Jupyter notebook using **R via IRKernel**, ensuring reproducibility and step-by-step interpretability.

## 🖥️ Running the Shiny Dashboard Locally

> ✅ Prerequisite: You must have [R](https://cran.r-project.org/) and [RStudio](https://posit.co/download/rstudio-desktop/) installed.

### 📦 1. Install Required Package
In RStudio, install the `shiny` package if you haven't already:

```r
install.packages("shiny")
📁 2. Download Project Files
Download or clone this repository.

Ensure both app.R and donor_predictions_with_scores.csv are saved in the same folder.

🚀 3. Launch the App
Open app.R in RStudio.

Click the "Run App" button in the top-right corner.

The dashboard will open in your browser at http://127.0.0.1:xxxx.

📈 Dashboard Features
The R Shiny dashboard includes:

🔍 Filters for gender, communication channel, and score range

📊 Score Distribution Plot: Visualizes how donors are distributed across score tiers

📉 Demographic and Channel Insights: Breakdown by gender and donation channel

📋 Interactive Donor Table: Explore and export donor records

📤 Download Button: Export filtered donor lists to CSV

🧠 Key Takeaways
Demonstrates use of logistic regression for classification tasks

Shows how to translate model outputs into practical segmentation scores

Emphasizes explainability, accessibility, and stakeholder usability

Combines statistical modeling with modern web dashboard development

📌 Use Cases
This project is a portfolio artifact for data science, nonprofit consulting, or business analytics roles. It illustrates the end-to-end pipeline from raw data to deployment-ready insights.

🤝 Acknowledgments
Created by Ronald Parent as part of a portfolio of business-focused data science applications. This project aims to help small to midsize organizations and nonprofits leverage their data for smarter decision-making.

https://precisiondatastrategies.com


