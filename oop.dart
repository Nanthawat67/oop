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
