import cv2     # h, w, c

img = cv2.imread("./py/1.jpg")
img = cv2.resize(img,(640,480))    #可以改变图片的大小
print("图像的形状,返回一个图像的(行数,列数,通道数):", img.shape)
print("图像的像素数目:", img.size/img.shape[2])
print("图像的数据类型:", img.dtype)
fname = open("./py/th.txt",'w')
Ylenth = img.shape[1]          # 图片列数
Xlenth = img.shape[0]          # 图片行数

for i in range(Xlenth):
    for j in range(Ylenth):
        # fname.write(str(img[i][j][0])+','+str(img[i][j][1])+','+str(img[i][j][2])+'\n')
        fname.write(("{:02X}".format(img[i][j][0]))+("{:02X}".format(img[i][j][1]))+("{:02X}".format(img[i][j][2]))+'\n')
    # fname.write('\n')
fname.close()


# cv2.imshow('image',img)
# cv2.waitKey(0)
# cv2.destroyAllWindows()
