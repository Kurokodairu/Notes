## Data representations for neural networks

* Previous example used data stored in multidimensional Numpy arrays, also called **tensors**.
* **All machine learning systems** use tensors as their basic data structure
* Tensors are fundamental to the field of machine learning - TensorFlow was named after them

### Vector data
* This is the most common case
* In such a dataset, each single data point can be encoded as a vector.
* Thus a batch of data will be encoded as a 2D tensor (array of vectors)
* 2D tensor: first axis is the *samples axis* and the second axis is the *features axis*.

##### vector data example
Actuarial dataset of people considering:
* persons age
* ZIP code
* income
Each person can be characterised as a vector of 3 values. A dataset of 100 000 people could be stored in a 2D tensor of shape `(100000, 3)`.

##### Another example
A dataset of text documents, where each document is represented by counts of how many times each word appears in it (out of a dictionary of 20 000 common words).

* Each document can be considered as a vector of 20 000 values

If dataset consists of 500 documents, data could be stored in a 2D tensor of shape `(500, 20000)`


### Time series / sequence data
* Whenever time matters in your data (or the notion of sequence order), it makes sense to store it in a 3D tensor with an **explicit time axis**
* Each sample can be encoded as a sequence of vectors (a 2D tensor)
* Thus a batch of data will be encoded as a 3D tensor

###### Example timeseries
A dataset of stockprices:
* record current price of stock
* record highest price in past minute
* record lowest price in past minute

Given a total of 390 minutes in a trading day, the data of one trading day will be stored in a 2D tensor of shape `(390 x 3)`. If there are 250 days of trading in one year then the data may be stored in a 3D tensor of shape `(250, 390, 3)`. In this case each sample would be the data of one trading day. 

###### Example sequence
A dataset of tweets:
* encode each tweet as a sequence of 280 characters out of an alphabet of 128 unique characters
* each character can be encoded as a binary vector of size 128 (an all-zeros vector except for a 1 entry at the index corresponding to the character)

Each tweet can be encoded as a 2D tensor of shape `(280, 128)`. Hence, a dataset of 1 million tweets can be stored in a 3D tensor of shape `(1000000, 280, 128)`.


### Image data
* Images typically have three dimensions: height, width and colour depth
* Although grayscale images (like our MNIST digits) have only a single color channel and could thus be stored in 2D tensors, by convention image tensors are always 3D, with a onedimensional color channel for grayscale images

A batch of 128 grayscale images of size 256 × 256 could thus be stored in a tensor of shape `(128, 256, 256, 1)`. A
batch of 128 color images could be stored in a tensor of shape `(128, 256, 256, 3)`.

**Two conventions** for shapes of image tensors:
* *channel-last* convention as used by TensorFlow `(samples, height, width, color_depth)`
* *channel-first* convention as used by Theano `(samples, color_depth, height, width)`
* Either, TensorFlow or Theano, may be used as the engine for Keras


### video data
* Video data is one of the few types of real-world data for which you’ll need 5D tensors
* A video can be understood as a sequence of frames, each frame being a color image
* Because each frame can be stored in a 3D tensor `(height, width, color_depth)`, a sequence of frames can be stored in a 4D tensor `(frames, height, width, color_depth)`
* Thus a batch of **different videos** can be stored in a 5D tensor of shape `(samples, frames, height, width, color_depth)`

Imagine you have a video with the following properties:
* 60 second video
* 144 x 256 (height, width)
* 4 frames per second

A batch of **four** such video clips would be stored in a tensor of shape `(4, 240, 144, 256, 3)`. That’s a total of 106 168 320 values! If the `dtype` of the tensor was `float32`, then each value would be stored in 32 bits, so the tensor would represent 405 MB, which is quite a lot. Videos in real life are much lighter, because they aren’t stored in `float32`, and they’re typically compressed by a large factor (such as in the MPEG format).