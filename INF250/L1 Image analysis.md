R G B
8 bits -> 256 values [0, 255] grayscale images


**Digitization**: It means that a digital image can never capture reality perfectly. Instead, it stores a simplified representation of the real world. It includes both sampling and quantization.

The camera sensor measures the light reflected from the flower. However, the sensor cannot
measure every possible point. Instead, it measures light only at small locations called pixels.

**Spatial sampling**: The first approximation happens here. Instead of recording infinite locations
The camera records only pixel 1, pixel 2, pixel 3, …pixel N.
This is called sampling.

**Image sampling** is the process of converting a continuous, analog image (like a real-world scene) into a discrete grid of finite points, known as pixels. This determines the image's spatial resolution
(e.g., 1920 × 1080 pixels), dictating where data is measured to form a digital image.

---

**Quantization**: Quantization decides how accurately that color or brightness is represented by
assigning it to a discrete color or grayscale level.

Now suppose one sampled point has actual brightness (157.843291635746). The computer cannot
store infinitely precise number. Instead it rounds it to 158.
If using an 8-bit image, only 0, 1, 2, 3,….255 are allowed. This rounding process is called
quantization.

---

Image processing techiniques
- Image enhancement
	- Subtraction - Enhance details
- Image restoration
- Morphological operations
	- Dilation, Erosion
- Color image processing
- image segmentation
- object detection


Spatial resolutions
![[Pasted image 20260907133346.png]]

Can also be streched to larger... -> Becomes pixelize


Concept Controls Example Visible effect

Sampling  Number and spacing of pixels 100 × 100vs. 1000 ×
1000pixels Spatial detail and pixelation
Spatial resolution Ability to distinguish small
spatial details Fine text, hair, edges Higher sampling can support
higher spatial resolution
Quantization Number of intensity/color
levels 2, 16, or 256 gray levels Smooth tones versus banding
Stretching/resizing Display or output dimensions 100 × 100 → 1000 × 1000 Makes pixels larger or
interpolates new pixels



![[Pasted image 20260907134213.png]]