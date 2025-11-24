Modelling sequential data with recurrent neural networks
Sequential data
* So far we have worked with input data is **Independent and Identically Distributed (IID)**
    * we have $n$ data samples: $x^{(1)}, x^{(2)}, \dots, x^{(n)}$
    * the order in which we use the data for training our machine learning algorithm does not matter
* This assumption is **not valid anymore** when we deal with sequences — by definition, order matters

Applications of RNN
* **Document classification** and **timeseries classification**, such as identifying the topic of an article or the author of a book
* **Timeseries comparisons**, such as estimating how closely related two documents or two stock tickers are
* **Sequence-to-sequence** learning, such as decoding an English sentence into French
* **Sentiment analysis**, such as classifying the sentiment of tweets or movie reviews as positive or negative
* **Timeseries forecasting**, such as predicting the future weather at a certain location, given recent weather data

* We've established that sequences are a **non-independent order** in our input data
* We next need to find ways to leverage this valuable information in our machine learning model
* Sequences will be represented as 
    * $(x^{(1)}, x^{(2)}, \dots, x^{(T)})$
    * superscript indices indicate the **order** of the instances
    * **length** of sequence is $T$
    * **In time series**: each sample point $x^{(t)}$ belongs to a particular time $t$ 

**Activation computations of hidden layer units**
* net input: $z_{h}^{(t)}$
* bias vector for hidden units: $\bf{\it{b_{h}}}$
* activation function of hidden layer: $\phi (\cdot)$
![[Pasted image 20251112170626.png]]


Embedding: (Instead of one-hot-encoding where we have a vector with i.e 19.9k zeroes and one 1)
* A more elegant way of representing words is **embedding**
    * use finite-sized vectors to represent words
    * these finite-sized vectors contain real numbers
* Idea behind embedding
    * **embedding is a feature learning technique** 
    * embedding automatically learns salient features to represent word in a dataset
    * `embedding_size << unique_words` to represent the entire vocabulary as input features

* Assume cat, dog, wolf and tiger are part of a 50 000-word animal vocuabulary we want to work with
* One-hot encoding: each of the four words would result in a 50 000-dimensional vector
* In this embedding example with two vectors cat, dog, wolf and tiger may be represented meaningful with a 2-dimensional vector
* Word vectors from embedding
    * cat --> [0.7, 0.3]
    * dog --> [0.4, 0.4]
    * wolf  --> [0.4, 0.9]
    * tiger --> [0.8, 0.8]

Common examples of meaningful geometric transformations are
* "gender" vectors
* "plural" vectors

* By adding a “female” vector to the vector “king” we obtain the vector “queen”
* By adding a “plural” vector, we obtain “kings”

Vanishing gradient problem
Various solutions exist such as
* **Gradient clipping (solves exploding gradients)**
    - set a max value for gradients if they grow too large
    - setting a max value solves only exploding gradient problem
* **Truncated Backpropagation through time (TBPTT)**
    - limit the number of time steps the signal can backpropagate each forward pass
    - Example: even if sequence has 100 elements / steps, only backpropagate through fewer steps
* **Long-Short-Term-Memory (LSTM) units (most common)**
    - Architecture that avoids vanishing / exploding gradient problems
    - Sepp Hochreiter and Jürgen Schmidhuber, Long short-term memory, *Neural computation*, 9, no. 8, (1997): 1735 - 1780

### Advanced use of RNN
There are several ways to improve the performance and generalisation power of RNNs.

* **Recurrent dropout** - This is a specific, built-in way to use dropout to fight overfitting in recurrent layers
* **Stacking recurrent layers** - This increases the representational power of the network (at the cost of higher computational loads)
* **Bidirectional recurrent layers** - These present the same information to a recurrent network in different ways, increasing accuracy and mitigating forgetting issues


## GRU Units
* Gated Recurrent Units (GRU)
* GRUs have a simpler architecture than LSTMs 
    * fewer parameters
    * ==> computationally more efficient
    * for some tasks performance comparable to those of LSTM
* There are reports exhibiting that GRUs have better performance on smaller datasets 

<font color=green>**COLAB NOTEBOOK 03**</font>: code on how to do [use simple RNN and LSTM layers in Keras](https://colab.research.google.com/drive/1d1d4KdN-3_IizrO98L6e3VAwOE11f6mT?usp=sharing)

