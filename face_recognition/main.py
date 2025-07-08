# main.py
from module.capture import capture_images
from module.train import train_model
from module.recognize import recognize
from module.delete import delete_employee

def menu():
    print("1. Thêm người mới")
    print("2. Huấn luyện model")
    print("3. Chấm công (nhận diện)")
    print("4. Xóa nhân viên")
    print("0. Thoát")

while True:
    menu()
    choice = input("Chọn chức năng: ")
    if choice == "1":
        name = input("Nhập tên nhân viên: ")
        capture_images(name)
    elif choice == "2":
        train_model()
    elif choice == "3":
        recognize()
    elif choice == "4":
        name = input("Nhập tên nhân viên cần xóa: ")
        delete_employee(name)
    elif choice == "0":
        break
    else:
        print("Lựa chọn không hợp lệ.")
