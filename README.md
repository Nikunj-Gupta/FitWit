### Introduction
This is an applicaton which helps in distinguishing between various categories like running, jumping, walking or climbing based on the given fitness data from fitness applications and devices. It uses machine learning models including kmeans clustering on the data.
 
### Project
* We used the ‘AndroSensor’ app for the activity data.
* Number of steps were counted with the zero-crossing of absolute values of acceleration.
* K- means algorithm was used to solve the clustering problem. The procedure followed a simple way to classify a given data set through 4 clusters.

### Task 1: Step Count
	Procedure:
	1) Magnitude of data, i.e., sqrt(accel_x^2 + accel_y^2 + accel_z^2) calculated
	2) Mean of magnitude of data subtracted to get new 0 mean
	3) Number of zero crossings calculated to get number of steps
	
### Task 2: Data Collection
	Procedure:
	1) 1500 samples collected for each activity
	2) Windowed into groups of size 150 to generate 6 features for each window
	3) Gives (1500/150) = 10 training data samples for each activity, each of dimension 6
	4) Final training data matrix of size 40 X 6 supplied to clustering algorithm
	
### Feature Extraction
	6 features used - 3 in time, and 3 in frequency domain (NOTE - magnitude of data is sqrt(accel_x^2 + accel_y^2 + accel_z^2))
		1) Feature 1: mean of magnitude of data
		2) Feature 2: sum of magnitude of data below 25 percentile
		3) Feature 3: sum of magnitude of data below 75 percentile
		4) Feature 4: peak frequency in spectrum of magnitude of data below 5 Hz
		5) Feature 5: number of peaks in spectrum of magnitude of data below 5 Hz
		6) Feature 6: sum of spectrum of magnitude of data from 0 to 5 Hz

### Observations
* Using only time domain features we get distinct clusters for walking and running (cluster 4 and 2 respectively). Jumping and climbing are not well separated.
* Using both time and frequency domain features we get clear classification of climbing and jumping (clusters 4 and 2 respectively). Although not as clear, distinct clusters for walking and running can also be seen (clusters 1 and 3 respectively).


### Usage
* Type ```load train2.mat``` to load variables - a(accel_x), b(accel_y), c(accel_z).
* Type ```RUN(a,b,c)``` to see k-means clustering output.
* Type ```zcd(a,b,c)``` to see number of steps.

### Tech

* [kmeans][kmeans]
* [Matlab][matlab]

### Acknowledgements

* [Prof. Sujit Kumar Chakrabarti][profskc] for guiding us and giving us an opportunity to learn a lot from such a project.
* My seniors for giving useful tips and ideas for successfully completing our project.

### Development

Want to contribute? *Great!*

   [kmeans]: <https://en.wikipedia.org/wiki/K-means_clustering>
   [matlab]: <https://www.mathworks.com/products/matlab.html> 
