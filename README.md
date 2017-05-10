# Classification-of-Clothes
Matlab :
Our code works on matlab versions which have a Neural Network Tool Box.

downloadalexnet.mat file downloads the alexnet.
readandPreprocessImage.mat, reads the image and scales it to appropriate size.
Training.mat trains the CNN on dataset.
Testing.mat contains the main code for detection of clothing.

The dataset used for the project can be downloaded from http://people.ee.ethz.ch/~lbossard/projects/accv12/index.html



Tensorflow:

To test our program we need to load a graph and a txt file into the python program (inception.py)
Run the inception using the following command on command line

--how_many_training_steps 500 \
--output_graph= ~/new_graph.pb \
--output_labels= ~/new_labels.txt \
--image_dir ~/(imagedata directory)



new_graph.pb is the graph which we have to load , We trained the network on shirts,jackets and sweaters using inception model,so this file contains the optimised weights and biases load this into the program to see results.

new_labels.txt is labels text document for shirts,jackets and sweaters trained on inception model,this file contains the required labels load this into the program to see results.

Store the above two in a files at the same location as testing_inception file.

run the program and see the result.

![alt text](https://github.com/chhari/Classification-of-Clothes/blob/master/mainresult.jpg)
![alt text](https://github.com/chhari/Classification-of-Clothes/blob/master/pantstest.JPG)
![alt text](https://github.com/chhari/Classification-of-Clothes/blob/master/haritestresultdip.JPG)
