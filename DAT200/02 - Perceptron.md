The Perceptron is a binary classification function. It predicts whether an instance belongs to one class or another.
Artificial Neuron Inspiration: The Perceptron model is inspired by neurons in the human brain and is based on the McCullock-Pitts (MCP) neuron model from 1943

The Perceptron learning rule itself is based on the MCP neuron model and was published in 1957

Functionality:
The Perceptron is a binary classification function
It predicts whether an instance belongs to one class or another
It works by multiplying a set of weights with a set of inputs and summing them

This sum is then passed through a threshold function to yield a binary output of 1 or -1
The algorithm learns optimal weight coefficients for the input features automatically
. The product of these weights and the input features determines whether the neuron "fires" or not

## Formal Definition:
The Perceptron is used for binary classification tasks, where one class is coded as 1 (positive class) and the other as -1 (negative class)

It uses a decision function (𝜙(𝑧)) that takes linear combinations of values in a vector x and corresponding weights in a weight vector w

The net input (z) is computed as: z = w1x1 + w2x2 + ... + wnxn
If z is greater than or equal to a threshold (θ), the class 1 is predicted; otherwise, class -1 is predicted

Simplified Representation:
To simplify, the threshold θ can be brought to the left side of the equation
The net input z can be written in a compact form, incorporating a bias unit: z = w*x + b, where b is the bias unit

## Initial Algorithm:
	1 . Initialize weights to 0 or small random numbers
	2.  For each training sample:
		* Compute the output value (prediction of the true class label y)
		* Compare the true class label and the predicted output
		* If they differ, update the weights

Perceptron Learning Rule:
The weights wj in the weight vector w are updated simultaneously
The update of each weight wj is written as: Δwj = η(y(i) - ŷ(i))*x(i)j, where
η is the learning rate (typically a constant between 0.0 and 1.0)
y(i) is the true class label
ŷ(i) is the predicted class label
x(i)j is the value of feature j in sample vector i

Error Correction:
If a positive class is predicted incorrectly, the weight update is proportional to the value of x(i)
If a negative class is predicted incorrectly, the weight update is also proportional to the value of x(i)

Convergence:
Convergence of the Perceptron algorithm is guaranteed only if:
The two classes are linearly separable
The learning rate is sufficiently small
If the classes cannot be separated by a linear decision boundary, take measures such as
Set a maximum number of iterations (epochs) over the training samples
Set a threshold for the maximum number of tolerated misclassifications