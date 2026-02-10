import 'package:flutter/material.dart';

void main() {
  runApp(const PromKaiApp());
}

Widget promKaiLogo({
  double size = 50,
  Color borderColor = Colors.black,
}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: borderColor, width: 2),
      color: Colors.white,
    ),
    child: ClipOval(
      child: Image.asset(
        'web/icons/karbkarb.jpg',
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            Icon(Icons.fastfood, size: size * 0.8),
      ),
    ),
  );
}

// ==========================================
// 0. ส่วนเก็บข้อมูลตะกร้า (Cart Data)
// ==========================================
class CartData {
  static List<Map<String, dynamic>> items = [];

  static void addItem({
    required String name,
    required int price,
    required List<String> options,
  }) {
    items.add({
      "name": name,
      "price": price,
      "options": options,
    });
  }

  static int totalPrice() {
    int total = 0;
    for (var item in items) {
      total += item["price"] as int;
    }
    return total;
  }

  static void clear() {
    items.clear();
  }
}

class PromKaiApp extends StatelessWidget {
  const PromKaiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PromKai',
      debugShowCheckedModeBanner: false,
      // ==================================================================
      // ส่วนตั้งค่าธีมหลัก (แก้ไขตรงนี้เพื่อให้แถบบนเป็นสีเหลือง)
      // ==================================================================
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFFDE7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      // ==================================================================

      initialRoute: '/screen1',
      routes: {
        '/screen1': (context) => const Screen1Logo(),
        '/screen2': (context) => const Screen2RegLog(),
        '/screen3': (context) => const Screen3SignUp(),
        '/screen4': (context) => const Screen4LogIn(),
        '/screen5': (context) => const Screen5Main(),
        '/screen6': (context) => const Screen6Search(),
        '/screenCart': (context) => const ScreenCartList(),
        '/screen9': (context) => const Screen9OrderType(),
        '/screen10': (context) => const Screen10StoreQueue(),
        '/screen11': (context) => const Screen11DeliveryStatus(),
        '/screen12': (context) => const Screen12Notification(),
        '/screen13': (context) => const Screen13Payment(),
        '/screen14': (context) => const Screen14Chat(),
        '/screen15': (context) => const Screen15Review(),
      },
    );
  }
}

// ------------------------------------------------------------------
// หน้า 1: Logo App
// ------------------------------------------------------------------
class Screen1Logo extends StatelessWidget {
  const Screen1Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF59D),
      body: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/screen2'),
        child: Center(
          child: Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 3, color: Colors.black),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'web/icons/karbkarb.jpg',
          fit: BoxFit.cover,
        ),
      ),
    ),
    const SizedBox(height: 20),
    const Text(
      "ก๊าบ-ก๊าบ",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    ),
    const Text(
      "Fried Chicken",
      style: TextStyle(
        fontSize: 16,
        fontStyle: FontStyle.italic,
      ),
    ),
  ],
),

        ),
      ),
    );
  }
}

// ------------------------------------------------------------------
// หน้า 2: Register / Login
// ------------------------------------------------------------------
class Screen2RegLog extends StatelessWidget {
  const Screen2RegLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
  radius: 30,
  backgroundColor: Colors.white,
  child: promKaiLogo(size: 50),
),

                  
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 2, color: Colors.black)),
                  onPressed: () => Navigator.pushNamed(context, '/screen4'),
                  child: const Text("LOG IN",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(width: 2, color: Colors.black)),
                  onPressed: () => Navigator.pushNamed(context, '/screen3'),
                  child: const Text("SIGN UP",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------------
// หน้า 3: Sign Up
// ------------------------------------------------------------------
class Screen3SignUp extends StatelessWidget {
  const Screen3SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: "Username")),
            const SizedBox(height: 10),
            const TextField(decoration: InputDecoration(labelText: "Password")),
            const SizedBox(height: 10),
            const TextField(
                decoration: InputDecoration(labelText: "Confirm Pass")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, foregroundColor: Colors.white),
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------------
// หน้า 4: Log In
// ------------------------------------------------------------------
class Screen4LogIn extends StatelessWidget {
  const Screen4LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Log In")),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
  radius: 30,
  backgroundColor: Colors.white,
  child: promKaiLogo(size: 50),
),

            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(labelText: "Username")),
            const SizedBox(height: 10),
            const TextField(decoration: InputDecoration(labelText: "Password")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/screen5'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, foregroundColor: Colors.white),
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------------
// หน้า 5: Main Template
// ------------------------------------------------------------------
class Screen5Main extends StatefulWidget {
  const Screen5Main({super.key});

  @override
  State<Screen5Main> createState() => _Screen5MainState();
}

class _Screen5MainState extends State<Screen5Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Row(...) // เอา Row ออกเพื่อให้ title อยู่ตรงกลางตาม theme
        title: const Text("ร้านก๊าบ-ก๊าบ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        leading: Padding(
  padding: const EdgeInsets.all(8.0),
  child: promKaiLogo(size: 35, borderColor: Colors.white),
),

        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text("ข้อมูลผู้ใช้"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.account_circle,
                                size: 60, color: Colors.green),
                            SizedBox(height: 10),
                            Text("ชื่อ: User",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("สถานะ: สมาชิกทั่วไป"),
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("ปิด")),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushReplacementNamed(
                                    context, '/screen2');
                              },
                              child: const Text("ออกจากระบบ",
                                  style: TextStyle(color: Colors.red))),
                        ],
                      ));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  color: Colors
                      .white, // เปลี่ยนพื้นหลังป้ายชื่อเป็นสีขาวให้เด่นบนพื้นเหลือง
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green, width: 2)),
              child: Row(
                children: const [
                  Icon(Icons.person, size: 18, color: Colors.green),
                  SizedBox(width: 5),
                  Text("User",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 5),
          IconButton(
            icon: const Icon(Icons.notifications_active,
                color: Colors.black), // ไอคอนกระดิ่งสีดำ
            onPressed: () => Navigator.pushNamed(context, '/screen12'),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/screen6'),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(children: const [
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Text("ค้นหาเมนู")
                ]),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.orange[50]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("PROMOTION",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.red)),
                Text("ลดกระหน่ำ ซัมเมอร์เซล!", style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.all(10), child: Text("เมนูแนะนำ"))),
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem(context, "ไก่ทอดเกาหลี", 159),
                _buildMenuItem(context, "ไก่วิงซ์แซ่บ", 89),
                _buildMenuItem(context, "ไก่แจ้", 199),
                _buildMenuItem(context, "ไก่ชน", 12999),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/screenCart').then((_) {
                setState(() {});
              });
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.shopping_basket),
                  Text("รายการในตะกร้า ${CartData.items.length}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const Icon(Icons.arrow_forward)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String name, int price) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Screen7MenuDetail(
              menuName: name,
              menuPrice: price,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(width: 50, height: 50, color: Colors.grey[300]),
            const SizedBox(width: 10),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(name), Text("ราคา $price ฿")]),
            const Spacer(),
            const Icon(Icons.add_circle_outline)
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------------
// หน้า 6: Search
// ------------------------------------------------------------------
class Screen6Search extends StatefulWidget {
  const Screen6Search({super.key});

  @override
  State<Screen6Search> createState() => _Screen6SearchState();
}

class _Screen6SearchState extends State<Screen6Search> {
  final List<Map<String, dynamic>> _allMenu = [
    {"name": "ไก่ทอดเกาหลี", "price": 159},
    {"name": "ไก่วิงซ์แซ่บ", "price": 89},
    {"name": "ไก่เทอริยากิ", "price": 79},
    {"name": "ไก่ย่างถ่าน", "price": 129},
    {"name": "ข้าวยำไก่แซ่บ", "price": 69},
    {"name": "นักเก็ตไก่", "price": 59},
    {"name": "เฟรนช์ฟรายส์", "price": 49},
    {"name": "หมา", "price": 499},
  ];

  List<Map<String, dynamic>> _foundMenu = [];

  @override
  void initState() {
    _foundMenu = _allMenu;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allMenu;
    } else {
      results = _allMenu
          .where((menu) =>
              menu["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundMenu = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ค้นหา"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 30),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "พิมพ์ชื่อเมนู (เช่น ไก่, วิงซ์)..."),
            ),
          ),
          Expanded(
            child: _foundMenu.isNotEmpty
                ? ListView.builder(
                    itemCount: _foundMenu.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        ListTile(
                          title: Text(_foundMenu[index]['name']),
                          subtitle:
                              Text("ราคา ${_foundMenu[index]['price']} ฿"),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Screen7MenuDetail(
                                  menuName: _foundMenu[index]['name'],
                                  menuPrice: _foundMenu[index]['price'],
                                ),
                              ),
                            );
                          },
                        ),
                        const Divider(thickness: 1),
                      ],
                    ),
                  )
                : const Center(
                    child: Text('ไม่พบเมนูที่ค้นหา',
                        style: TextStyle(fontSize: 20))),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------------
// หน้า 7: Menu Detail
// ------------------------------------------------------------------
class Screen7MenuDetail extends StatelessWidget {
  final String menuName;
  final int menuPrice;

  const Screen7MenuDetail({
    super.key,
    required this.menuName,
    required this.menuPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("รายละเอียด")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(width: 2)),
              child: Center(child: Text(menuName)),
            ),
            const SizedBox(height: 20),
            Text(
              "$menuName ราคา $menuPrice ฿",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Screen8Customize(
                        menuName: menuName,
                        basePrice: menuPrice,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text("เลือกตัวเลือก (ไปปรับแต่ง)"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------------
// หน้า 8: Customize
// ------------------------------------------------------------------
class Screen8Customize extends StatefulWidget {
  final String menuName;
  final int basePrice;

  const Screen8Customize({
    super.key,
    required this.menuName,
    required this.basePrice,
  });

  @override
  State<Screen8Customize> createState() => _Screen8CustomizeState();
}

class _Screen8CustomizeState extends State<Screen8Customize> {
  bool _spicyLittle = false;
  bool _spicyLot = false;
  bool _addRice = false;
  bool _noVeg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ตัวเลือกเพิ่มเติม")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              widget.menuName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildCheckbox("เผ็ดน้อย", _spicyLittle,
                (v) => setState(() => _spicyLittle = v!)),
            _buildCheckbox(
                "เผ็ดมาก", _spicyLot, (v) => setState(() => _spicyLot = v!)),
            _buildCheckbox("เพิ่มข้าว (+10฿)", _addRice,
                (v) => setState(() => _addRice = v!)),
            _buildCheckbox(
                "ไม่เอาผัก", _noVeg, (v) => setState(() => _noVeg = v!)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  List<String> options = [];
                  int finalPrice = widget.basePrice;

                  if (_spicyLittle) options.add("เผ็ดน้อย");
                  if (_spicyLot) options.add("เผ็ดมาก");
                  if (_addRice) {
                    options.add("เพิ่มข้าว");
                    finalPrice += 10;
                  }
                  if (_noVeg) options.add("ไม่เอาผัก");

                  CartData.addItem(
                    name: widget.menuName,
                    price: finalPrice,
                    options: options,
                  );

                  Navigator.popUntil(context, ModalRoute.withName('/screen5'));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white),
                child: const Text("เพิ่มลงตะกร้า"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCheckbox(String title, bool val, Function(bool?) onChanged) {
    return CheckboxListTile(
      title: Text(title),
      value: val,
      onChanged: onChanged,
    );
  }
}

// ------------------------------------------------------------------
// หน้า ScreenCartList
// ------------------------------------------------------------------
class ScreenCartList extends StatefulWidget {
  const ScreenCartList({super.key});

  @override
  State<ScreenCartList> createState() => _ScreenCartListState();
}

class _ScreenCartListState extends State<ScreenCartList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ตะกร้าของฉัน")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("เมนูที่ท่านเลือก",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CartData.items.isEmpty
                    ? const Center(child: Text("ยังไม่มีสินค้าในตะกร้า"))
                    : ListView.builder(
                        itemCount: CartData.items.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5)),
                            child: ListTile(
                              title: Text(CartData.items[index]['name']),
                              subtitle: Text(
                                (CartData.items[index]['options'] as List)
                                        .isEmpty
                                    ? "ไม่มีตัวเลือก"
                                    : (CartData.items[index]['options'] as List)
                                        .join(", "),
                              ),
                              trailing:
                                  Text("${CartData.items[index]['price']} ฿"),
                            ),
                          );
                        },
                      ),
              ),
            ),
            Text(
              "รวมทั้งหมด ${CartData.totalPrice()} ฿",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: CartData.items.isEmpty
                    ? null
                    : () {
                        Navigator.pushNamed(context, '/screen9');
                      },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white),
                child: const Text("ยืนยันการสั่งซื้อ"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ------------------------------------------------------------------
// หน้า 9: เลือกวิธีรับ
// ------------------------------------------------------------------
class Screen9OrderType extends StatelessWidget {
  const Screen9OrderType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ยืนยัน")),
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("รับ Order\nแบบใด",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/screen10'),
                    child: const Text("หน้าร้าน"),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/screen13'),
                    child: const Text("Delivery"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------------
// หน้า 10: หน้าร้าน
// ------------------------------------------------------------------
class Screen10StoreQueue extends StatelessWidget {
  const Screen10StoreQueue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "ตอนนี้ท่านอยู่\nคิวที่ : XX",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // 👇 เปลี่ยนจาก Icons.restaurant เป็นโลโก้รูป
              promKaiLogo(size: 80),

              const SizedBox(height: 50),
              const Text(
                "หากได้แล้ว : ติดต่อพนักงาน",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// ------------------------------------------------------------------
// หน้า 11: Delivery Status
// ------------------------------------------------------------------
class Screen11DeliveryStatus extends StatelessWidget {
  const Screen11DeliveryStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Delivery")),
      body: Center(
        child: Container(
          width: 300,
          height: 500,
          decoration: BoxDecoration(
              border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              const Spacer(),
              const Icon(Icons.motorcycle, size: 100),
              const Text("โปรดรอสักครู่ อาหารกำลัง\nไป !! ...",
                  textAlign: TextAlign.center),
              const Spacer(),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  children: [
                    const CircleAvatar(child: Icon(Icons.person)),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("ชื่อ : นายสมชาย"),
                        Text("เบอร์ : 09x-xxx-xxxx")
                      ],
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/screen14'),
                  child: const Text("Chat Rider")),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------------
// หน้า 12: Notification
// ------------------------------------------------------------------
class Screen12Notification extends StatelessWidget {
  const Screen12Notification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notification")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(border: Border.all(width: 2)),
          child: ListView(
            children: const [
              ListTile(
                  title: Text("Notification"),
                  subtitle: Divider(thickness: 2, color: Colors.black)),
              ListTile(title: Text("ท่านได้รับอาหารแล้ว")),
              Divider(),
              ListTile(title: Text("โปรโมชั่นใหม่มาแล้ว")),
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------------
// หน้า 13: ชำระเงิน
// ------------------------------------------------------------------
class Screen13Payment extends StatefulWidget {
  const Screen13Payment({super.key});

  @override
  State<Screen13Payment> createState() => _Screen13PaymentState();
}

class _Screen13PaymentState extends State<Screen13Payment> {
  int _selectedPaymentMethod = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ชำระเงิน")),
      body: Center(
        child: Container(
          width: 300,
          height: 520,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("ช่องทางการชำระเงิน",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              RadioListTile<int>(
                title: const Text("PromptPay", style: TextStyle(fontSize: 18)),
                value: 1,
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
                activeColor: Colors.black,
                contentPadding: EdgeInsets.zero,
              ),
              if (_selectedPaymentMethod == 1)
                Container(
                  margin: const EdgeInsets.only(left: 35, top: 10, bottom: 20),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(border: Border.all()),
                  child: Row(
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          color: Colors.black12,
                          child: const Center(child: Text("QR"))),
                      const SizedBox(width: 10),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("เบอร์ : 09x-xx"),
                            Text("ชื่อ : นายสมดี")
                          ])
                    ],
                  ),
                ),
              RadioListTile<int>(
                title: const Text("จ่ายเงินสด", style: TextStyle(fontSize: 18)),
                value: 2,
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
                activeColor: Colors.black,
                contentPadding: EdgeInsets.zero,
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    CartData.clear();
                    Navigator.pushNamed(context, '/screen11');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white),
                  child: const Text("ยืนยัน"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------------------------------------------------------
// หน้า 14: Chat Rider
// ------------------------------------------------------------------
class Screen14Chat extends StatelessWidget {
  const Screen14Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat Rider")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(border: Border.all(width: 2)),
              child: Stack(
                children: const [
                  Positioned(
                    left: 10,
                    top: 50,
                    child: Chip(label: Text("กำลังไปจ๊ะ")),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.send),
                    hintText: "พิมพ์ข้อความ...")),
          ),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/screen15'),
              child: const Text("รับของแล้ว (ไปรีวิว)"))
        ],
      ),
    );
  }
}

// ------------------------------------------------------------------
// หน้า 15: รีวิว
// ------------------------------------------------------------------
class Screen15Review extends StatefulWidget {
  const Screen15Review({super.key});

  @override
  State<Screen15Review> createState() => _Screen15ReviewState();
}

class _Screen15ReviewState extends State<Screen15Review> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 500,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.circle_outlined, size: 50)),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  children: [
                    const Text("ให้คะแนนร้าน"),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return IconButton(
                          onPressed: () {
                            setState(() {
                              _rating = index + 1;
                            });
                          },
                          icon: Icon(
                            index < _rating ? Icons.star : Icons.star_border,
                            size: 35,
                            color: index < _rating ? Colors.amber : Colors.grey,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const TextField(decoration: InputDecoration(hintText: "COMMENT")),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/screen5', (route) => false),
                child: const Text("ส่งความเห็น"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
