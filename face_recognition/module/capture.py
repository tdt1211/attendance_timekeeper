# module/capture.py
import cv2
import os

def capture_images(name, save_path="data", max_images=50):
    cam = cv2.VideoCapture(0)
    detector = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_default.xml")

    save_dir = os.path.join(save_path, name)
    os.makedirs(save_dir, exist_ok=True)

    count = 0
    while True:
        ret, img = cam.read()
        if not ret:
            break
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        faces = detector.detectMultiScale(gray, 1.3, 5)

        for (x, y, w, h) in faces:
            count += 1
            face = gray[y:y+h, x:x+w]
            cv2.imwrite(f"{save_dir}/{count}.jpg", face)
            cv2.rectangle(img, (x, y), (x+w, y+h), (255, 0, 0), 2)

        cv2.imshow('Capturing...', img)
        if cv2.waitKey(1) == 27 or count >= max_images:  # ESC to stop
            break

    cam.release()
    cv2.destroyAllWindows()
    print(f"[INFO] Collected {count} images for {name}")
