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



### Data inspection, Perceptron and Adaline
#Q1 Which of the following plots are univariate
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

# PCA
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