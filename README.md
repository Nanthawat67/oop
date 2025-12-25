# Lab Dart03 – Product Management System

โปรเจกต์นี้เป็นส่วนหนึ่งของรายวิชา Lab Dart03  
มีวัตถุประสงค์เพื่อฝึกใช้งาน **Object-Oriented Programming (OOP)** ด้วยภาษา **Dart**  
โดยพัฒนาระบบจัดการสินค้า (Product Management System) แบบง่าย

---

## 🎯 วัตถุประสงค์ของโปรเจกต์
- ฝึกการเขียนโปรแกรมเชิงวัตถุ (OOP) ด้วยภาษา Dart
- เข้าใจหลักการ Encapsulation, Inheritance และ Polymorphism
- สามารถออกแบบ class และจัดการข้อมูลสินค้าได้อย่างเป็นระบบ

---

## 🛠 ความสามารถของระบบ
- สร้างสินค้าได้หลายประเภท
- แสดงข้อมูลสินค้า
- ปรับราคาและให้ส่วนลดสินค้า
- จัดการสต็อกสินค้า (เพิ่ม / ลด)
- รองรับการขยายประเภทสินค้าในอนาคต

---

## 🧩 หลักการ OOP ที่ใช้งาน

### 1. Encapsulation
- ใช้ private variables (`_name`, `_price`, `_stock`)
- เข้าถึงข้อมูลผ่าน getter / setter

### 2. Inheritance
- สร้าง class ย่อยจาก `Product`
  - `ElectronicProduct`
  - `FoodProduct`

### 3. Polymorphism
- ใช้ method `displayInfo()` ที่ถูก override ในแต่ละ subclass

### 4. Abstraction
- ใช้ `abstract class Product` เป็นแม่แบบของสินค้า

---

## 📂 โครงสร้างโปรเจกต์ (ตัวอย่าง)
project/
│
├── main.dart
└── README.md

markdown
คัดลอกโค้ด

---

## ผลลัพล์ที่อยากได้

<img width="253" height="262" alt="image" src="https://github.com/user-attachments/assets/51a3f107-3bce-42f2-80ff-3cbf20248c2f" />

## ▶ วิธีรันโปรแกรม

### วิธีที่ 1: DartPad (ไม่ต้องติดตั้ง)
1. เข้าเว็บไซต์ https://dartpad.dev
2. เลือกโหมด **Dart**
3. วางโค้ดจาก `main.dart`
4. กดปุ่ม ▶ Run

### วิธีที่ 2: รันบนเครื่องคอมพิวเตอร์
1. ติดตั้ง Dart SDK จาก https://dart.dev/get-dart
2. เปิด Terminal หรือ Command Prompt
3. รันคำสั่ง
```bash
// ================= Base Class =================
abstract class Product {
  String _name;
  double _price;
  int _stock;

  Product(this._name, this._price, this._stock);

  // Encapsulation
  String get name => _name;
  double get price => _price;
  int get stock => _stock;

  set price(double newPrice) {
    if (newPrice > 0) {
      _price = newPrice;
    }
  }

  void addStock(int amount) {
    _stock += amount;
  }

  void reduceStock(int amount) {
    if (amount <= _stock) {
      _stock -= amount;
    }
  }

  void applyDiscount(double percent) {
    _price -= _price * (percent / 100);
  }

  // Polymorphism
  void displayInfo();
}

// ================= Subclass =================
class ElectronicProduct extends Product {
  int warrantyYears;

  ElectronicProduct(
    String name,
    double price,
    int stock,
    this.warrantyYears,
  ) : super(name, price, stock);

  @override
  void displayInfo() {
    print('''
สินค้าอิเล็กทรอนิกส์
ชื่อ: $name
ราคา: $price บาท
สต็อก: $stock ชิ้น
ประกัน: $warrantyYears ปี
''');
  }
}

class FoodProduct extends Product {
  String expiryDate;

  FoodProduct(
    String name,
    double price,
    int stock,
    this.expiryDate,
  ) : super(name, price, stock);

  @override
  void displayInfo() {
    print('''
สินค้าอาหาร
ชื่อ: $name
ราคา: $price บาท
สต็อก: $stock ชิ้น
วันหมดอายุ: $expiryDate
''');
  }
}

// ================= Main =================
void main() {
  Product laptop = ElectronicProduct('Laptop', 30000, 5, 2);
  Product milk = FoodProduct('Milk', 25, 20, '30/12/2025');

  laptop.applyDiscount(10);
  milk.addStock(10);

  laptop.displayInfo();
  milk.displayInfo();
}
