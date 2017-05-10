myNet = load('trainednet.mat','myNet');
value = getfield(myNet, 'myNet');

 testImage = imread('pants4.jpg');
 l = imresize(testImage,[227 227]);
predictedLabels = classify(value, l);

i = imread('kod.jpg');
im = imresize(i,[227 227]);
detector = vision.CascadeObjectDetector('ClassificationModel', 'UpperBody');
bboxes = step(detector, im);
%predictedLabel1 = classify(value, im);
 im2 = insertObjectAnnotation(im, 'rectangle', bboxes, 'person', 'Color', 'red');
  imshow(im2);


torso = im(bboxes(1)+uint8(bboxes(4)*0.6):(bboxes(1)+uint8(bboxes(4)*0.6)+bboxes(4)),bboxes(2):bboxes(2)+bboxes(3));
x1 = bboxes(2)+uint8(bboxes(4)*0.5);
x2= bboxes(2)+uint8(bboxes(4)*0.5) + bboxes(4);
y1=bboxes(1)-uint8(bboxes(3)*0.3);
y2 = bboxes(1)+bboxes(3)+uint8(bboxes(3)*0.4);
torso = i(x1:x2,y1:y2,:);
t1 = imresize(torso,[227 227]);
bbox1 = [y1 x1 (y2-y1) (x2-x1)];
predictedLabel1 = classify(value, t1);
s = char(predictedLabel1);
im3 = insertObjectAnnotation(im, 'rectangle', bbox1, s, 'Color', 'blue');
imshow(im3);

x11 = bboxes(2)+uint8(bboxes(4)*0.5) + bboxes(4);
x22 = bboxes(2)+uint8(bboxes(4)*0.5) + bboxes(4) + uint8(bboxes(4)*2);
y11 = bboxes(1)-uint8(bboxes(3)*0.3);
y22 = bboxes(1)+bboxes(3)+uint8(bboxes(3)*0.4);
legs = i(x11:x22,y11:y22,:);
l1 = imresize(legs,[227 227]);
bbox2 = [y11 x11 (y22-y11) (x22-x11)];
[predictedLabel2,err] = classify(value, l1);
s2= char(predictedLabel2);
postition = [bbox1;bbox2];
im3 = insertObjectAnnotation(im, 'rectangle', postition, {s,s2}, 'Color', {'blue','red'});
imshow(im3);
