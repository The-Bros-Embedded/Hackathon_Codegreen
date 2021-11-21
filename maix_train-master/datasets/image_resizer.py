import cv2
import os

# change path to get image
input_path_fire = 'C:/Users/dadan/Downloads/fire-dataset/train/images'
#input_path_neutral = 'C:/Users/Lenovo/Downloads/Dataset/Dataset/images/neutral'
#input_path_smoke = 'C:/Users/Lenovo/Downloads/Dataset/Dataset/images/smoke'

output_path_fire = 'C:/Users/dadan/Documents/Hackathon_Codegreen/maix_train-master/datasets/fire/images/'
#output_path_neutral = 'E:/Hackster/Hackathon/maix_train-master/datasets/forestfire/images/neutral/'
#output_path_smoke = 'E:/Hackster/Hackathon/maix_train-master/datasets/forestfire/images/smoke/'

_cnt = 0

for images in os.listdir(input_path_fire):
    img = cv2.imread(os.path.join(input_path_fire,images), cv2.IMREAD_UNCHANGED)
    print('Original Dimensions : ', img.shape)
    img = cv2.resize(img, (224, 224))
    print('Resized Dimensions : ', img.shape)
    _cnt = _cnt + 1
    filename = "fire_" + str(_cnt) + ".jpg"
    cv2.imwrite(output_path_fire+filename, img)

cv2.imshow("Resized image", img)
cv2.waitKey(0)

'''
for images in os.listdir(input_path_neutral):
    img = cv2.imread(os.path.join(input_path_neutral,images), cv2.IMREAD_UNCHANGED)
    print('Original Dimensions : ', img.shape)
    #print(type(img.shape))
    #print(type(img.shape[0]))
    img = cv2.resize(img, (224, 224))
    print('Resized Dimensions : ', img.shape)
    cv2.imwrite(output_path_neutral+images, img)

cv2.imshow("Resized image", img)
cv2.waitKey(0)

for images in os.listdir(input_path_smoke):
    width = 0
    height = 0
    img = cv2.imread(os.path.join(input_path_smoke,images), cv2.IMREAD_UNCHANGED)
    print('Original Dimensions : ', img.shape)
    width = img.shape[1]
    height = img.shape[0]

    #if width > 224:
    #    width = 224
    #else:
    #    width = width

    #if height > 224:
    #    height = 224
    #else:
    #    height = height

    dim = (224, 224)
    img = cv2.resize(img, dim)
    print('Resized Dimensions : ', img.shape)
    _cnt = _cnt + 1
    filename = "smoke_"+str(_cnt)+".jpg"
    print(filename)
    cv2.imwrite(output_path_smoke+filename, img)

cv2.imshow("Resized image", img)
cv2.waitKey(0)
'''
