import cv2
import numpy as np


img = cv2.imread('object.bmp')
img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
img = 255 - img
(thresh, img) = cv2.threshold(img, 128, 255, cv2.THRESH_BINARY | cv2.THRESH_OTSU)

label = np.zeros(img.shape)

for i in range(img.shape[0]):
    for j in range(img.shape[1]):
        temp = img[i][j]
        cl = 1
        if temp == 255:
            if temp == img[i-1,j] or temp == img[i,j-1] or temp == img[i+1,j] or temp == img[i,j+1]:
                label[i][j] = cl
                cl += 1

cv2.imshow('Label', label)

cv2.waitKey(0)
cv2.destroyAllWindows()