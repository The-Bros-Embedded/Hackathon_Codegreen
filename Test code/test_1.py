
import sensor, image, lcd, time
import KPU as kpu
import gc, sys

def lcd_show_except(e):
    import uio
    err_str = uio.StringIO()
    sys.print_exception(e, err_str)
    err_str = err_str.getvalue()
    img = image.Image(size=(224,224))
    img.draw_string(0, 10, err_str, scale=1, color=(0xff,0x00,0x00))
    lcd.display(img)

def main(anchors, model_addr="/sd/m.kmodel", labels = None, lcd_rotation=0, sensor_hmirror=False, sensor_vflip=False, sensor_window=(224, 224)):
    try:
        sensor.reset()
    except Exception as e:
        raise Exception("sensor reset fail, please check hardware connection, or hardware damaged! err: {}".format(e))
    sensor.set_pixformat(sensor.RGB565)
    sensor.set_framesize(sensor.QVGA)
    sensor.set_windowing(sensor_window)
    sensor.set_hmirror(sensor_hmirror)
    sensor.set_vflip(sensor_vflip)
    sensor.run(1)

    lcd.init(type=1)
    lcd.rotation(lcd_rotation)
    lcd.clear(lcd.WHITE)

    #anchors = (1.889, 2.5245, 2.9465, 3.94056, 3.99987, 5.3658, 5.155437, 6.92275, 6.718375, 9.01025)
    try:
        task = None
        task = kpu.load(model_addr)
        kpu.init_yolo2(task, 0.5, 0.3, 5, anchors) # threshold:[0,1], nms_value: [0, 1]
        while(True):
            img = sensor.snapshot()
            #t = time.ticks_ms()
            #img = img.resize(224,224)
            #img.pix_to_ai()
            objects = kpu.run_yolo2(task, img)
            #t = time.ticks_ms() - t
            if objects:
                for obj in objects:
                    pos = obj.rect()
                    img.draw_rectangle(pos)
                    img.draw_string(pos[0], pos[1], "%s : %.2f" %(labels[obj.classid()], obj.value()), scale=1, color=(255, 0, 0))
            #img.draw_string(0, 200, "t:%dms" %(t), scale=2)
            lcd.display(img)
    except Exception as e:
        raise e
    finally:
        if not task is None:
            kpu.deinit(task)


if __name__ == "__main__":
    try:
        labels = ['fire', 'smoke']
        anchors = [0.46875, 0.65625, 5.34375, 4.125, 2.25, 3.21875, 1.375, 1.53125, 4.09375, 2.03125]
        main( anchors = anchors, model_addr="/sd/m.kmodel", labels = labels, lcd_rotation=2, sensor_hmirror=False, sensor_vflip=False, sensor_window=(224, 224))
    except Exception as e:
        sys.print_exception(e)
        lcd_show_except(e)
    finally:
        gc.collect()
