# Decision Tree Classification with Missing Data (R)

This repository demonstrates an **end-to-end machine learning workflow in R** for a classification problem with **missing data**, using **Decision Trees**.

The project covers data preprocessing, missing value imputation, normalization, model training, visualization, and performance evaluation using real-world structured data.

---

## 📌 Project Overview

The main objective of this project is to:

- Handle **missing values** using a statistically robust method
- Build a **Decision Tree classifier**
- Evaluate model performance with standard classification metrics

The workflow is implemented using popular R packages such as `mice`, `caret`, and `rpart`.

---

## 🧠 Methodology

The pipeline consists of the following steps:

1. **Data Import**
   - Load a CSV dataset selected by the user
   - Inspect data structure and summary statistics

2. **Categorical Variable Encoding**
   - Convert categorical variables into `factor` type
   - Target variable: `y` (binary classification)

3. **Missing Data Imputation**
   - Use **MICE (Multivariate Imputation by Chained Equations)**
   - Method: Predictive Mean Matching (PMM)
   - Ensures realistic and statistically consistent imputations

4. **Feature Scaling**
   - Normalize numerical variables using `scale()`
   - Improves model stability and comparability

5. **Train–Test Split**
   - Stratified split using `caret::createDataPartition`
   - 80% training, 20% testing

6. **Decision Tree Model**
   - Algorithm: CART (`rpart`)
   - Classification mode

7. **Model Visualization**
   - Graphical representation of the decision tree
   - Display class probabilities and decision rules

8. **Model Evaluation**
   - Predictions on test data
   - Confusion Matrix
   - Metrics: Accuracy, Sensitivity, Specificity, F1-score

---

## 📦 Libraries Used

```r
mice        # Missing data imputation
caret      # Data partitioning and evaluation
rpart      # Decision tree model
rpart.plot # Tree visualization
dplyr      # Data manipulation
