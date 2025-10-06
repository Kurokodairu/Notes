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





# ADD MISSING LECTURE





### Dropout
##### Training phase
- Randomly **drop** outputs from hidden units with probability $p_{drop}$ (e.g., $p_{drop}=0.5$).  
- The activations of the remaining units are **scaled up** by a factor of $\tfrac{1}{1-p_{drop}}$  
  (e.g., if $p_{drop}=0.5$, the remaining activations are doubled).  
- This ensures that the expected total contribution of all units stays the same.  
- Forces the network to learn **redundant, distributed representations** instead of relying on specific neurons.  
- Helps prevent overfitting and makes the model more robust.  
##### Testing (inference) phase
- **No units are dropped.**  
- The network uses **all neurons**, but because activations were scaled during training,  
  the output distribution at test time matches what the model saw during training.  
#####  Interpretation
- Dropout can be seen as training an **ensemble of many different subnetworks**.  
- The final prediction is effectively an **average over these subnetworks**, improving generalization.  
![[Pasted image 20250929123716.png]]

## Implementing a deep convolutional neural network using Keras
- Example reusing the MNIST data, $n_1 \times n_2 \times c_{in} = 28 \times 28 \times 1$ (grayscale).
- $5 \times 5$ kernels, 32 and 64 output feature maps, fully connected ($1024 \times 1024$), then fully connected ($1024 \times 10$) acting as softmax (no padding)![[Pasted image 20250929124500.png]]
#CA2 will be implementing this !
Trainable parameters:
	5x5x32 + 32 = 832
	(5x5 = filter dimensions), Number of filter + biases = trainable parameters
2nd convolution layer: 
	'# trainable parameters' = 5x5(dim of filters)x64(# of filters)x32(# of feature maps from prev. layer) + 64 = 51264
dense_4: flatten to 1024 hidden layer (dense / fully connected)
	**4x4x64x1024 + 1024 = 1049600**
	flattened vector = 4x4x64 = 1024 
	trainable parameters = 1024x1024 
		+ bias 1024
Last layer (softmax):
	1024x10 + 10(bias) = 10250
![[Pasted image 20250929132029.png]]
**Total params: 1,111,946 (4.24 MB)**
 **Trainable params: 1,111,946 (4.24 MB)**

### Example in 03 - CNN part 1
###### Implementing a deep convolutional neural network using Keras
.........


##### Compile model and prepare TensorBoard
```python 
from tensorflow.keras.callbacks import ModelCheckpoint
from tensorflow.keras.optimizers import Adam

opt = Adam(learning_rate=0.0001)
model.compile(optimizer=opt,
              loss='categorical_crossentropy',
              metrics=['accuracy'])

history = model.fit(X_train_centered, Y_train, batch_size=64, epochs=10, 
          verbose=1, shuffle=True, #          verbose=1, shuffle=True,
          validation_data=(X_valid_centered, Y_valid))#, callbacks=[checkpoint])
          
# Plot history
import matplotlib.pyplot as plt

# Plot training vs validation loss
plt.plot(history.history['loss'], label='Training Loss')
plt.plot(history.history['val_loss'], label='Validation Loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.title('Training vs Validation Loss')
plt.legend()
plt.show()


# Evaluate on test data

# Explicit saving of the model for later use
model.save('models/MNIST.h5')
# Prediction
#from tensorflow.keras.models import load_model
#model = load_model('models/MNIST.h5')
model.evaluate(X_test_centered, Y_test)

#Probability of each class
# Predict with probabilities
import seaborn as sns
import matplotlib.pyplot as plt
sns.heatmap(model.predict(X_test_centered[:4,:]))
plt.show()
model.predict(X_test_centered[:4,:])

# Confusion matrix
from sklearn.metrics import confusion_matrix
import numpy as np
confusion_matrix(y_test,np.argmax(model.predict(X_test_centered), axis=1), labels = list(range(10)))

#Weights from layers
layer = 0
filter = 4
weights, biases = model.layers[layer].get_weights()
print(weights.shape)
sns.heatmap(weights[:,:,0,filter])

```

### Adverserial attacks
https://towardsdatascience.com/breaking-neural-networks-with-adversarial-attacks-f4290a9a45aa
- Neural networks can sometimes be fooled
- Simple image manipulation can cause mis-classification
  - Structured, invisible noise
  - Carefully placed stickers or tape on objects
  - Drawings of maximum activation patterns
- Can be limited using heavier computations
  - Added noise in image augmentation or weights
  - Train on soft targets (not 0/1)
  - Add adverserial examples in training

##### Pipelining
- On-the-fly batch-wise pre-processing 
    - Read from disk
    - Convert to correct format
    - Reshape
    - Augment training set
```python
from tensorflow.keras.preprocessing.image import ImageDataGenerator
datagen = ImageDataGenerator(width_shift_range=0.2,
                            height_shift_range=0.2,
                            zoom_range=0.2,
                            rotation_range=30,
                            vertical_flip=False,
                            horizontal_flip=False)
datagen.fit(X_train_centered)
train_generator = datagen.flow(np.array(X_train_centered), np.array(Y_train), 
                               batch_size=64)
# flow_from_directory for direct import from image files (can include resizing)
# flow_from_dataframe for direct import based on a list of file names (numbering counted alphabetically)
```

##### Applying the image generator
```python
historyFlow = model.fit(
    train_generator,
    epochs=10,
    steps_per_epoch=len(X_train_centered) // 64,
    validation_data=(X_valid_centered, Y_valid)
)
```
##### Softmax activation
$$\sigma (a)_i = \frac{e^{a_i}}{\sum_{j=1}^K e^{a_j}} = h_i$$
- The activation of class $i$
- Exponent of each dummy input divided by the sum of exponents of all dummy inputs
  - Class activations sum to 1
- Only for output layer of a model
```python
import tensorflow as tf
def round_tensor(x, dec):
    return np.round(tf.make_ndarray(tf.make_tensor_proto(x)), dec)

a = tf.constant([[-5, 0, 5, 6], [10, 0, 5, 6]], dtype=tf.float32)
b = tf.keras.activations.softmax(a)
round_tensor(b, 2)
```

##### ReLU activation
$\sigma(x) = max(0, x)$
![[Pasted image 20250929134635.png]]

##### Swish activation
$\sigma(x) = x \cdot sigmoid(x) = \frac{x}{1+e^{-x}}$
![[Pasted image 20250929134657.png]]

#### Activation Function Comparison

| Function       | Positive side        | Negative side                 | Gradient behavior                     |
| -------------- | -------------------- | ----------------------------- | ------------------------------------- |
| **ReLU**       | Passes input through | Zero output                   | Zero gradient for negatives           |
| **Leaky ReLU** | Passes input through | Small negative slope          | Constant small gradient for negatives |
| **Swish**      | Similar to input     | Small negative values allowed | Gradient smoothly varies with input   |
