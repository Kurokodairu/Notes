**ADALINE and Gradient Descent** 
**Auto Encoders and Variational Autoencoders**
**Basics in Keras** 
**CNN -** 
**Quiz - 2 CNN -** 
**Quiz - 3 CNN -** 
**Quiz 1 CNN -** 
**Summary Generative Models**
**GRUs**
**LSTM**
**MLP** 
**MLP and Backpropagation** 
**RNN** 
**Sentiment Analysis** 
**Transfomers**

## **50-Question Comprehensive Mock Examination**

**This exam covers all topics discussed in the source material, including MLP, Activation Functions, Loss, Optimization, Keras Workflow, CNN, RNN, LSTM, GRU, Word Embeddings, Generative Models (AE/VAE/Naive Bayes), and Transformers.**

### **Section 1: Activation Functions, MLP, and Loss (Q1–Q8)**

**Q1. What is the fundamental mathematical requirement for any function to be used as an activation function in a multilayer neural network trained via backpropagation? A. It must have an output range between 0 and 1. B. It must be linear. C. It must be differentiable. D. It must be continuous but can be non-differentiable.**

**Q2. Which activation function is categorized as "Zero-centered" and provides a "stronger gradient" than the Sigmoid function, despite still suffering from the vanishing gradient problem? A. ReLU B. Tanh (Hyperbolic Tangent) C. Softmax D. Linear**

**Q3. If a multilayer perceptron (MLP) uses only linear activation functions in all its hidden layers, what is the resulting capacity of the network? A. It can model complex non-linear relationships, provided enough layers are stacked. B. It can solve any problem, but training will be slow. C. The network's output will effectively be equivalent to a single linear function. D. It performs best for multiclass classification problems.**

**Q4. The Softmax function is primarily used in the output layer of a model for what purpose? A. To introduce high non-linearity in hidden features. B. To avoid the vanishing gradient problem. C. To compute meaningful class probabilities in multiclass settings, ensuring activations sum to 1. D. To implement binary classification decisions.**

**Q5. When the net input ($\textbf{z}$) to a neuron using the Logistic (Sigmoid) function is highly negative, what is the primary consequence regarding learning speed? A. The gradient explodes, leading to unstable weights. B. The activation ($\phi(\textbf{z})$) is close to zero, causing the network to learn very slowly. C. The derivative is maximized at 1. D. The neuron "dies," becoming permanently inactive.**

**Q6. What is the maximum value of the derivative of the Sigmoid activation function, and how does this contribute to the vanishing gradient problem? A. Maximum is 1.0; this high value stabilizes training. B. Maximum is 1.0; this high value still leads to exploding gradients. C. Maximum is 0.25; this small value causes gradients to diminish exponentially when multiplied across many layers. D. Maximum is 0.5; this value is adequate for shallow networks.**

**Q7. What cost function is typically minimized during the training of a binary classification model (where $y \in {0, 1}$) using a Sigmoid output? A. Sum of Squared Errors (SSE). B. Mean Squared Error (MSE). C. Binary Cross-Entropy Loss. D. Categorical Cross-Entropy Loss.**

**Q8. The primary purpose of L2 regularization (L2 penalization) in an MLP is to: A. Shift the activation function left or right. B. Introduce non-linearity in the hidden layers. C. Penalize large weights in the cost function to prevent overfitting. D. Ensure that the biases are initialized to zero.**

### **Section 2: Optimization and Keras Workflow (Q9–Q16)**

**Q9. Which optimization algorithm uses the entire training dataset to compute the gradient before executing a single parameter update? A. Stochastic Gradient Descent (SGD). B. Mini-Batch Gradient Descent. C. Gradient Descent (GD) / Full Batch. D. Momentum.**

**Q10. If a dataset contains 10,000 samples and the batch size is set to 50, how many weight updates (iterations) will occur during one full epoch? A. 10. B. 50. C. 200 ($10,000 / 50$). D. 500.**

**Q11. Why is Mini-Batch Gradient Descent the most common optimization method in deep learning, as opposed to pure SGD or Full Batch GD? A. It eliminates all noise during training. B. It uses the entire dataset, maximizing computation on GPUs. C. It is a compromise that offers faster training than Full Batch GD and smoother convergence than pure SGD. D. It guarantees finding the global minimum in a non-convex cost function.**

**Q12. What technique tackles the _exploding gradient problem_ by ensuring that the gradient is scaled down if it exceeds a specified threshold? A. Backpropagation Through Time (BPTT). B. Gradient Clipping. C. L2 Regularization. D. Layer Normalization.**

**Q13. In the Keras workflow, which method is used to define the loss function, the optimization algorithm, and the metrics the model will monitor? A. `fit()`. B. `define()` C. `compile()`. D. `evaluate()`**

**Q14. The Keras `Functional API` is preferred over the `Sequential API` when the model needs to implement complex topologies such as: A. A simple linear stack of Dense layers. B. Only single-input, single-output tasks. C. Models supporting multiple inputs, multiple outputs, or non-linear topologies (e.g., merging/branching layers). D. Any model using CNN layers.**

**Q15. Besides running on CPUs, what unique capability of TensorFlow/Keras makes it highly suitable for deep learning, differentiating it from traditional libraries like NumPy? A. Its default use of the Sigmoid activation function. B. The ability to use the identity function as activation. C. The ability to automatically compute gradients and run computation efficiently on GPUs and TPUs. D. The automatic handling of the MSE loss function.**

**Q16. What is the significance of the "Add and Norm" step in the Transformer architecture, combining a residual connection with Layer Normalization? A. It speeds up text generation during inference. B. It is required for positional encoding to function correctly. C. The residual connection helps preserve signal flow and the Layer Normalization stabilizes training. D. It reduces the dimensionality of the key and query vectors.**

### **Section 3: CNN, RNN, and Sequence Models (Q17–Q32)**

**Q17. Which property of CNNs allows the same filter weights to be applied across the entire spatial extent of an input image, leading to a drastic reduction in trainable parameters compared to a fully connected layer? A. Max Pooling. B. Atrous Convolution. C. Weight Sharing. D. Zero Padding.**

**Q18. In a convolutional layer, what is the main function of using a $1 \times 1$ filter (convolution)? A. To increase the spatial size of the feature maps. B. To eliminate all pooling layers. C. To reduce the depth (number of channels/feature maps) before applying larger, more computationally expensive filters. D. To apply positional encoding.**

**Q19. The Encoder in a U-Net architecture typically performs downsampling to capture abstract features. What method does the Decoder commonly use to upsample the feature maps back to the original image resolution for dense prediction? A. Max Pooling. B. Transposed Convolutions (Deconvolution). C. Traditional Fully Connected Layers. D. Gradient Descent.**

**Q20. What is the primary function of the `Recurrent Dropout` technique in RNNs (LSTM/GRU)? A. To solve the exploding gradient problem. B. To improve the representational power of the network by stacking layers. C. To fight overfitting within recurrent layers. D. To limit the number of time steps the signal can backpropagate.**

**Q21. The main architectural change introduced by LSTM cells to solve the vanishing gradient problem involves the use of three gates (Forget, Input, Output). What component is responsible for carrying information across many timesteps, "saving information for later"? A. The Hidden State ($\bf{h}^{(t)}$). B. The Input Gate ($i_t$). C. The Cell State ($\bf{C}^{(t)}$). D. The Activation function ($\phi$).**

**Q22. What is the function of the $\text{tanh}$ activation function within the LSTM cell, specifically regarding the candidate state ($g_t$) and the calculation of the hidden state ($h^{(t)}$)? A. It acts as a binary switch (0 or 1) for the gates. B. It normalizes values to the range (-1, 1), used to create the candidate update and to filter the final cell state to produce the hidden state. C. It ensures that the gradient is always less than 0.25. D. It determines how much of the previous cell state to forget.**

****Q23. In the context of sequence modeling, which gated recurrent model is generally preferred when computational efficiency and fewer parameters are critical considerations? A. Simple RNN. B. LSTM. C. GRU (Gated Recurrent Unit). D. MLP.****

****Q24. When defining the loss function in a Variational Autoencoder (VAE), the total loss comprises a Reconstruction Loss (e.g., MSE) and a Regularization Term (KL Divergence). What must the KL Divergence term ensure about the latent space distribution? A. That all encoded points are discrete and non-overlapping. B. That the encoded distribution is distributed evenly around the center (standard normal distribution). C. That the decoder can perfectly reconstruct the input. D. That sampling is disabled during inference.****

****Q25. Why is the "Naive assumption that each feature is independent of every other feature" problematic when Naive Bayes is applied to high-resolution image generation tasks? A. Because Naive Bayes is a discriminative model. B. Because it only works for images with fewer than 100 pixels. C. Because neighboring pixels in an image are highly dependent, and this assumption leads to poor generation of complex relationships. D. Because the total number of combinations is too small.****

****Q26. If an Autoencoder (AE) is trained exclusively on "normal" (healthy) medical images, for what primary application would this model be used? A. High-fidelity image generation (VAE purpose). B. Multiclass classification. C. Anomaly detection, flagging new inputs that the AE struggles to reconstruct. D. Data compression only.****

****Q27. When working with text, what is the primary advantage of using `Word Embeddings` (like Word2Vec) over `One-Hot Encoding`? A. Embeddings require a larger vocabulary. B. Embeddings create dense, lower-dimensional vectors that capture semantic meaning, unlike sparse, high-dimensional One-Hot vectors. C. Embeddings ignore word order (sequential information). D. Embeddings speed up the training process of a Simple RNN significantly.****

****Q28. In the **Skip-Gram model, if the center word is the input, what does the model try to predict as the output?** A. The next sentence in the document. B. The topic of the document. C. The surrounding words (context). D. The word in the middle (target word).****

**### **Section 4: Data Tensors, ResNet, and Transformers (Q29–Q32)****

****Q29. A large dataset of 500 text documents is represented using a dictionary of 20,000 common words, where each document is stored as a vector of word counts. What shape does the resulting tensor (batch of data) have? A. $(20000, 500)$. B. $(500, 20000, 1)$. C. $(500, 20000)$ (samples, features). D. $(1, 500, 20000)$.****

****Q30. If you are handling video data, where each video is a sequence of color frames, what minimum tensor dimensionality is required to store a batch of _different_ video clips? A. 3D tensor. B. 4D tensor. C. 5D tensor (samples, frames, height, width, color_depth). D. 2D tensor.****

****Q31. The Residual Network (ResNet) architecture uses a _skip connection_ to compute the output $H(x)$. The goal of the residual block $F(x)$ is to learn: A. The complete function $H(x)$. B. The inverse function $H^{-1}(x)$. C. The difference, $F(x) = H(x) - x$. D. The activation only.****

****Q32. How is positional encoding typically incorporated into the Transformer model's input? A. It is concatenated to the end of the input sequence. B. It is used to generate the Key ($K$) vector. C. It is added to the word embeddings before they are passed to the encoder stack. D. It is used to mask future tokens during training.****

**### **Section 5: Advanced CNN, Optimization, and NLP Details (Q33–Q50)****

****Q33. Which type of convolution expands the receptive field of the filter without increasing the number of trainable parameters in that filter? A. $1 \times 1$ Convolution. B. Transposed Convolution. C. Atrous/Dilated Convolution. D. Standard Convolution with stride > 1.****

****Q34. When training deep networks, the initialization of weights is important for convergence. What distribution does the Keras default (Glorot normal initializer) typically follow? A. Standard normal distribution ($\mathcal{N}(0, 1)$). B. A truncated normal distribution based on the number of input and output units (fan_in, fan_out). C. Uniform distribution between 0 and 1. D. A fixed set of small positive constants.****

****Q35. In deep CNNs, what architectural element is often used _after_ a convolutional block to simplify the feature map by reducing its spatial dimensions and increasing the receptive field? A. Pooling layers (e.g., Max Pooling). B. Dense layers. C. Dropout layers. D. Softmax layer.****

****Q36. When applying image augmentation for Semantic Segmentation, why must the augmentation process be handled carefully? A. Augmentation is generally discouraged for segmentation tasks. B. The segmentation masks (labels) must be augmented (transformed) to match the corresponding changes in the image inputs. C. The models can only handle color inversions. D. The number of pixels changes due to cropping.****

****Q37. What fundamental operation in the backpropagation algorithm is the root cause of both the vanishing and exploding gradient problems? A. Summation of errors. B. Differentiation of the cost function. C. Multiplication of gradients across successive layers (Chain Rule). D. Forward propagation calculation.****

****Q38. What is the role of the **Input Gate ($i_t$) in an LSTM cell?** A. To decide which information to discard from the cell state. B. To control how much of the cell state is exposed in the hidden state. C. To decide what new information (from the input node $g_t$) should be added to the cell state. D. To reset the hidden state at $t=0$.****

****Q39. In sentiment analysis, what does the preprocessing technique **Stemming aim to achieve?** A. Counting the frequency of each word in a document. B. Reducing a word to its root or base form. C. Normalizing the sentence length. D. Creating a one-hot encoded vector for each word.****

****Q40. Which of the following is a primary characteristic of a **Bag of Words model used in NLP?** A. It preserves the order of words in a sentence. B. It represents documents as counts of words, resulting in a sparse representation based on a fixed vocabulary. C. It transforms words into dense, continuous vectors capturing semantic meaning. D. It calculates the TF-IDF score automatically.****

****Q41. In the VAE Reparameterization Trick ($z = \mu + \sigma \odot \epsilon$), what does the term $\epsilon$ represent? A. The predicted reconstruction error. B. The mean vector output by the encoder. C. A random noise vector sampled from a standard normal distribution, introducing stochasticity. D. The derivative of the latent vector $z$.****

****Q42. In a standard Autoencoder, why does the latent space representation $z$ have a lower dimensionality than the input data $x$? A. To ensure non-linearity. B. To enforce compression, forcing the encoder to capture only the most salient features. C. To enable Softmax output. D. To prevent the use of backpropagation.****

****Q43. What is one criteria for a generative model $P_{model}$ to be considered impressive by Rule 2 (as defined in the sources)? A. It must perfectly reproduce the observed data $X$. B. It must classify the observations $X$ with high accuracy. C. It must be able to generate examples that are suitably different from the observations in $X$. D. It must use only Naive Bayes components.****

****Q44. What is the key functional difference between the $Q$ (Query) vector and the $V$ (Value) vector in the self-attention mechanism? A. $Q$ provides the content, while $V$ checks for similarity. B. $Q$ is used to compute attention scores (similarity check with $K$), while $V$ contains the actual content weighted by these scores to form the output. C. $Q$ is only used in the decoder, and $V$ in the encoder. D. $Q$ stabilizes the gradient, while $V$ handles normalization.****

****Q45. Why is Layer Normalization preferred over Batch Normalization in the Transformer architecture, particularly for NLP tasks? A. Batch normalization is computationally too slow for modern GPUs. B. Layer normalization is stable for sequences of variable length, as it normalizes across the feature dimensions of each token, not over the batch. C. Layer normalization is non-differentiable. D. Batch normalization relies on an exploding gradient mechanism.****

****Q46. In the attention formula, $\frac{Q K^T}{\sqrt{d_k}}$, what is the purpose of dividing by $\sqrt{d_k}$? A. To increase the impact of the Key vector. B. To normalize the Softmax output to sum to 1. C. To scale down the dot products of $Q$ and $K$ to prevent large input values from pushing Softmax gradients near zero. D. To normalize the $V$ (Value) vector.****

****Q47. During text generation (inference), how do Transformer models typically operate, despite their parallel processing ability during training? A. They generate the entire sequence simultaneously in one step. B. They rely solely on the initial positional encoding. C. They use autoregressive generation, predicting one token at a time and feeding it back as input for the next prediction. D. They convert the entire sequence into a single $1 \times 1$ convolution.****

****Q48. Which advantage does **Skip-Gram have over CBOW in the Word2Vec model, according to the sources?** A. It is faster to train due to averaging context words. B. It generally produces better quality embeddings, especially for infrequent words, and works well with less data. C. It predicts the center word given the context. D. It uses only one-hot encoded vectors.****

****Q49. Why is the ReLU activation function considered more suitable for deep neural networks than Sigmoid or Tanh? A. It is fully differentiable. B. Its derivative is always 1 for positive input, which effectively solves the vanishing gradient problem for positive activations. C. It outputs zero-centered values. D. It is guaranteed to reach the global minimum faster.****

****Q50. Which Keras layer type is explicitly designed to handle input data structured as `(samples, timesteps, features)`? A. Dense (Fully Connected). B. Convolutional (Conv2D). C. Recurrent (LSTM, GRU, SimpleRNN). D. Flatten & Reshape.****


