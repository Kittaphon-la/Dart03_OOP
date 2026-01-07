#Lab Dart03 : OOP ระบบจัดการสินค้า (Product Management System)
โครงการนี้เป็นส่วนหนึ่งของการเรียนรู้ Object-Oriented Programming (OOP) ด้วยภาษา Dart
โดยจำลองระบบจัดการสินค้าอย่างง่าย เพื่อฝึกการใช้งาน
Class / Object
Encapsulation
Inheritance
Polymorphism

วัตถุประสงค์
สร้างระบบจัดการสินค้าที่มีหลายประเภท
ฝึกใช้ private property และ getter / setter
ฝึกการสืบทอดคลาส (Inheritance)
เข้าใจการทำงานของ Polymorphism ผ่าน List<Product>
 โครงสร้างคลาส
1 Product (Class แม่)
ใช้เป็นโครงสร้างหลักของสินค้า

Properties

_id (String) → private

name (String) → public

price (double) → protected ผ่าน setter

stock (int?) → nullable

Constructor

ใช้ required สำหรับ id, name, price

รองรับ stock เป็น null

Methods

applyDiscount(double percent)

ลดราคาตามเปอร์เซ็นต์ (0–100)

restock(int amount)

เพิ่มจำนวนสินค้าใน stock

ถ้า stock เป็น null จะเริ่มจาก 0

showInfo()

แสดงข้อมูลสินค้า

ถ้า stock เป็น null จะแสดง “ยังไม่ระบุสต็อก”

Getter / Setter

getter: id

setter: price

รับค่าเฉพาะมากกว่า 0 เท่านั้น

หากไม่ถูกต้อง จะไม่เปลี่ยนค่าและแสดงข้อความเตือน

2️ DigitalProduct (extends Product)

ใช้สำหรับสินค้าแบบดิจิทัล

Property เพิ่มเติม

fileSizeMB (double) → required

Override Method

showInfo()

แสดงประเภทสินค้าเป็น “Digital”

แสดงขนาดไฟล์ (MB)

3️ FoodProduct (extends Product)

ใช้สำหรับสินค้าอาหาร

Property เพิ่มเติม

expireDate (String) → required (รูปแบบ YYYY-MM-DD)

Override Method

showInfo()

แสดงประเภทสินค้าเป็น “Food”

แสดงวันหมดอายุ

 Polymorphism

ในฟังก์ชัน main()
มีการเก็บวัตถุจากหลายคลาสไว้ใน

List<Product>


แล้ววนลูปเรียก showInfo()
เพื่อแสดงให้เห็นการทำงานของ Polymorphism
ซึ่งแต่ละ object จะเรียก method ของคลาสตัวเอง

ตัวอย่างการทำงานของโปรแกรม

สร้างสินค้า 3 ประเภท (Product, DigitalProduct, FoodProduct)

ลดราคาสินค้า 10%

เพิ่ม stock +50

ทดลองตั้งราคาติดลบ (ระบบป้องกัน)

แสดงข้อมูลสินค้าทั้งหมด

<img width="700" height="564" alt="image" src="https://github.com/user-attachments/assets/2f648f1c-e839-4e85-8962-8969570bc0e4" />
