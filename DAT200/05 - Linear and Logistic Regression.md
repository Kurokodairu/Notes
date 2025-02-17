


## Linear regression 
- The goal is to find a straight line, that makes the difference (Resudials) between the points and the line as small as possible
![[Pasted image 20250217142700.png]]
![[Pasted image 20250217142719.png]]


## Probalistic interpretation
Linear model:
$$
{Linear Model} y^{(i)} = \mathbf{x}^{(i)} \boldsymbol{\theta} + \epsilon^{(i)}
$$
$$
{Error Model (Assumption)}  \epsilon^{(i)} \sim \mathcal{N}(0, \sigma^2) \] \[ p(\epsilon^{(i)}) = \frac{1}{\sigma \sqrt{2 \pi}} \exp{\left(-\frac{(\epsilon^{(i)})^2}{2\sigma^2}\right)} 
$$
$$
*{Assumptions} 
\epsilon^{(i)} \text{ are i.i.d. (independent and identically distributed).}
$$


## Logistic Regression
A classification method, binary classifier

The plan:
Use a linear model for the log-odds
Convert to probability using the logistic function
Use thresholding to predict the class label



Gives us labels and probability

![[Pasted image 20250217151821.png]]
