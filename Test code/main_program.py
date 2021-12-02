# object detector boot.py
# generated by maixhub.com

import sensor, image, lcd, time
import KPU as kpu
import gc, sys
import uos

#def get_sensor_data():

#def send_data():


def main(anchors, labels = None, model_addr="/sd/m.kmodel", sensor_window=(224, 224), lcd_rotation=0, sensor_hmirror=False, sensor_vflip=False):
    sensor.reset()
    sensor.set_pixformat(sensor.RGB565)
    sensor.set_framesize(sensor.QVGA)
    sensor.set_windowing(sensor_window)
    sensor.set_hmirror(sensor_hmirror)
    sensor.set_vflip(sensor_vflip)
    sensor.run(1)

    lcd.init(type=1)
    lcd.rotation(lcd_rotation)
    lcd.clear(lcd.WHITE)

    if not labels:
        with open('labels.txt','r') as f:
            exec(f.read())

    try:
        task = None
        task = kpu.load(model_addr)
        kpu.init_yolo2(task, 0.3, 0.5, 5, anchors) # threshold:[0,1], nms_value: [0, 1]
        while 1:
            img = sensor.snapshot()
            print("read image")
            lcd.display(img)
            #img = img.resize(224,224)
            #img.pix_to_ai()
            objects = kpu.run_yolo2(task, img)
            if objects:
                for obj in objects:
                    pos = obj.rect()
                    img.draw_rectangle(pos)
                    img.draw_string(pos[0], pos[1], "%s : %.2f" %(labels[obj.classid()], obj.value()), scale=1, color=(255, 0, 0))
            #img.draw_string(0, 200, img, scale=1, color=(255, 0, 0))
            lcd.display(img)
            time.sleep(1)
    except Exception as e:
        raise e
    finally:
        kpu.deinit(task)

if __name__ == "__main__":
    try:
        labels = ['fire', 'smoke']
        anchors = [0.46875, 0.65625, 5.34375, 4.125, 2.25, 3.21875, 1.375, 1.53125, 4.09375, 2.03125]
        main(anchors = anchors, labels=labels, model_addr="/sd/m.kmodel", lcd_rotation=2, sensor_window=(224, 224))
    except Exception as e:
        sys.print_exception(e)
    finally:
        gc.collect()
