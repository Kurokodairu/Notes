**Question:** What is the primary purpose of self-attention in a Transformer model?
	**To allow each token to focus on other tokens in the sequence, capturing contextual relationships.**
> Self-attention lets each token in a sequence "look at" other tokes and determine wich ones are relevant for understanding its meaning. For example, in the sentence _“The animal didn’t cross because it was too tired”_, the word _“it”_ should attend mainly to _“animal”_.  
This mechanism captures dependencies and context without relying on sequential processing like RNNs.

### **Spørsmål 2**
**Question:** Why is positional encoding used in Transformers?
	**To encode the relative and absolute positions of tokens in the sequence since Transformers process tokens in parallel.**
> Transformers process all token simultaneously (not sequentally) meaning order information is lost. Positional encodings (often sin-cosine functions) are added to token embeddings so the model knows the position of each word in a sequence.

### **Spørsmål 3**
**Question:** What is the role of the feedforward network in the Transformer encoder?
	**To apply transformations to individual token embeddings independently, enriching their representation.**
> After the attention mechanism, each tokens vector is passed through a small feedforward network (two linear layers with a ReLU inbetween) This lets the model mix and transform each tokesn features independently to capture more complex relationships before the next attention layer

### **Spørsmål 4**
**Question:** Why is layer normalization used in the Transformer model?
	**To stabilize training by normalizing the activations across the feature dimensions of each token.**
> Layer normalization helps keep the distribution of activations stable during training. Instead of normalizing over batch (batch normalization) it normalizes across the feature dimensions of each token - which imporves gradient flow and stabilizes training when dealing with long sequences.


### **Spørsmål 5**
**Question:** What type of loss function is commonly used to train Transformers for text generation tasks?
	**Cross-Entropy Loss.**
> In text generation, Transformers predict a probability distribution over the vocabulary for the next word.  Cross-entropy loss measures how well the predicted distribution matches the true next token (the “ground truth”).  It penalizes incorrect predictions and is standard for all classification-like tasks in NLP.

### **Spørsmål 6**
**Question:** How does the attention mechanism compute the importance of one token relative to another?
	**By comparing the dot product of the Query and Key vectors, scaled by the dimension of the Key vector.**### **Spørsmål 6**
Each token is projected into **Query (Q)**, **Key (K)**, and **Value (V)** vectors. The attention score is calculated with a softmax after. The dot product measures similarity (importance), and dividing by \(\sqrt{d_k}\)


### **Spørsmål 7**
**Question:** Why is layer normalization preferred over batch normalization in Transformers?
	**It normalizes across tokens rather than batches, making it more suited for variable-length sequences.**
> Batch normalization depends on batch statistics (mean and variance), which can vary for different sequence lengths and batch sizes.  
Layer normalization normalizes across the features per token, making it stable for sequences of any length — perfect for NLP.

### **Spørsmål 8**
**Question:** During inference, how do Transformer models typically generate text sequences?
	**By predicting one token at a time and using it as input for the next prediction.**
> Even though Transformers can process sequences in parallel during training, during inference (text generation), the next token depends on the previous ones.
> So, the model predicts one token, appends it to the input, and predicts the next — a process known as **autoregressive generation**.

