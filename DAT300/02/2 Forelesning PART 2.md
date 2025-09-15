# Parallelising Neural Network Training with Keras
TensorFlow goes **far beyond** the scope of NumPy in the following ways
* It can **automatically compute** the gradient of any differentiable expression, making it highly suitable for machine learning
* It can run not only on **CPU**, but also on **GPUs** and **TPUs**, highly-parallel hardware accelerators
* Computation defined in TensorFlow can be **easily distributed across many machines**
* TensorFlow programs can be **exported to other runtimes**, such as 
    * C++, JavaScript (for browser-based applications), or 
    * TFLite (for applications running on mobile devices or embedded devices), etc. 
* This makes TensorFlow applications **easy to deploy** in practical settings.

**Run Keras**
* **locally** (on CPUs on your own PC; on GPU on your own gaming PC): 
    - It is likely that your laptop doesn't have a graphical processing unit (GPU) suitable for use deep learning computations.
    - This will result in longer training times for your model using only CPUs, but may be the only feasable option if you need to work offline.

* **in the cloud** using [Google Colaboratory](https://colab.research.google.com/notebooks/welcome.ipynb) or [Kaggle](https://www.kaggle.com/notebooks) 
     - This requires internet connection and a Google / Kaggle account. 
     - You will have access to an outdated GPU 

other libraries:
* [PyTorch](https://pytorch.org/) (by Facebook)
* [Caffe](http://caffe.berkeleyvision.org/)
* ... and many more
* [Overview on Wiki](https://en.wikipedia.org/wiki/Comparison_of_deep-learning_software)



### INTRO TO KERAS
 training a neural network revolves around the following objects:

1. **Layers**, which are combined into a network (or model)
2. The **input data** and **corresponding targets**
3. The **loss function**, which defines the feedback signal used for learning
4. The **optimizer**, which determines how learning proceeds

* Layers are a fundamental data structure in neural networks
* A layer is a data-processing module that takes as input one or more tensors and that outputs one or more tensors
* The layer’s **weights** contain the network’s **knowledge**

### Common Layer Types
1. **Dense (Fully Connected)** – for vector data (`(samples, features)`).
2. **Recurrent (LSTM, GRU, SimpleRNN)** – for sequence data (`(samples, timesteps, features)`).
3. **Convolutional (Conv2D, Conv3D)** – for image/video data (`(samples, height, width, channels)`).
4. **Pooling (MaxPooling, AvgPooling)** – for downsampling.
5. **Flatten & Reshape** – for shape transformations.
6. **Dropout / Regularization** – to reduce overfitting.
7. **Embedding** – for text / categorical encoding.
8. **Custom Layers** – user-defined.

### Sequential vs Functional API in Keras
**Sequential API**
- Best for simple, *linear* stacks of layers.
- Each layer has exactly **one input** and **one output**.
- Easy to use and read.
- Limitation: cannot handle multi-input/multi-output or branching networks.

**Functional API**
- More flexible, lets you build **directed acyclic graphs of layers**.
- Supports multiple inputs, outputs, and non-linear topologies (e.g. branching, merging).
- Preferred when designing **complex models** (e.g., Inception, ResNet).

**Rule of Thumb:**  
- If your model is a straight stack → **Sequential**  
- If your model has multiple paths or shared layers → **Functional API**


### Keras workflow
Already built a keras model in the MNIST example
1. Define your training data: input tensors and target tensors.
2. Define a network of layers (or model ) that maps your inputs to your targets.
3. Configure the learning process by choosing a loss function, an optimizer, and some metrics to monitor.
4. Iterate on your training data by calling the `fit()` method of your model

There are two ways to define a Keras model:
1. using the `Sequential` class (only for linear stacks of layers, which is the most common network architecture by far)
2. using the *functional* API (for directed acyclic graphs of layers, which lets you build completely arbitrary architectures)

```python
from tensorflow.keras import models
from tensorflow.keras import layers

model = models.Sequential([
    layers.Dense(32, activation='relu'),
    layers.Dense(32)])
```

Once your model architecture is defined, it doesn’t matter whether you used a `Sequential` model or the functional API. All of the following steps are the same. The learning process is configured in the compilation step, where you specify:

* *Loss function (objective function)* — The quantity that will be minimized during training. It represents a measure of success for the task at hand.
* *Optimizer* — Determines how the network will be updated based on the loss function. It implements a specific variant of stochastic gradient descent (SGD).
* *Metrics* — The measures of success you want to monitor during training and validation, such as classification accuracy. Unlike the loss, training will not optimize directly for these metrics. As such, metrics don’t need to be differentiable.

Here’s an example with a single loss function, which is by far the most common case:
```python
# Define model
model = keras.Sequential([keras.layers.Dense(1)])

# Compile model
model.compile(optimizer='rmsprop',
              loss='mean_squared_error',
              metrics=['accuracy'])
```
Finally, the learning process consists of passing Numpy arrays of input data (and the corresponding target data) to the model via the `fit()` method, similar to what you would do in Scikit-Learn and several other machine-learning libraries:
```python
# Fit model (in the same manner as you would with scikit-learn)
model.fit(input_tensor,
          target_tensor, 
          epochs=5
          batch_size=128)
```

