- Discuss a selection of popular and powerful machine learning algorithms commonly  used in academia and industry  
-  Learn about the differences between several supervised learning algorithms for  
classification and their individual strengths and weaknesses  
	– Perceptron  
	– Logistic regression  
	– Support vector machines  
	– Decision trees  
	– Random forest  
	– K-nearest neighbours  
-  First steps with the scikit-learn library


No single classifer always work best,
depentent on dataset and what we want to do

Should compare them to see what works best for a particular problem

The problem at hand may be influenced by a number of contextual settings  
	– Number of features  
	– Number of samples  
	– Distribution of the data  
	– Amount of noise in the data  
	– Whether classes are linearly separable or not

## Summary of the five main steps in training an ML algorithm  
1. Selecting features and collecting training samples  
2. Choosing a performance metric  
3. Choosing a classifier and an optimisation algorithm  
4. Evaluating the performance of the model  
5. Tuning the algorithm


# To train a perceptron with scikit learn
![[scikit_learn_intro.ipynb]]


# Multi-class classification with OvR
- Multi-class  
	We only discussed binary classifiers, what about multiple classes?  
	
- OvR (One-vs-Rest) also called OvA (One-vs-All)  
	• A technique that allows us to extend a binary classifier to multi-class problems  
	• Using OvA, we can train one classifier per class, where a particular class is treated as the positive  
	class and the samples from all other classes are considered negative classes  

- Classification of a new sample:  
	• Use the n trained classifiers, where n is the number of class labels  
	• Assign the class label with the highest confidence  
	• We usually want a classifier for this that can output probabilities (e.g. logistic regression)  
	• Perceptron: Choose the class label that is associated with the largest net input value z
![[Pasted image 20250224152035.png]]


# Test/Train Split
- Split the data into separate training and test datasets  
- More details later in “Best practices for evaluation and hyperparameter tuning”  
- Use the train_test_split function from scikit-learn's model_selection  
module  
- Randomly split the X and y arrays into 30 percent test data (45 samples) and 70  
percent training data (105 samples)

#Split data into training and test data (70% training, 30% test)
```python
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=1, stratify=y)
```
##### Properties of the train_test_split function:  
- **Shuffles the dataset** internally **before** splitting → we don’t need to worry  
about the ordering of the samples prior to splitting  
-  Provides a random_state parameter for a **fixed random seed** (default:  
random_state=None) → «**reproducible**» shuffling of samples (handy  
when training multiple times)  
- Built-in support for **stratification** with stratify=y → train_test_split  
returns training and test subsets that have the **same proportions of class**  
**labels** as the **input datase**t


##### Checking the distribution of the classes in the training and test set with numpy:
```python
# Show distribution of classes in input data, training data and test data
print(f"Labels counts in y: {np.bincount(y)}")
print(f"Labels counts in y_train: {np.bincount(y_train)}")
print(f"Labels counts in y_test: {np.bincount(y_test)}")
```
Labels counts in y: [50 50 50] Labels counts in y_train: [35 35 35] Labels counts in y_test: [15 15 15]

##### Feature scaling
- Many machine learning and optimisation algorithms also require feature scaling  
for optimal performance  
- Standardise the features using the StandardScaler class from scikit-learn's  
preprocessing module
```python
# Initialise standard scaler and compute mean and stddev from training data

sc = StandardScaler()
sc.fit(X_train)

# Transform (standardise) both X_train and X_test with mean and stddev from
# training data
X_train_sc = sc.transform(X_train)
X_test_sc = sc.transform(X_test)

print("Mean of X_train_sc:", np.mean(X_train_sc, axis=0))
print("Stddev of X_train_sc:", np.std(X_train_sc, axis=0))
```
Mean of X_train_sc: [5.70971841e-17 7.19001578e-17] Stddev of X_train_sc: [1. 1.]

![[Pasted image 20250224152912.png]]

### Important: Scale the test and training data with the scaling obtained from the training data!  
- Using the fit method, StandardScaler estimated the parameters μ (sample mean) and σ  (standard deviation) for each feature dimension from the training data  
-  Calling the transform method: Standardises the training and test data using the estimated  parameters μ and σ acquired from the training data → the values from the training and test  data are comparable to each other



# Training the model

- Load the Perceptron class from the linear_model module  
- Initialise a new Perceptron object  
	– The parameter eta0 defines the learning rate  
	– The parameter max_iter defines the number of epochs  
	(passes over the training set)  
- Train the model using the fit method
```python
ppn = Perceptron(max_iter=40, eta0=0.1, random_state=1)
ppn.fit(X_train_sc, y_train)
```
Finding an appropriate learning rate requires some experimentation  
- If the learning rate is too large, the algorithm will overshoot the global cost minimum  
- If the learning rate is too small, the algorithm requires more epochs until  convergence → can make the learning slow - especially for large datasets  
- he random_state parameter ensures the reproducibility of the initial shuffling of  the training dataset after each epoch

# Evaluation/Prediciton
```python
# Predict classes for samples in test set and print number of misclassfications
y_pred = ppn.predict(X_test_sc)
print("Misclassified samples: {0}".format((y_test != y_pred).sum()))
```
-> Misclassified samples: 1

```python
# Print accuracy computed from predictions on the test set
print("Accuracy: {0:.2f}".format(accuracy_score(y_test, y_pred)))

# Print accuracy computed from predictions on the test set
print("Accuracy: {0:.2f}".format(ppn.score(X_test_sc, y_test)))
```
Accuracy: 0.98 Accuracy: 0.98
 Simple performance metric; the method score also outputs accuracy


```python
```
