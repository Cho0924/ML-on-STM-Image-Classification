import numpy as np
import serial
import time
import customtkinter as ctk
import tkinter as tk
from matplotlib import pyplot as plt
from matplotlib.figure import Figure
from PIL import Image, ImageTk
import sys

if __name__ == '__main__':
    # load test data
    x_test = np.load('x_test_fmnist.npy')
    y_test = np.load('y_test_fmnist.npy').squeeze()

    ctk.set_appearance_mode("dark")

    dataset_name = sys.argv[1]
    classes = []

    # set classes
    if(dataset_name == 'mnist'):
        classes = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    elif(dataset_name == 'cifar10'):
        classes = ['airplane', 'automobile', 'bird', 'cat', 'deer', 'dog', 'frog', 'horse', 'ship', 'truck']
    elif(dataset_name == 'fmnist'):
        classes = ["T-shirt/top", "Trouser", "Pullover", "Dress", "Coat", "Sandal", "Shirt", "Sneaker", "Bag", "Ankle boot"]
    print(f'classes: {classes}')
    
    print(f'Loaded x with shape: {x_test.shape}')
    print(f'Loaded y with shape: {y_test.shape}')

    # need to disconnect other apps (like TeraTerm) that's occupying COM5 for this code to run
    ser = serial.Serial(port='COM5', baudrate=115200, timeout=3)
    # flush the serial port
    ser.flush()
    ser.flushInput()
    ser.flushOutput()

    correct_count = 0
    # define how many images from the test set to send to the MCU
    test_len = 10000
    # get how many prediction we iterated over
    num_pred = 0
    # num_pred_total = 0
    
    def update_gui(img, class_idx, pred):
        f = Figure()
        a = f.add_subplot(111)
        a.imshow(img.astype(np.uint8))
        f.savefig('test.png')
        image = Image.open('test.png')
        photo = ImageTk.PhotoImage(image)
        img_label.configure(image=photo)
        img_label.image = photo # for preveting garbage collection
        pred_text = f'Prediction: {classes[np.argmax(pred)]}'
        pred_label.configure(text=pred_text, fg_color='#0B8457' if (np.argmax(pred) == class_idx) else '#F24C4C', text_color='white')
        target_label.configure(text=f'Target: {classes[class_idx]}', fg_color='#0B8457' if (np.argmax(pred) == class_idx) else '#F24C4C', text_color='white')
        accuracy = (correct_count/num_pred) * 100
        accuracy_text = f'Accuracy: {accuracy:.2f}%'
        accuracy_label.configure(text=accuracy_text)

    def next_image():
        global num_pred, correct_count, x_test, y_test
        if num_pred < test_len:
            x = x_test[num_pred]
            y = y_test[num_pred]
            num_pred += 1
            class_idx = y
            # send test data
            ser.write(x.tobytes())
            time.sleep(1)
            # read image data from MCU for checking
            img = ser.read(28*28)
            # interpret a buffer as a 1-dimensional uint8 array
            img = np.frombuffer(img, dtype=np.uint8) # for printing on command prompt
            print("Image sent to the MCUs: \n {}".format(img))
            time.sleep(1)
            # read predicted results
            pred = ser.read(10)
            pred = np.frombuffer(pred, dtype=np.uint8)
            print(f'pred: {pred}')
            print(f'Target: {classes[class_idx]}, Prediction (from MCU): {classes[np.argmax(pred)]}')
            if (np.argmax(pred) == class_idx):
                correct_count += 1
            update_gui(x, class_idx, pred)

    root = ctk.CTk()
    root.title('Real-time inference')

    img_label = ctk.CTkLabel(master=root, text=None)
    img_label.grid(row=0, column=0, padx=(10, 5), pady=10, columnspan=2)

    pred_label = ctk.CTkLabel(root, font=('Helvetica', 18, 'bold'))
    pred_label.grid(row=1, column=0, padx=(10, 5), pady=10, columnspan=1, sticky='nsew')

    target_label = ctk.CTkLabel(root, font=('Helvetica', 18, 'bold'))
    target_label.grid(row=1, column=1, padx=(5, 10), pady=10, columnspan=1, sticky='nsew')

    accuracy_label = ctk.CTkLabel(root, font=('Helvetica', 18, 'bold'), fg_color='#FFC107', text_color='#2D2D2D')
    accuracy_label.grid(row=2, column=0, padx=(10, 10), pady=10, columnspan=2, sticky='nsew')

    ctk.CTkButton(master=root, text='Next', command=next_image, fg_color='#3E497A', font=('Helvetica', 18, 'bold'), hover_color='#3AB4F2').grid(row=3, column=0, padx=(10, 5), pady=10, columnspan=2, sticky='nsew')
    ctk.CTkButton(master=root, text='Quit', command=root.quit, fg_color='#3E497A', hover_color='#DA0037', font=('Helvetica', 18, 'bold')).grid(row=4, column=0, padx=(10, 5), pady=10, columnspan=2, sticky='nsew')

    next_image()  # Load the first image

    root.mainloop()
