import cv2

image = cv2.imread('C:/Images/REPOS/GitHub/VIDEO_STREAM/ZEDBOARD/uvm_tb/VFP_TEST/dut/tb/uvm_images/write/hsv_v2.bmp')




# RGB Red
cv2.imshow('S-HSV_V2',image[:, :, 1])
cv2.imwrite('S-HSV_V2.bmp',image[:, :, 1])



cv2.waitKey(0)