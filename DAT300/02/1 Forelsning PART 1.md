# Parallelising Neural Network Training with Keras
#### Choosing activation functions for multilayer networks
* Technically, one can use **any function** as an activation function in multilayer neural networks as long as it is **differentiable**
* One could can even use **linear** activation functions, such as in Adaline, but ...
- would **not** be very useful to use linear activation functions for both hidden and output layers 
- to tackle complex problems one needs to introduce **non-linearity**
- the **sum of linear functions** would yield only **another** linear function


### Activation Functions: Pros and Cons

| **Activation Function**       | **Pros**                                                | **Cons**                                             |
| ----------------------------- | ------------------------------------------------------- | ---------------------------------------------------- |
| **Linear**                    | Simple, good for regression                             | No non-linearity, cannot handle complex data         |
| **Unit Step**                 | Simple, useful in binary classification                 | Not differentiable, poor for gradient-based learning |
| **Sign**                      | Easy to compute                                         | Non-differentiable, limits model complexity          |
| **Piece-wise Linear**         | Used in specific algorithms (SVMs)                      | More complex, limited use in neural networks         |
| **Logistic (Sigmoid)**        | Smooth output, good for probabilities                   | Vanishing gradient problem, slow convergence         |
| **Tanh (Hyperbolic Tangent)** | Zero-centered output, stronger gradient                 | Suffers from vanishing gradients                     |
| **ReLU**                      | Efficient, fast convergence, avoids vanishing gradients | Can "die" for negative inputs, not zero-centered     |
![[Pasted image 20250915124603.png]]
* The **logistic activation function** (which we often called *sigmoid function*) mimics the concept of a neuron in a brain most closely - think of it as the probability of whether a neuron fires or not
* However, logistic activation functions can be problematic
    - When net input $\textbf{z}$ is **highly negative**, $\phi{(\textbf{z})}$ would be close to zero
    - If $\phi{(\textbf{z})}$ is close to zero the neural network would learn **very slowly**
    - More slowly learning could lead to the neural network **getting trapped in local minima** during training

### Estimating class probabilities in multiclass classification via the ``softmax`` function
* In previous sections: obtain a class label using the ``argmax`` function
* The ``softmax`` function is in fact a soft form of the ``argmax`` function; instead of giving a single class index, it provides the **probability of each class**
* The ``softmax`` function allows for computation of **meaningful** class probabilities in **multiclass** settings (multinomial logistic regression)
![[Pasted image 20250915125432.png]]

 - $p(y = i \mid z)$  
  → "The probability that the output $y$ equals class $i$, given the input vector $z$."

- $e^{z_i}$  
  → "Take the exponential of the score (logit) $z_i$ for class $i$."

- $\sum_{j=1}^{M} e^{z_j}$  
  → "Compute the sum of exponentials of all class scores $z_j$, where $M$ is the total number of classes."

- $\frac{e^{z_i}}{\sum_{j=1}^{M} e^{z_j}}$  
  → "Divide the exponential of class $i$ by the sum of exponentials of all classes, to normalize into a probability."
- ![[Pasted image 20250915125507.png]]
softmax not in the hidden layer because it squashed information to 0 - 1. this loses a lot of information.
### hyperbolic tangent
* Another *sigmoid function* that is often used in the **hidden layers** of artificial neural networks is the **hyperbolic tangent** (commonly known as ``tanh``)
* ``tanh`` can be interpreted as a rescaled version of the logistic function
***Advantage of the hyperbolic tangent over the logistic function**
* It has a **broader output spectrum** and ranges in the **open interval** (-1, 1)
* This can improve the convergence of the back propagation algorithm [Neural Networks for Pattern Recognition, C. M. Bishop, Oxford University Press, pages: 500-501, 1995](https://www.microsoft.com/en-us/research/wp-content/uploads/1996/01/neural_networks_pattern_recognition.pdf)
* In contrast, the logistic function returns an output signal that ranges in the open interval (0, 1)

### Relu - Rectified Linear Unit activation
* ``tanh`` and ``logistic`` activations suffer from **vanishing gradient problem**
* This means the **derivative of activations** with respect to net input **diminishes** as $z$ becomes large
* As a result, **learning weights during the training phase** become **very slow** because the gradient terms may be **very close to zero**
* ReLU activation addresses this issue
![[Pasted image 20250915125904.png]]
* ReLU is still a nonlinear function that is good for learning complex functions with neural networks
* Besides this, the derivative of ReLU, with respect to its input, is always 1 for positive input values
* Therefore, it **solves** the problem of vanishing gradients, making it **suitable for deep neural networks**


### Loss function: cross entropy
* Cross entropy loss, or log loss, measures the **performance of a classification model** whose output represents a **probability**, that is, a value between 0 and 1. 
* Cross entropy loss **increases** as the predicted probability **diverges** from the actual label. So predicting a probability of for example .017 when the actual observation label is 1 would result in a **high** loss value. 
* A perfect model would have a log loss of 0. 

**Choice of cross entropy in Keras**
* Binary classification problems: use binary cross entropy (``binary_crossentropy`` in Keras)
* Multi-class classification problems: use categorical cross entropy (``categorical_crossentropy`` in Keras)

#### Binary cross entropy
![[Pasted image 20250915132159.png]]
![[Pasted image 20250915132218.png]]
![[Pasted image 20250915132249.png]]
### Summary of Differences for Cross entropy:
- **Binary Classification**:
  - Two classes (0 or 1).
  - One predicted probability for class 1.
  - Loss is calculated for this single probability.

- **Multiclass Classification**:
  - More than two classes.
  - Multiple predicted probabilities (one for each class).
  - Loss is calculated over all classes, penalizing the model for the true class.

Similar to one-hot-encoding?
	-> if 3 classes 
		cat [1 0 0]
		dog [0 1 0]
		tiger [0 0 1]



