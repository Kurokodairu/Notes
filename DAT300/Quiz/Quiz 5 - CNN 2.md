## Spørsmål 1

**If your input is 64x64x16, how many parameters are there in a single 1x1 convolution filter, including bias?**  
✅ Riktig svar: 17

>[!example]- Wrong answers
>- 3
>- 4097
>- 1

---

## Spørsmål 2

**Which of the below can you implement to solve the exploding gradient problem?**  
✅ Riktig svar: Impose gradient clipping

>[!example]- Wrong answers
>- Use SGD optimization
>- Increase the batch size
>- Decrease the batch size

---

## Spørsmål 3

**What is the benefit of using Momentum optimization?**  
✅ Riktig svar: Helps get weights out of local minima

>[!example]- Wrong answers
>- Effectively scales the learning rate to act the same amount across all dimensions
>- Combines the benefits of multiple optimization methods
>- Simple update rule with minimal hyperparameters

---

## Spørsmål 4

**What is the purpose of using 1x1 convolution?**  
✅ Riktig svar: 1x1 convolution reduces the size of feature maps before sending them to layers with more expensive filters (3x3, 5x5). Using 1x1 convolution, we can stack more layers and allocate them on the training device.

>[!example]- Wrong answers
>- 1x1 convolution increases the size of feature maps before sending them to layers with more expensive filters
>- 1x1 convolution detects more detailed features that can improve the overall performance
>- 1x1 convolution helps to train CNN faster

---

## Spørsmål 5

**You are given the following piece of code for forward propagation through a single hidden layer in a neural network. This layer uses the sigmoid activation. Identify and correct the error.**
```python
import numpy as np
def forward_prop(W, a_prev, b):
       z = W*a_prev + b
       a = 1/(1+np.exp(-z)) #sigmoid
       return a
```
✅ Riktig svar: z = np.dot(W, a_prev) + b

>[!example]- Wrong answers
>- z = W.T * a_prev + b
>- z = a_prev.T + b
>- z = W * a_prev + b