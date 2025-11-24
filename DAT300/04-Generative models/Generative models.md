**Autoenoders**
An autoencoder is a type of artificial neural network used for unsupervised learning. Its primary goal is to learn a compressed representation of input data, and it does this by encoding the data into a lower-dimensional latent space and then decoding it back to its original form. The entire process is meant to capture the most salient features of the data.

**The autoencoder structure**:
- **Encoder**: This part of the network compresses the input into a latent-space representation. It encodes the input data as an internal fixed-size representation in reduced dimensionality.
- **Latent Space**: This is the compressed representation of the input data. It holds the key features necessary to reconstruct the input data.
- **Decoder**: This part of the network reconstructs the input data from the internal representation. It maps the encoded data back to the original space.


**Variational Autoencoder**
Variational Autoencoders (VAEs) are a type of autoencoder that introduces probabilistic reasoning and optimization techniques from variational inference to create a generative model. While standard autoencoders are trained to minimize the reconstruction error between the input data and their output, VAEs aim to generate new samples that could have been produced by the input data.

**The variational autoencoder structure:**
- **Encoder**: Like traditional autoencoders, VAEs have an encoder that maps the input data to a latent space. However, instead of encoding the input as a single fixed point in the latent space, the VAE encoder outputs parameters of a probability distribution (usually Gaussian) over the latent space.
- **Sampling**: A sample is drawn from this distribution to provide a randomized latent space representation of the input. This introduces a stochastic element that aids in generating diverse outputs.
- **Decoder**: The sampled latent point is then passed through the decoder to generate a reconstruction of the input

