# Project Description

The authors of the following research paper:

Cortez, A. Cerdeira, F. Almeida, T. Matos, and J. Reis, “Modeling wine preferences by data mining from physicochemical properties”, Decision Support Systems, vol. 47, no. 4:547-553, 2009.

considered the problem of modeling wine preferences. Wine can be evaluated by experts who give a subjective score, and the question the authors of this paper considered was how to build a model that relates objective features of the wine (e.g., pH values) to its rated quality.

In this project, I am interested to predict the quality of the wine from features of the wine (i.e., fixed acidity, volatile acidity, citric acid, residual sugar, chlorides, free sulfur dioxide, total sulfur dioxide, density, pH, sulphates, and alcohol).

Note that this is originated from school project, but I decided to do further exploration on the dataset. The code in MATLAB is the code for the school project. I decided to do further exploration on the dataset using Phyton.

# Modeling Process

First, the model will be fitted using Linear Regression. After fitting and testing, it turns out that Linear Regression does not fit to the dataset properly. Next, the model is fitted using Random Forest. Overall, the model is successfully fitted using decision trees with an accuracy up to 70.625%. The model is doing decently in predicting the quality of the wine based on the given features.

# What's inside my Repository

Inside my repo, I will be including:

1. [MATLAB code](https://github.com/iw30/Modelling-Wine-Preferences/blob/main/ieor165_proj.m): The MATLAB will include the process of computing the coefficient of linear models relating to different features of wine using Ordinary Least Squares, Ridge Regression, and Lasso Regression through MATLAB.
2. [MATLAB Report](https://github.com/iw30/Modelling-Wine-Preferences/blob/main/William_Wijaya_IEOR165proj.pdf): The report will contain the result from MATLAB.
3. [Phyton code](https://github.com/iw30/Modelling-Wine-Preferences/blob/main/wine.ipynb): This includes the Phyton code on the further exploration that I did. 
