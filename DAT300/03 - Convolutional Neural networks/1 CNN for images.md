### Deep Convolutional Neural Networks

## Understanding CNNs and learning feature hierarchies
- Extraction of relevant features (1D, 2D, ...)
    - Translational invariant patterns
      ![[Pasted image 20250922132446.png]]
### Combining features in a hierarchy
- Low-level features: edges, simple patterns
- High-level features: shapes, objects

### Feature map
- Each element is connected to a small patch of pixels
- Weights are shared across all pathes
- Size of filters and step sizes control overlap and size of features
- Number of filters controls the number of features that can be learned

for example a filter
3x3 [0 1 0
	0 1 0
	0 1 0 ]
it looks at one 3x3 part of the image and checks if this part of the image matches the filter, if so it confirms this part of the image is this feature.
### Parameters
- Each convolutional filter has #parameters = #elements.
  - Banks of filters and a set of input channels increases this.
- Pooling layers: simplify/decrease dimensionality, e.g. with max: no parameters.
- Fully connected layers (multilayer perceptron): #parameters from (IxJ) weight matrix.
- Understanding the complexity will be revisited later.

(Look at animations powerpoint)


## Performing discrete convolutions  
Notation:
- Dimension: $\bf{A}_{\it{n_1 \times n_2}}$
- Indexing: $\bf{A}[\it{i,j}\bf{]}$
- Convolutional operator: $\ast$
  - Not to be confused with dot product, matrix product, Hadamard, Kronecker, Khatri-Rao, ...

![[Pasted image 20250922135126.png]]

### Convolution with padding:
- Assume input $x$ of size $n$ and filter $w$ of size $m$.
- A padded vector $x^p$ with size $n+2p$ results in the more practical formula:
$$y=x \ast w \rightarrow y[i] = \sum^{k=m-1}_{k=0}x^p[i+m-k]w[k]$$
- Even more practical: Rotate (r, flip) the filter to get a dot product notation which can be repeated like a sliding window:
$$y[i] = x[i:i+m].w^r$$
### Convolution vs Cross-Correlation (1D Example)

Input:  
$x = [x_0, x_1, x_2], \quad w = [w_0, w_1, w_2]$

#### 🔹 Convolution (at $i = 2$)

¤ Formula:  
$y[i] = \sum_{k=0}^{2} x[i-k] \cdot w[k]$

| k   | Expression         | Substitution |
| --- | ------------------ | ------------ |
| 0   | $x[2-0] \cdot w_0$ | $x_2 w_0$    |
| 1   | $x[2-1] \cdot w_1$ | $x_1 w_1$    |
| 2   | $x[2-2] \cdot w_2$ | $x_0 w_2$    |
¤ Result:  
$y[2] = x_2 w_0 + x_1 w_1 + x_0 w_2$

---
#### 🔹 Cross-Correlation (at $i = 0$)

¤ Formula:  
$y[i] = \sum_{k=0}^{2} x[i+k] \cdot w[k]$

| k | Expression        | Substitution |
|---|-------------------|--------------|
| 0 | $x[0+0] \cdot w_0$ | $x_0 w_0$ |
| 1 | $x[0+1] \cdot w_1$ | $x_1 w_1$ |
| 2 | $x[0+2] \cdot w_2$ | $x_2 w_2$ |

¤ Result:  
$y[0] = x_0 w_0 + x_1 w_1 + x_2 w_2$

---

**Key difference:**  
- Convolution uses $x[i-k]$ → the filter is **flipped**.  
- Cross-correlation uses $x[i+k]$ → the filter is **as-is**.
  
Example - $n=8, m=4, p=0, stride=2$
![[Pasted image 20250922135902.png]]

### The effect of zero-padding in convolution
- Full padding: $p=m-1$, gives equal usage of elements, increases output size.
- Same padding: $p$ and stride combined to achieve equal input and output size (most used in DNN).
- Valid padding: $p=0$, shrinks output and has unequal usage of elements (many layers shrinks too much).
- First two are recommended, possibly together with pooling for downsampling.
![[Pasted image 20250922135940.png]]


