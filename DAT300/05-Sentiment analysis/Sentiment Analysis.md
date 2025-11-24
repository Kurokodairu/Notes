## Sentiment analysis
- A subfield of Natural Language Processing (NLP)
- Classify documents based on their polarity
	- the attitude of the writer
	- sometimes called "opinion mining"
- Example from the Internet Movie Database (IMDb)
	- 50000 movie reviews
	- Predictor for positive and negative reviews <6 / >=6 stars (out of 10)
- Similar examples with discussion fora
	- Predictor for ideas and non-ideas (Lego, beer brewing, ...)

### Bag of words model
- Represent documents as counts of words
- Vocabulary across all documents
- Sparse representation
	- Only part of the vocabulary used in each text
- Many ways to implement this:
	- Potential for crazy overhead
	- Here: scikit-learn CountVectorizer

Per document, array representation of the word counts used as feature vectors. The values in the feature vectors are also called the raw term frequencies: *tf (t,d)* — the number of times a term *t* occurs in a document *d*.

### n-grams and K-mers
- Single word counts => 1-gram (what we did above)
- Counts of word sequences
- 2-gram: Sentence: "DAT300 is great and I love it."
	-DAT300 is, is great, great and, and I, I love, love it
- 3-gram: Sentence: "DAT300 is great and I love it."
	-DAT300 is great, is great and, great and I, and I love, I love it
- Spam filters showed good performance with 3-grams and 4-grams (in 2007)

- Parameter to the CountVectorizer: https://scikit-learn.org/stable/modules/generated/sklearn.feature_extraction.text.CountVectorizer.html

**TF-IDF**
- Words occuring frequently in multiple documents from both/all classes should be downweighted
    - term frequency-inverse document frequency (tf-idf)
$$\text{tf-idf}(t,d)=\text{tf (t,d)}\times \text{idf}(t,d)$$
- tf(t, d): term frequency
- *idf(t, d)*: inverse document frequency

- *idf(t, d)*: inverse document frequency:
$$\text{idf}(t,d) = \text{log}\frac{n_d}{1+\text{df}(d, t)},$$
- $n_d$ = #documents, *df(d, t)* is the number of documents *d* that contain the term *t*
- optional 1 in denominator (omni-present words would get 0 without)
- log is used to ensure that low document frequencies are not given too much weight




**skip-gram**
- Given a word, predit the context
- It takes a word as input and tries to predict the context, meaning the  surrounding words. It's believed to work better with a small amount of data and  with rare words.
- For Skip-Gram, the one-hot encoded word vector is passed through the hidden  layer and then the output layer to predict context words.
- "The cat sat on the mat"
	- for the word "sat", window size of 2, targets are ["The", "Cat", "on", "the"]

**CBOW** (Continous bag of words)
- Given context, predict the target word
- Takes context (surrounding words), predicts the word in the middle
- For CBOW, the one-hot encoded context vectors are averaged or summed,  
	passed through the hidden layer, and then the output layer to predict the target  
	word.
- "The cat sat on the mat"
	- ["The", "Cat", "on", "the"] is context words, The target word is "sat"
	- CBOW tries to predict "sat" given ["The", "cat", "on", "the"].
