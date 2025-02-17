


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



# Derivative of the loss function is given by
Hence, the derivative of the loss function is given by:

$$
\frac{\partial L(\theta)}{\partial \theta} = 
- \sum_{i=1}^{n} \left[ y^{(i)} (1 - \sigma(z)) \mathbf{x}^{(i)} - (1 - y^{(i)}) \sigma(z) \mathbf{x}^{(i)} \right]
$$

$$
= - \sum_{i=1}^{n} \left[ \big(y^{(i)} - \sigma(z)\big) \mathbf{x}^{(i)} \right] = 0
$$

The goal is to maximize the likelihood of the parameters -> minimize negative log-likelihood

$$ L(\theta) = -\ell(\theta) $$ $$ \ell(\theta) = \sum_{i=1}^{n} \left[ y^{(i)} \log (\sigma(z)) + (1 - y^{(i)}) \log (1 - \sigma(z)) \right] $$ $$ \frac{\partial L(\theta)}{\partial \theta} =  \sum_{i=1}^{n} \left[ y^{(i)} (1 - \sigma(z)) \mathbf{x}^{(i)} - (1 - y^{(i)}) \sigma(z) \mathbf{x}^{(i)} \right] $$ $$ = -\sum_{i=1}^{n} \left[ (y^{(i)} - \sigma(z))\mathbf{x}^{(i)} \right] = 0 $$ Component-wise: $$ \frac{\partial L(\theta)}{\partial \theta_j} =  -\sum_{i=1}^{n} x_j^{(i)} \left[ y^{(i)} - \sigma(x^{(i)}\theta) \right] = 0 $$`
=> but is non-linear so we have no explicit solution


![[Pasted image 20250217151821.png]]
