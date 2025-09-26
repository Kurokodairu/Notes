* Use of backpropagation to update weights **across many** layers 
    * this leads to vanishing gradient problem
    * root of the problem: the gradient of a given layer is the **product** of gradients at **previous** layers

**Chain rule leading to vanishing gradient problem** (1)
* Fundamentally, the backpropagation algorithm is an implementation of the chain rule from calculus
* The chain rule involves the multiplication of terms
* Backpropagating an error from one neuron back to another can involve multiplying the error by a number terms with values less than 1
* These multiplications by values less than 1 happen repeatedly as the error signal gets passed back through the network
* This results in the error signal becoming smaller and smaller as it is backpropagated through the network
* Indeed, the error signal often diminishes exponentially with respect to the distance from the output layer
* The effect of this diminishing error: the weights in the early layers of a deep network are often adjusted by only a tiny (or zero) amount during each training iteration
* In other words: the early layers 
    - either train very, very slowly 
    - or do not move away from their random starting positions at all
      

**Chain rule leading to vanishing gradient problem** (2)
* However, the early layers in a neural network are vitally important to the success of the network
* It is the neurons in these layers that learn to detect the features in the input
* Later layers of the network use detected features as the fundamental building blocks of the representations 
* These building blocks ultimately determine the output of the network
* The error signal that is backpropagated through the network is in fact the gradient of the error of the network
* --> this problem of the error signal rapidly diminishing to near zero is known as the vanishing gradient problem


#### the sigmoid function and its derivative
![[Pasted image 20250922125105.png]]
Problem with sigmoid function as activation function

* The derivative becomes very small for large positive $z$ and large negative $z$
* Derivative largest at $0.25$ for $z = 0$ (small value in itself)

#### the hyperbolic tangent activation function and its derivative
![[Pasted image 20250922125152.png]]
Problem with hyperbolic tanget function as activation function
* The derivative becomes very small for large positive $z$ and large negative $z$
* At least, derivative around $z = 0$ higher than for sigmoid activation function (maximum 1)
* ==> Vanishing gradient problem still present, but maybe somewhat less severe than with sigmoid
* Consequences
    * same as for sigmoid activation function


* Use of backpropagation to update weights **across many** layers 
    * ==> gradients for first layers may become very small (multiplication of many values < 1 for derivative of sigmoid and hyperbolic tanget activation functions) 
* Consequences
    * long training times
    * ==> weights of first layers change very little to not at all (many epochs needed to update weights)
    * ==> in practice, only weights of last layers will be updated
    * poor performance (poor learning performance of first layer influences learning of following layers)
    * ==> learning of last layers depend on what first layers learn

<font color=green>**COLAB NOTEBOOK 05**</font>: [Regularisation in Keras](https://colab.research.google.com/drive/17xnyr8TsZu_wF7wQZFnQ-1C9NqxkOXb9?usp=sharing)
