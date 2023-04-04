import cv2
import numpy as np

with open("./py/th_out.txt", "r") as f:
    data = f.readlines()
img_data = []
for pixel in data:
    img_data.append([int(pixel[i:i+2], 16) for i in range(0, len(pixel)-1, 2)])
img_data = np.array(img_data).reshape(480, 640, 3).astype(np.uint8)
cv2.imwrite('./py/1_out.jpg',img_data)
cv2.imshow('image', img_data)
cv2.waitKey(0)
cv2.destroyAllWindows()