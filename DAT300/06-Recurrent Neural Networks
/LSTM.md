* **Long-Short-Term-Memory (LSTM) units (most common)**
    - Architecture that avoids vanishing / exploding gradient problems
    - Sepp Hochreiter and Jürgen Schmidhuber, Long short-term memory, *Neural computation*, 9, no. 8, (1997): 1735 - 1780
### LSTM
* **LSTMs** were introduced and **designed to overcome** the vanishing gradient problem
* LSTM adds a way to carry information **across many timesteps**
* In this way LSTM **saves information for later**, thus **preventing older signals** from gradually vanishing during processing by re-injecting past information from previous layers 
* The building block of an LSTM is a **memory** cell, which essentially represents the hidden layer
* Unfolded structure of a **modern** LSTM cell is shown on next slide

* Gated Recurrent Units (GRU)
* GRUs have a simpler architecture than LSTMs 
    * fewer parameters
    * ==> computationally more efficient
    * for some tasks performance comparable to those of LSTM
* There are reports exhibiting that GRUs have better performance on smaller datasets 


There are several ways to improve the performance and generalisation power of RNNs.
* **Recurrent dropout** - This is a specific, built-in way to use dropout to fight overfitting in recurrent layers
* **Stacking recurrent layers** - This increases the representational power of the network (at the cost of higher computational loads)
* **Bidirectional recurrent layers** - These present the same information to a recurrent network in different ways, increasing accuracy and mitigating forgetting issues

<img src="./images/fig_07_12a.png" width=1000/>
* $\bf{C}^{(t-1)}$: cell state at previous time step $t-1$
* $\oplus$: elementwise addition
* $\odot$: elementwise multiplication
* $\bf{h}^{(t-1)}$: hidden units activation at previous time step $t-1$
* $\bf{x}^{(t)}$: input data at current time step $t$

**Forget gate** $f_{t}$
* Allows the memory cell to reset the cell state $\bf{C}$ to avoid $\bf{C}$ growing indefinitively
* Decides which information is allowed to go through and which information to suppress (controls how much of the old cell value is used in the new cell value)
<img src="./images/fig_07_13.PNG" width=600/><img src="./images/fig_07_12e.png" width=1000/>

**Input gate** $i_{t}$ and **input node** $g_{t}$
* Input gate $i_{t}$ and input node $g_{t}$ are responsible for updating the cell state $\bf{C}$
<img src="./images/fig_07_14.PNG" width=600/><img src="./images/fig_07_12f.png" width=1000/>

* Output gate $o_{t}$ decides how to update the values of hidden units (controls how much of the new cell value is outputted)
<img src="./images/fig_07_12g.png" width=1000/>

**Computation of hidden units activations** $\bf{h}^{(t)}$ **at time step** $t$
<img src="./images/fig_07_12h.png" width=1400/>
### tanh, over sigmoid here, sigmoid works but **tanh** is much better


**Further reading on LSTM**

* [Understanding LSTM Networks](http://colah.github.io/posts/2015-08-Understanding-LSTMs/?source=post_page-----37e2f46f1714----------------------)
* [The Unreasonable Effectiveness of Recurrent Neural Networks](https://karpathy.github.io/2015/05/21/rnn-effectiveness/)

