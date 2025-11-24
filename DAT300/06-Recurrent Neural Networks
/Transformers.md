
Definition: Transformers are deep learning models based on the attention mechanism, designed to process  sequential data (e.g., text) in parallel. They eliminate the need for recurrence by leveraging self-attention to model relationships between all input tokens.

![[Pasted image 20251120215846.png]]


--- 
Problems with RNN (among others)  
1. Slow computation for long sequences  
2. Vanishing or exploding gradients  
3. Difficulty in accessing information from long time ago

---

### TRANSFORMER
ENCODER

| Input embedding                              | Converts tokens into vectors                              |
| -------------------------------------------- | --------------------------------------------------------- |
| Positional encoding                          | Injects order information into embeddings                 |
| Multi-Head attention                         | Lets each token attend to all others in the input         |
| Add and Norm                                 | Residual connection plus layer normalization              |
| Feed-Forward network                         | Two linear layers with a nonlinearity, applied per token. |
| The encoder stack repeats this block N times |                                                           |
Decoder

| Output embedding                        | Vector representation of shifted-right target tokens |
| --------------------------------------- | ---------------------------------------------------- |
| Positional encoding                     | Adds order information                               |
| Masked Multi head attention             | Prevents attending to future positions               |
| Encoder-Decoder attention               | Attends to encoder outputs                           |
| Feed forward network + Add and Norm     | Same structure as the encoder                        |
| The decoder block also repeats N times. |                                                      |
=> Final layers: Linear + Softmax, Projects decoder outputs to vocabulary probabilities.

![[Pasted image 20251120220602.png]]


![[Pasted image 20251120220627.png]]

Positional encoding (b)


Self-Attention (c)
The purpose of attention is to enable a model to focus on the most relevant parts of an input sequence when making  
decisions or generating outputs. In other words, it helps the model identify and weigh the importance of different  
parts of the input based on the current context.

Multi-head Attention  
𝐴𝑡𝑡𝑒𝑛𝑡𝑖𝑜𝑛 𝑄, 𝐾, 𝑉 = softmax 𝑄𝐾𝑇  
𝑑𝑘  
𝑉  
𝑀𝑢𝑙𝑡𝑖𝐻𝑒𝑎𝑑 𝑄, 𝐾, 𝑉 = 𝐶𝑜𝑛𝑐𝑎𝑡 ℎ𝑒𝑎𝑑1 ... ℎ𝑒𝑎𝑑ℎ  
Umar Jamil – https://github.com/hkproj/transformer-from-scratch-notes  
𝑊𝑂  
𝑖ℎ𝑒𝑎𝑑𝑖 = 𝐴𝑡𝑡𝑒𝑛𝑡𝑖𝑜𝑛(𝑄𝑊𝑄, 𝐾𝑊𝐾, 𝑉𝑊𝑉)

Layer normalization(d)

Feed forward (e)?  
Umar Jamil – https://github.com/hkproj/transformer-from-scratch-notes  
Purpose  
• Complements the Multi-Head Attention mechanism by applying additional transformations independently to each token after attention has  computed contextual relationships.  
• While attention focuses on relationships between tokens, the feedforward layer enriches the individual token representations.  

Input and Output  
Input: The output of the Multi-Head Attention layer, which contains context-aware token embeddings (dimension dmodeldmodel).  
Output: Refined token embeddings of the same dimension ready for further processing or layer stacking.

