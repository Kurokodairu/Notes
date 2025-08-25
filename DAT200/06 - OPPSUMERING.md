## Do quizzes - Check quizzes by AI

## Notation for vectors and matrices


## Perceptron, Adaline, Linear regression and logistic regression
	- models 
	- activation functions
	- Loss functions
	- Gradients and weight/parameter updates

![[Pasted image 20250220123336.png]]

# Parameters
$$
x^i \Theta = b + x^i w
$$

(Equals the net input z, which is used by all four methods)
![[Pasted image 20250220123857.png]]

# Linearly seprable
Where a linear decision boundry line that seperates the two classes

If not we cant place a line that can seperate the classes

## #Loss_functions
![[Pasted image 20250220124029.png]]



## Newtons method for weight/parameter optimisation



## Newton vs gradient descent
\\ File:![[DAT200/newton_vs_gradientdescent.ipynb]]
# Overview

This notebook implements and visualizes two fundamental optimization algorithms:

- Newton's Method - for finding roots of functions

- Gradient Descent - for finding minima of functions

# Key Components

## Core Functions

### 1. Newton's Method

def newton(f, df, x0, tol, max_iter):
- Finds roots of a function (where f(x) = 0)
- Parameters:
- f: Function to find root of
- df: Derivative of f
- x0: Initial guess
- tol: Convergence tolerance
- max_iter: Maximum iterations

- Uses the formula: x_{n+1} = x_n - f(x_n)/f'(x_n)
- Returns the solution, iteration count, and history

### 2. Gradient Descent

def gradient_descent(f, df, x0, tol, max_iter, alpha, use_momentum=False):

- Finds minima of a function
- Parameters similar to Newton's method, plus:
- alpha: Learning rate
- use_momentum: Optional momentum term for faster convergence
- 
- Uses the formula: x_{n+1} = x_n - α∇f(x_n)
- Optional momentum adds: + 0.9(x_n - x_{n-1})

## Helper Functions

### Sigmoid Function Family

- sigmoid(x): Standard logistic function: 1/(1 + e^(-x))
- d_sigmoid(x): First derivative of sigmoid
- d2_sigmoid(x): Second derivative of sigmoid

### Loss Function Family

- L(x): Loss function: (0.5 - sigmoid(x-1))² + 4
- dL(x): Derivative of loss function
- d2L(x): Second derivative of loss function

## Demonstration Code

The notebook then demonstrates these algorithms with:

- Initial parameters:
- Starting point: x₀ = 0.5
- Tolerance: 10⁻⁴
- Max iterations: 1000
- Learning rate (α): 0.2
- 
- Visualization:
- Two subplots comparing both methods
- Left plot: Loss function and gradient descent trajectory
- Right plot: Derivative function and Newton's method trajectory
- Shows convergence paths and final solutions
- Displays iteration counts and final errors

# Key Insights

- Newton's method typically converges in fewer iterations (quadratic convergence)

- Gradient descent is more stable but slower (linear convergence)

- Both methods successfully find the minimum at x = 1

- The visualization helps understand how each method approaches the solution differently

This code is particularly useful for educational purposes, demonstrating the behavior and differences between these two fundamental optimization algorithms.

Add context

  

Edit code (Ctrl+I), @ to mention, ↑ to select

claude-3.5-sonnet

image

normal

submit⏎

0 0

0

Cursor Tab

Cell 3 of 3

Spaces: 4

Info: Connecting to kernel: .venv (Python 3.13.1)

- Code
- Markdown
- 
- Run All
