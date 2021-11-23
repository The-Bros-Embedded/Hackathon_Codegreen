# object detector boot.py
# generated by maixhub.com

import sensor, image, lcd, time
import KPU as kpu
import gc, sys
import uos

def lcd_show_except(e):
    import uio
    err_str = uio.StringIO()
    sys.print_exception(e, err_str)
    err_str = err_str.getvalue()
    img = image.Image(size=(224,224))
    img.draw_string(0, 10, err_str, scale=1, color=(0xff,0x00,0x00))
    lcd.display(img)

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
        kpu.init_yolo2(task, 0.2, 0.7, 5, anchors) # threshold:[0,1], nms_value: [0, 1]
        while 1:
            for fileimage in uos.listdir("/sd/images2"):
                img = image.Image("/sd/images2/"+fileimage)
                print("read image")
                lcd.display(img)
                time.sleep(1)
                #t = time.ticks_ms()
                img = img.resize(224,224)
                img.pix_to_ai()
                objects = kpu.run_yolo2(task, img)
                if objects:
                    for obj in objects:
                        pos = obj.rect()
                        img.draw_rectangle(pos)
                        img.draw_string(pos[0], pos[1], "%s : %.2f" %(labels[obj.classid()], obj.value()), scale=1, color=(255, 0, 0))
                #img.draw_string(0, 200, "t:%dms" %(t), scale=2, color=(255, 0, 0))
                img.draw_string(0, 200, fileimage, scale=1, color=(255, 0, 0))
                lcd.display(img)
                time.sleep(2)
    except Exception as e:
        raise e
    finally:
        kpu.deinit(task)
        #time.sleep(2)


if __name__ == "__main__":
    try:
        labels = ['fire', 'smoke']
        #anchors = [1.65625, 2.3125, 0.28125, 0.46875, 0.59375, 1.03125, 2.46875, 1.25, 3.40625, 3.0625]
        #anchors = [3.8125, 3.8125, 5.375, 5.375, 7.1875, 7.1875, 11.25, 11.3125, 9.125, 9.125]
        anchors = [1.889, 2.5245, 2.9465, 3.94056, 3.99987, 5.3658, 5.155437, 6.92275, 6.718375, 9.01025]
        main(anchors = anchors, labels=labels, model_addr="/sd/m.kmodel", lcd_rotation=2, sensor_window=(224, 224))
        # main(anchors = anchors, labels=labels, model_addr="/sd/m.kmodel")
    except Exception as e:
        sys.print_exception(e)
        lcd_show_except(e)
    finally:
        gc.collect()
