![[03-Overfitting-Regularization.pdf]]
### Classification Pipeline RECAP
##### Goal
- Train a classifier that **generalizes** well on **unseen** data
##### Train/Test Split
- Train (for training) / Test (unseen) split to get a better estimate of the generalization error via the error on the test set
- **Randomize and stratify** to get equal class distributions in the test and training set
##### Feature Scaling/Transformations
- Always apply **identical** transformations to the test and training set
- **Avoid information leakage!** Standardization: Compute mean/std **on the training set**
##### Evaluation
- **Accuracy**: 1.0 – misclassified_samples / all_samples


## Overfitting / Underfitting
#Overfitting
- Common problem in machine learning
- We want the model to **generalize** well to ***unseen*** data
- A model that is overfitted works well on the trained data, but does not generalize well to unseen data (Test data)


A model that suffer from **overfitting** will
- Have high variance
- High variance might be caused by too many parameters that lead to a model that is too complex given the training data
- -> **Poor performance** on unseen data because of high variance

A model that suffers from **underfitting** will
- Have a high bias 
- This means that the model is not complex enough to capture the patterns in the training data well
- -> **Poor performance** on unseen data because of high bias
- ![[Pasted image 20250227122839.png]]
![[Pasted image 20250227122856.png]]
![[Pasted image 20250227122918.png]]



## Bias - Variance
**Variance**
- Measures the consistency (Variability) of the model prediciton for a particular sample
- If the model is retrained on different subsets of the training data and the prediction for a particular sample differs a lot each time → **high variance**
- The model is sensitive to the randomness in the training data

**Bias**
- Measures how far off the predictions are from the correct values in general
-  If the model is retrained multiple times on different training datasets, bias measures the systematic error that is not due to randomness


## Bias and Variance

Given a true value y and an estimator ŷ
# Estimator Properties

## Bias and Variance

Given a true value y and an estimator ŷ

## Bias
$$

Bias(y^):=E[y^]−y
$$
$$Bias(\hat{y}) := E[\hat{y}] - yBias(y^):=E[y^]−y
$$


## Variance
$$
Var(y^):=E[(E[y^]−y^)2]=E[E[y^]2+y^2−2E[y^]y^]
$$$$
Var(\hat{y}) := E[(E[\hat{y}] - \hat{y})^2] = E[E[\hat{y}]^2 + \hat{y}^2 - 2E[\hat{y}]\hat{y}]
$$
$$Var(y^):=E[(E[y^]−y^)2]=E[E[y^]2+y^2−2E[y^]y^]
$$
$$
=E[y^]2+E[y^2]−2E[y^]E[y^]=E[y^]2+E[y^2]−2E[y^]2=E[y^2]−E[y^]2= E[\hat{y}]^2 + E[\hat{y}^2] - 2E[\hat{y}]E[\hat{y}] = E[\hat{y}]^2 + E[\hat{y}^2] - 2E[\hat{y}]^2 = E[\hat{y}^2] - E[\hat{y}]^2=E[y^]2+E[y^2]−2E[y^]E[y^]=E[y^]2+E[y^2]−2E[y^]2
$$
$$
=E[y^2]−E[y^]2
$$
**E[ŷ]**: The expected value (expectation) of the estimator ŷ (here: expectation over the training sets)


![[Pasted image 20250227123920.png]]


# Tackling overfitting via regularization
Finding the appropriate **complexity – bias-variance** trade-off is important for good
performance

- Collect more training data
- Introduce a **penalty for complexity via  regularization**
- Choose a simpler model with fewer parameters
- Reduce the dimensionality of the data (feature selection, dimensionality reduction, Ch 06)

-  Good option: Tune the complexity of the model using regularisation
-  Regularisation is very useful for
	– Handling collinearity (high correlation among features)
	– Filtering out noise from the data
	– Preventing overfitting
- To make regularisation work properly, features need to be **scaled** / **standardised**
- Concept of regularisation:
	– Introduce additional information (bias) to penalise extreme parameter (weight) values
	– The most common form of regularisation is so-called L2 regularisation (sometimes
	also called L2 shrinkage or weight decay) (For details: See Ch.04 in the course book)

### L2 Regulatization
![[Pasted image 20250227124455.png]]
![[Pasted image 20250227124514.png]]
#### Regularisation parameter 𝜆
- Provides control over how well the training data is fitted while keeping the weights small
-  Increasing the value of 𝜆 → increases the regularisation strength
- The LogisticRegression class in scikit-learn implements a parameter C for regularisation
- C is the inverse of 𝜆 (C is the inverse regularisation parameter): C := 1 /𝜆
- Decreasing the value of C → increases regularisation strength


# USING
```python
clf = LogisticRegression(max_iter=100, penalty="l2", solver="liblinear", random_state=1, C=10.0**c)
```
Using penalty=, and C= 
Graphing Accuracy with different C values to find the best model


### Example using C, with different C values
in folder Lec08
![[DAT200/03_logreg_iris_regularization.ipynb]]

![[Pasted image 20250227131131.png]]


### Geometric interpretation of regularization
![[Pasted image 20250227133909.png]]
![[Pasted image 20250227133936.png]]


### Sparsity-promoting regularization
![[Pasted image 20250227134032.png]]
![[Pasted image 20250227134047.png]]

![[Pasted image 20250227134119.png]]

+ L1 regularisation usually yields sparse feature vectors → most feature weights will be zero  
+  Sparsity can be useful in practice if we have a high-dimensional dataset with many  features that are irrelevant  
+  L1 regularisation is especially useful in cases where more irrelevant dimensions than  samples are present  
+ L1 regularisation can be understood as a technique for feature selection
![[Pasted image 20250227134221.png]]


### Scikit-learn classifiers with a regularization option  
+  Perceptron  
+ Logistic regression  
+  Linear SVC  
	Options:  
	• L1 – a.k.a LASSO (Least Absolute shrinkage and Selection Operator)  
	• L2 – a.k.a. Ridge penalisation  
	• L1 + L2 – a.k.a. Elastic Net