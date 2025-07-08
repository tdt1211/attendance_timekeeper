# module/recognize.py
import cv2
import datetime
import json
import os

def load_label_map(path="models/label_map.txt"):
    with open(path, "r") as f:
        return {int(line.split(":")[0]): line.strip().split(":")[1] for line in f}

def recognize(model_path="models/face_model.yml"):
    import time
    recognizer = cv2.face.LBPHFaceRecognizer_create()
    recognizer.read(model_path)
    labels = load_label_map()

    cam = cv2.VideoCapture(0)
    detector = cv2.CascadeClassifier(cv2.data.haarcascades + "haarcascade_frontalface_default.xml")

    print("[INFO] Starting face recognition. Press ESC to quit.")
    last_checkin = {}
    log_file = "attendance_log.json"
    # Load old log if exists
    if os.path.exists(log_file):
        with open(log_file, "r", encoding="utf-8") as f:
            attendance_log = json.load(f)
    else:
        attendance_log = []
    while True:
        ret, img = cam.read()
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        faces = detector.detectMultiScale(gray, 1.1, 4)  # tăng độ nhạy: giảm scaleFactor và minNeighbors

        for (x, y, w, h) in faces:
            face = gray[y:y+h, x:x+w]
            id_, confidence = recognizer.predict(face)
            now = datetime.datetime.now()
            if confidence < 80:  # tăng ngưỡng để nhận diện dễ hơn
                name = labels.get(id_, "Unknown")
                last_time = last_checkin.get(name)
                if name != "Unknown":
                    if not last_time or (now - last_time).total_seconds() >= 30:
                        last_checkin[name] = now
                        cv2.putText(img, f"{name} ({int(confidence)}%)", (x, y-10),
                                    cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 255, 0), 2)
                        print(f"[ATTENDANCE] {now.strftime('%Y-%m-%d %H:%M:%S')}: {name}")
                        # Ghi log vào file json
                        attendance_log.append({
                            "name": name,
                            "datetime": now.strftime("%Y-%m-%d %H:%M:%S")
                        })
                        with open(log_file, "w", encoding="utf-8") as f:
                            json.dump(attendance_log, f, ensure_ascii=False, indent=2)
                    else:
                        cv2.putText(img, f"{name}", (x, y-10),
                                    cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 255, 0), 2)
                else:
                    cv2.putText(img, "Unknown", (x, y-10),
                                cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 0, 255), 2)
            else:
                cv2.putText(img, "Unknown", (x, y-10),
                            cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 0, 255), 2)

            cv2.rectangle(img, (x, y), (x+w, y+h), (255, 255, 0), 2)

        cv2.imshow('Recognition', img)
        if cv2.waitKey(1) == 27:
            break

    cam.release()
    cv2.destroyAllWindows()
