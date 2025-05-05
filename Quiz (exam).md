### Intro
#Q1
What are the three main types of machine learning algorithms=
-> Supervised learning, unsupervised learning and reinforcement learning

#Q2
What is the main difference between supervised and unsupervised learning?
-> Supervised learning deals with labelled data, while unsupervised learning uses un-labelled data

#Q3 What characterizes reinforcement learning?
-> Reinforcment learning maximises the total reward of a series of actions, based on the feedback

#Q4 How is tabular data normally ordered in machine learning?
-> Rows are samples, columns are variables and each cell of the table contains a value of one of the variables for one of the samples.

#Q5 What information can we get from pair plots?
-> Distributions of the variables and relationships between pairs of variables

### Pandas and ML pipelines
#Q1 What are the four main steps in an ML pipeline
-> Preprocessing, learning, evaluation and prediction

#Q2 Which of the following methods are preprocessing methods
- Variable selection
- Feature Selection
- Standardisation

#Q3 What is cross-validation often used for in ML
-> Testing the generalizability of the models

#Q4 What is the main difference between cross-validation and test set validation
-> In cross-validation different parts of the training set is kept out and used for validation in each of several rounds, while in test set validation a seperate test set is kept totally out of the training and used only for validation

#Q5 When using test set validation, we...
-> Preprocess both the training data and the test data using parameters derived from the training data

### Scaling train and test data
#Q1
`X` is a matrix with samples, `y` is a vector of labels.
Assume all used functions and classes are imported correctly.
Assume standardization is the correct scaling for the given dataset.
```
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=1, stratify=y)
        sc = StandardScaler()
        X_train_sc = sc.fit_transform(X_train)
        X_test_sc = sc.transform(X_test)
    
```
What is wrong with the code above?
- [ ] The scaling done in this way leads to information bleeding.
- [ ] The test set should never be standardized.
- [ ] The last line should read 
	```
	X_test_sc = sc.fit_transform(X_test)
	```
- [ ] Nothing is wrong with the code. This is the correct way to scale the data.

#Q2
X is a matrix with samples, y is a vector of labels.
Assume all used functions and classes are imported correctly.
Assume standardization is the correct scaling for the given dataset.
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=1, stratify=y)
        sc = StandardScaler()
        sc.fit(X)
        X_train_sc = sc.transform(X_train)
        X_test_sc = sc.transform(X_test)
What is wrong with the code above?
- [ ] The third line should read sc.fit(X_test)
- [x] The scaling done this way leads to information bleeding.
- [ ] Nothing is wrong with the code. This is the correct way to scale the data.
- [ ] Information from the training data set will wrongly end up in the test set.
(bc its fitted on X, the whole dataset before splitting)

#Q3
`X` is a matrix with samples, `y` is a vector of labels.
Assume all used functions and classes are imported correctly.
Assume standardization is the correct scaling for the given dataset.
```
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=1, stratify=y)
        mean, stddev = X.mean(axis=0), X.std(axis=0)
        X_train_sc = (X_train - mean) / stddev
        X_test_sc = (X_test - mean) / stddev     
```
What is wrong with the code above?
- [ ] The second line should read   `mean, stddev = X_test.mean(axis=0), X_test.std(axis=0)`
- [ ] The second line should read `mean, stddev = X_train.mean(axis=1), X_train.std(axis=1)`
- [x] The scaling done this way leads to information bleeding.
- [ ] The second line should read   `mean, stddev = X_train.mean(axis=0), X_train.std(axis=0)`
- [ ] Nothing is wrong with this code. This is the correct way of scaling the data.

#Q4
`X` is a matrix with samples, `y` is a vector of labels.
Assume all used functions and classes are imported correctly.
Assume standardization is the correct scaling for the given dataset.
```
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=1, stratify=y)
        X_train_sc = (X_train - X_train.mean(axis=0) / X_train.std(axis=0)        X_test_sc = (X_test - X_test.mean(axis=0) / X_test.std(axis=0)
```
What is wrong with the code above?

- [ ]  Nothing is wrong with this code. This is the correct way of scaling the data.
- [ ]  Scaling the data this way will likely lead to wrong predictions on the test set for a classifier trained on the training data set.
- [ ]  The last line should read   `X_test_sc = (X_test - X_train.mean(axis=0) / X_train.std(axis=0)`
- [ ]  Scaling done this way will lead to information bleeding.
- [ ]  Scaling done in this way will lead to overfitting.
- [x]  The code violates the principle that the same transformation applied to the training data set must also be applied to the test data set.
(3 is the fix)


### Preprocessing and feature selection
#Q1 Why can the holdout method lead to an overestimation of the model performance
-> The test set becomes part of the model selection

#Q2 Are the following variables ordinal or nominal? (Nominal=Categorical no order Ordinal=Categorical with natural order or rank.)
Tshirt size: Ordinal
Tshirt color: Nominal
Countries: Nominal
Gender: Nominal

#Q3 why is it sometimes an advantage to use one-hot-encoding instead of integers directly as class labels in classification?
-> Some algorithms interpret integers as numbers where the magnitude matters.
one hot encoding: instead of color blue, red -> 0, 1 -> each category is now a new binary feature. 

#Q4 Which of the following is NOT true?
- Exhaustive algorithms search for the best solution among all possible solutions
- Greedy algorithms generally yield a suboptimal solution to the problem
X - Exhaustive algorithms have higher risk of converging to a local minimum
- Greedy algorithms make locally optimal choices at each iteration of a combinatorial search solved as a sequential problem

#Q5 Why is feature selection using Random Forests sometimes not suitable when two or more features are highly correlated?
-> The feature importance is split among the features, making each feature possibly appear unimportant.

### Data inspection, Perceptron and Adaline
#Q1 Which of the following plots are univariate. 
- Violin plots
- Density plots
- Histograms
- Box plots 
- Bar plots
- > not scatter plots
- 
#Q2 What is the threshold function used for in a perceptron?
-> Transforming the net input to a binary output of -1 or 1 

#Q3 In ML the bias unit is
-> A constant term which is part of the net input equation

#Q4 Which of the following is *NOT* true about the learning rate?
X - It is equal to the number of iterations until convergence divided by the number of weight values learned
- It is a hyperparameter which controls the step size in the updating of the weights
- It is typically a constant between 0 and 1
- 
#Q5 In Adaline, the activation function is 
-> A linear function

#Q6 Feature scaling improves gradient descent because
->> scaling to a standard distribution helps the learning to converge more quickly


### ScikitLearn
#Q1 What is the One-vs-Rest approach used for?
-> Extending a binary classifier to multi-class problems

#Q2 Which of the following is important when splitting into a training set and a test set?
-> Ensuring that the distributions of the classes are balanced in both sets

#Q3 What is the eta0 parameters in the Perceptron
-> The learning rate

#Q4 what can happen if the learning rate is very large?
-> The algorithm might overshoot the global cost minimum

#Q5 What is the main difference between Gradient Descent (GD) and Newton's method?
-> GD finds the minimum of a function, while Newton's method finds the root of a function.


### PCA
#Q1 
What does PCA do?
- Predicts your target with high efficiency
- Creates clusters in order to let you know what the class is
- Gives you the highest number of features possible, to maximize the efficiency of your Machine Learning algorithm
X - Reduces the dimensionality of the data and creates new features from the original features

#Q2 
Principal Component Analysis is an unsupervised learning algorithm
X - True
- False

#Q3 
In PCA, we maximize between-class variance and minimize within-class variance
- True
X - False

#Q4 
What will happen when the eigenvalues are roughly equal?
- PCA will perform outstandigly
X - PCA will perform badly
- Cannot say

#Q5
PCA is used for obtaining faster training and for visualization
X - True
 - False

#Q6
PCA is used for classification
 - True
X - False

#Q7
The most popular dimensionality reduction algorithm is Principal Component Analysis(PCA). Which if the following is/are about PCA?
- PCA is an unsupervised method
- PCA searches for the directions where the data has the largest variance
- The number of pca components <= number of features
x - ALL CHOICES

### LDA
#Q1 Imagine you are dealing with 10 class classification problem and you want to know what that at most how many discriminant vectors can be produced by LDA, What is the correct answer?
-> (C-1) = 9

#Q2 Linear Discrimintant Analysis is an unsupervised learning algorithm
-> False, uses labels to find linear combinations of features that maximize seperability

#Q3 In LDA, we maximize between-class variance and minimize within-class variance
-> True, maximize diff between classes, min variance within class

#Q4  The main application of LDA is training faster and Visualization
-> False, its classification and dimension reduction

#Q5 LDA assumes that:
- Classes have identical covariance matrices
- The data is normally distributed
- Features are statistically independet of each other

### Kernels
#Q1 Which of the following are properties that a kernel matrix always has?
- Invertible
- At least one negative eigenvalue
X - Symmetric
- All choices

#Q2 ____is used to learn a linear classifier to classify a non-linear dataset. 
- Non of the provided answers
- class variable
X - kernel trick
- dependent features

#Q3 What is the primary purpose of using kernels in machine learning
- To effieciently compute similarities in a transformed feature space without explicit transformation

#Q4 Why is kernel PCA ofter preffered over standard PCA in some applications
- It enables the extraction of principal components in a higher-dimensional feature space, making nonlinear patterns more distinguishable

#Q5 Which of the following is an example of a commonly used kernel function?
- All of the above:
- Radial Basis Function (RBF) kernel
- Polynomial kernel
- Linear kernel


### Overfitting and regularisation
#Q1 A model is overfitted if:
- Performs well on the training set but not on the test set

#Q2 A model is underfitted if 
- Is not complex enough to capture the patterns in the training data well

#Q3 In the context of model fitting, model variance measures
--> The consistency of the model prediction for a particular sample

#Q4 In the contex of model fitting, model bias measures
-> How far off the predictions are from the correct values, in general

#Q5 Which of the following is NOT a way to tackle overfitting
-> Change the train/test split to minimize the test set prediction error

#Q6 Decreasing the value of C
-> Increases the regularization strenghts

#Q7 What is the difference between L2 and L1 regularization
-> L2 regularization puts constraints on the sum of the squares of the weights,
L1 regularization puts constraints on the sum of the abs values of the weights


### SVM and kernels
#Q1 In SVM, the margin is
-> the gap between the decision boundry and the hyperplanes

#Q2 In SVM, the support vectors are...
-> The training samples that are closest to the separating hyperplane

#Q3 The risk of overfitting increases when the margins are...
-> small

#Q4 Higher values of the parameter C...
-> Penalizes samples in or on the wrong side of the margin strongly

#Q5 Which of the following is NOT true about the kernel trick in SVM?x
X - Introducing kernels reduces the computational demand
- The kernel can be seen to measure the similarity between samples
- For valid kernels, it is guaranteed that a corresponding feature mapping exists
- It projects the data into a higher-dimensional space where the data is linearly separable


### Cross_Validation
#Q1 Based on the given output in the black box (train,split), what is the correct cross-validation technique?
![[Pasted image 20250503232005.png]]
-> K-fold (3), each split has 2 samples, training has the remaining 4 samples, crucially test sets are non-overlapping, when combined covers entire dataset exactly-

#Q2 Based on the given output in the black box (train,split) what is the correct cross-validation technique?
![[Pasted image 20250503232538.png]]
-> Stratified kfold, ?

#Q3 Based oon the given output in the black box (train,split) what is the correct cross-validation technique?
![[Pasted image 20250503232726.png]]
-> LeaveOneOut, One is left out from train to be used as test.


### Pipelines
#Q1 What is the main purpose of using pipelines in scikit-learn?
-> To apply preprocessinng and modelling steps consistently

#Q2 How do pipelines prevent data leakage?
-> By applying preprocessing steps separately to training and testing data

#Q3 Which module in scikit-learn is used to combine multiple preprocessing steps for different columns?
-> ColumnTransformer

#Q4 What is the benefit of integrating preprocessing steps into pipelines?
-> Simplified code and maintanence

#Q5 Which of the following is TRUE about  pipelines?
-> They ensure reproduceability by applying preprocessing to training data only


### RANSAC (RANdom SAmple Consensus)
#Q1 What is the RANSAC algorithm used for in linear regression?
-> Remove outliers from the dataset

#Q2 How does the RANSAC algorithm identify outliers?
-> By randomly selecting a subset of a data points and fitting a line to them

#Q3 What is the minimum number of data points required to apply the RANSAC algorithm for linear regression?
-> 2

#Q4 What is the main advantage of the RANSAC algorithm over traditional linear regression?
-> It is less affected by outliers

#Q5 What is the main advantage of the RANSAC algorithm over traditional linear regression?
-> To determine the maximum distance between a point and the fitted line to be considered an inlier

#Q6 How does the RANSAC algorithm terminate?
-> When the maximum number of iterations is reached


### ROC-Bias-Variance-Performance-Metric
#Q1 & #Q2 Given the following ROC curves,
![[Pasted image 20250503234516.png]]
-> The black curve refers to bad performance
-> The dashed red curve refers to random performance

#Q3 What is correct about the precision?
-> It compares the number of correct positives predicted by your model to the total number of positives it predicts

#Q4 What is correct about the accuracy?
-> It compares the number of correct positives predicted by your model to the total number of positives it predicts

#Q5 What is correct about the F1 score?
-> It is the weighted harmonic mean of precision and recall

#Q6 What is bias?
-> It is the difference between the average prediction of our model and the correct value which we are trying to predict. Model with high bias pays very little attention to the training data

#Q7 What is Variance? 
-> It is the variability of model prediciton for a given data point or a value which tells us spread of our data. Model with high variance pays a lot of attention to training data and does not generalize on the data which it hasn't seen before

#Q8 What is the  irreducible error ?
-> It is the noise term in the true relationship that cannot fundamentally be reduced by any model. It typically comes from inherent randomness or an incomplete feature set.


### Gradient boosting
#Q1 What is the main idea behind gradient boosting?
-> Build weak learners sequentially on residuals

#Q2 In Gradient Boosting with Mean Squared Error (MSE) loss, what are the residuals equivalent to?
->  The second derivative of the loss

#Q3 What role does the learning rate (η) play in Gradient Boosting?
-> It increases the weight of correct predictions

#Q4 Which of the following is a key difference between XGBoost and classic Gradient Boosting?
-> XGBoost uses regularization and pruning to improve generalization

#Q5 In XGBoost, what does the hyperparameter `gamma` control?
-> Minimum loss reduction required to make a split

#Q6 What does the `lambda` parameter in XGBoost control?
-> The penalty added to large leaf weights to reduce model complexity


### Decision trees and KNN
#Q1 Which of the following is true about impurity measures?
	Impurity measures,quantify the level of heterogeneity or mixedness of class labels within a subset of data (a node in a decision tree) 'pure' node when all data points within belong to a single class.
-> They are measures of how far away from a pure node we are.

#Q2 Why are Gini impurity and Entropy more often used as impurity measures than the classification error?
-> Gini impurity and Entropy are more often used as impurity measures for splitting nodes during the _growth_ phase of decision trees primarily because they are **more sensitive to changes in the probability distributions of the classes within a node** compared to classification error
-> **They are differentiable functions, while the classification error is not**

#Q3 Which of the following is **NOT** true about decision trees?
- Feature scaling is not a requirement for decision trees
x - Decision trees can only be used for linearly separable classes
- Pruning decision trees can help prevent overfitting
- Decision trees can be used for complex decision boundaries

#Q4 Which of the following is **NOT** an advantage of Random Forest over decision trees?
- Random Forest gives better generalisation performance than individual trees
x - Random Forest gives models that are easier to interpret than decision trees
- Averaging multiple trees can lead to more robust models

#Q5 What makes KNN fundamentally different from the other classification methods we have dealt with?
- It cannot be extended to multi-class problems
- It does not use the distance measures, it uses the correlation between the feature values for pairs of data points
x - It does not learn a discriminative function

#Q6 Which of the following is **NOT** true about the parameter _k_ in KNN?
x - Higher _k_ means less bias, but higher variance
- Higher _k_ means less variance, but higher bias
- Lower _k_ means that the model is more complex and has higher variance
- Higher _k_ means that the prediction becomes more costly

#Q7 Which of the following is **NOT** true about KNN?
x - Generally good performance for datasets with a high number of features compared to other classification methods
- Good predictive vs. computational performance for datasets of moderate size
- Low cost of adaption to new training samples


### Ensamble Learning
**Bagging** = Multi instances of same model (decision trees) trained independent and in parallell. each model on a diff. random subset. pred from every model combined. - - To reduce var, for stability and decrease overfitting.
**Boosting** = Sequentially,one after another. each new (weak learner) is to fix mistakes of the last. 
- To reduce bias, creating a strong learner iterativ, improv. of weakness.
**Voting** = combines predicitons from multiple, diff models for a final prediction.
#Q1 Which of the following ensemble model helps in reducing variance?
-> Bagging

#Q2 What is an ensemble model in machine learning?
	-> B. An ensemble method is a technique that combines the predictions from multiple machine learning algorithms together to make more accurate predictions than any individual model.
	A. An ensemble method is a technique which uses multiple independent similar or different models/weak learners to derive an output or make some predictions.

#Q3 Which of the following is a common approach to ensemble learning?
-> Boosting and bagging

#Q4 Which of the following is an example of a dimensionality reduction technique?
-> Principal Component Analysis (PCA)

#Q5 Boosting is sequential
-> True

#Q6 Bagging is paralel
-> True

#Q7 Which of the following is a potential advantage of Majority Voting?
-> It is less prone to overfitting than individual models

#Q8 Which of the following ensemble model helps in reducing bias?
-> Boosting



### DBSCAN, K-mean usupervised clustering.
#Q1  What does DBSCAN stand for?
-> Density-Based Spatial Clustering of Applications with Noise

#Q2  In DBSCAN, a **core point** is defined as a point that has:
-> At least "MinPts" neighbors within "*ε*" distance

#Q3  In DBSCAN, what happens to **border points**?
-> They are assigned to the cluster of a nearby core point

#Q4  Which of the following is **true** about DBSCAN compared to K-Means?
-> DBSCAN can identify noise points. -- can id points not belonging to any cluster and label them as noise/outliers. 

#Q5  A main challenge for DBSCAN in **high-dimensional spaces** is:
-> Distance measures become less meaningful ("curse of dimensionality")
with more dimensionality distance between two points tend to become less distinct and more uniform. => cant find a ε that distigushes dense regions from sparse. which leads to poor cluster id.


### K-means
need to specify n-clusters
#Q1 What is the objective of k-means clustering?
-> To minimize the within-cluster distance

#Q2 How is the initial centroid position chosen in k-means clustering?
-> Randomly

#Q3 How many iterations does k-means typically go through before converging?
-> Until convergence

#Q4 What is the drawback of k-means clustering?
-> It is sensitive to initial conditions

#Q5 What is the most commonly used distance metric in k-means clustering?
-> Euclidean distance

#Q6 How can you evaluate the quality of k-means clustering results?
-> By calculating the sum of squared errors (SSE)


### Adaboost and Bagging, "Adaptive boosting"
#Q1 What is AdaBoost?
-> A boosting algorithm

#Q2 In AdaBoost, which of the following is true about the weight assigned to each training example?
-> It is initially assignes uniformly to all examples

#Q3 In AdaBoost, how are the coefficients assigned to the weak classifiers in the ensemble?
->  They are assigned based on their accuracy in classifying the training examples

#Q4 Which of the following is a potential disadvantage of AdaBoost?
-> It is prone to overfitting

#Q5 What is Bagging?
-> An ensamble learning technique

#Q6 In Bagging, what is the main idea behind the bootstrap sampling?
-> To obtain a subset of the training examples by randomly sampling with replacement


### Regression
#Q1 What is the primary objective of linear regression analysis?
-> To identify the relationship between the input and outcome variables

#Q2 What is the difference between simple linear regression and multiple linear regression?
-> Simple linear regression involves only one independent variable, while multiple linear regression involves multiple independent variables. 

#Q3 In linear regression, what is the difference between the dependent variable and the independent variable?
-> The dependent variable is the variable being predicted, the independent variable is a predictor variable 

#Q4 What is the least-squares method in linear regression?
-> A method for determining the best-fit line by minimizing the sum of the squared residuals.

#Q5 What is the purpose of the coefficient of determination (R-squared) in linear regression?
-> To measure the proportion of the variation in the dependent variable that is explained by the independent variable.

#Q6 What is the a residual  in linear regression?
-> Residual is the difference between the observed (actual) value and the predicted value from the model.



### Linear and Logistic regression
#Q1 Why do we minimize the sum of squared errors rather than the sum of the absolute values of the errors in linear regression?
-> We want larger errors to count more than smaller errors

#Q2 What is the relation between linear regression and Adaline?
-> Adaline is linear regression with a threshold function added

#Q3 Which of the following are requirements for the least squares solution to be unique?
-> The matrix X'X must be non-singular

#Q4 What is the relation between the sigmoid function and the logit (log-odds)?
-> the sigmoid function is the invers of the logit

#Q5 What is the main difference between Logistic regression and Adaline?
-> Logistic regression uses a sigmoid activation function
while Adaline uses a linear activation function


### Random Forests Regression
#Q1 What is random forest regression?
-> A type of ensemble learning model

#Q2 How does a random forest regression model make predictions?
-> By averaging the predictions of all decision trees in the forest

#Q3 What is the purpose of bagging in random forest regression?
-> To reduce overfitting and increase model generalization

#Q4 What is the advantage of random forest regression over a single decision tree regression?
-> Random forest regression is more accurate

#Q5 Which of the following is a disadvantage of random forest regression?
-> It requires a large amount of memory to store the model


### Clustering in general
#Q1 What is the main goal of clustering?
-> To group data based on similarities

#Q2 What is the purpose of dimensionality reduction in clustering?
-> To eliminate irrelevant features

#Q3 Which of the following statements is true about classification and clustering?
-> Classification is a type of supervised learning,
Clustering is a type of unsupervised learning.

#Q4 What is the main difference between classification and clustering?
-> Classification is used to predict a target variable based on input variables,
Clustering is used to group similar data points.

#Q5 In clustering, what is the primary objective of minimizing the objective function?
-> To minimize the distance between poinst within a cluster


### Evaluating Clustering
#Q1 What is the Silhouette coefficient used for?
-> Measuring the seperation between clusters

#Q2 A Silhouette coefficient close to 1 indicates: (goes from -1 to +1)
-> +1 indicates Well-separated clusters,
high cohesion (similar within clusters)
poor match to neighbor clusters (high separation)

#Q3 In elbow analysis, what is plotted on the x-axis?
-> Number of clusters, (elbow method = plotting measures of clustering performance on y-axis vs number of clusters K on x-axis.)

#Q4 What does the elbow point in elbow analysis represent?
-> The optimal number of clusters.



### Hierarchical clustering
#Q1 What is hierarchical clustering?
-> A clustering algorithm that forms nested clusters by either merging or splitting existing cluster

#Q2 What are the two main types of hierarchical clustering?
-> Agglomerative (bottom up merging)
Divisive (top-down splitting)

#Q3 What is the linkage criterion in agglomerative clustering?
-> A measure of the similarity between two clusters that determines which clusters to merge

#Q4 What is dendrogram in hierarchical clustering?
-> A visualization tool that shows the hierarchy of nested clusters
	"A dendrogram is the primary output visualization for hierarchical clustering. It's a tree-like diagram illustrating the sequence of merges or splits and the hierarchical relationships between clusters, often showing the distance level at which actions occurred"

#Q5 What is the main advantage of hierarchical clustering?
-> It does not require the number of clusters to be specified in advanced


### Fuzzy C-mean
#Q1 What is the goal of Fuzzy C-Mean clustering?
-> To minimize the sum of squared distances between data points and their assigned clusters
	"The objective function that Fuzzy C-Means aims to minimize is explicitly defined as J(W,C)=∑i=1n∑j=1cwijm∥xi−cj∥2J(W,C)=∑i=1n∑j=1cwijm∥xi−cj∥2"

#Q2 What is the advantage of Fuzzy C-Mean clustering over K-Means clustering?
-> Fuzzy C-mean clustering can handle noisy data better than K-means clustering

#Q3 How does the fuzzifier parameter in Fuzzy C-Mean clustering affect the degree of membership for each data point?
-> Higher fuzzier values lead to more diffuse membership values

#Q4 Which of the following is a disadvantage of using Fuzzy C-Means clustering (and most distance-based clustering algorithms such as K-Means) in high-dimensional data?
-> FCM may struggle to find meaningful clusters in high-dimensinal spaces

#Q5 Which of the following is a disadvantage of Fuzzy C-Means clustering compared to K-Means clustering?
-> FCM is more sensitive to the inital choice of centroids

" - FCM is more sensitive to the initial choice of centroids
- FCM can handle datasets with arbitrary cluster shapes
- FCM always converges to the global optimum
- Non of the provided answers"
