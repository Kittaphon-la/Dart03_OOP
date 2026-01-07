// =====================
// Class แม่: Product
// =====================
class Product {
  // private property
  final String _id;

  // public properties
  String name;
  double _price;
  int? stock;

  // constructor (named + required)
  Product({
    required String id,
    required this.name,
    required double price,
    this.stock,
  })  : _id = id,
        _price = price {
    print("New Product created: $id ($name)");
  }

  // getter
  String get id => _id;

  // setter (price > 0 เท่านั้น)
  set price(double value) {
    if (value > 0) {
      _price = value;
    } else {
      print("ราคาไม่ถูกต้อง (ต้อง > 0) -> ไม่เปลี่ยนค่า");
    }
  }

  double get price => _price;

  // =====================
  // Methods
  // =====================

  void applyDiscount(double percent) {
    if (percent >= 0 && percent <= 100) {
      _price = _price * (1 - percent / 100);
    } else {
      print("ส่วนลดต้องอยู่ระหว่าง 0-100");
    }
  }

  void restock(int amount) {
    if (stock == null) {
      stock = 0;
    }
    stock = stock! + amount;
  }

  void showInfo() {
    print("ID: $_id");
    print("Name: $name");
    print("Price: $_price");
    if (stock == null) {
      print("Stock: ยังไม่ระบุสต็อก");
    } else {
      print("Stock: $stock");
    }
  }
}

// =====================
// Class ลูก: DigitalProduct
// =====================
class DigitalProduct extends Product {
  double fileSizeMB;

  DigitalProduct({
    required String id,
    required String name,
    required double price,
    required this.fileSizeMB,
  }) : super(id: id, name: name, price: price);

  @override
  void showInfo() {
    super.showInfo();
    print("Type: Digital");
    print("File Size: $fileSizeMB MB");
  }
}

// =====================
// Class ลูก: FoodProduct
// =====================
class FoodProduct extends Product {
  String expireDate;

  FoodProduct({
    required String id,
    required String name,
    required double price,
    required this.expireDate,
    int? stock,
  }) : super(id: id, name: name, price: price, stock: stock);

  @override
  void showInfo() {
    super.showInfo();
    print("Type: Food");
    print("Expire Date: $expireDate");
  }
}

// =====================
// main()
// =====================
void main() {
  // สร้างสินค้า
  Product p1 = Product(
    id: "P001",
    name: "Notebook",
    price: 50,
  );

  DigitalProduct p2 = DigitalProduct(
    id: "D001",
    name: "E-Book Flutter",
    price: 199,
    fileSizeMB: 120.5,
  );

  FoodProduct p3 = FoodProduct(
    id: "F001",
    name: "Milk",
    price: 25,
    expireDate: "2026-01-10",
    stock: 15,
  );

  // ทดลองพฤติกรรม
  p1.applyDiscount(10); // ลด 10%
  p1.restock(50);       // เพิ่มสต็อก
  p1.price = -100;      // ทดลองตั้งราคาผิด

  // Polymorphism
  List<Product> products = [p1, p2, p3];

  print("----------------");
  for (var product in products) {
    product.showInfo();
    print("----------------");
  }
}
