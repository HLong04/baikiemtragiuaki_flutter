import 'package:flutter/material.dart';
import 'package:labtonghop/checkout.dart';
import 'package:labtonghop/model/product.dart';
import 'package:labtonghop/mycart.dart';
// Import CartPage và biến myCart ở đây

class MyDetailProduct extends StatelessWidget {
  final Product product;
  const MyDetailProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          tabBar(context),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(product.image ?? '', fit: BoxFit.contain),
              ),
              SizedBox(height: 20),
              Text(
                "${product.price ?? 0}\$",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              SizedBox(height: 10),
              Text(
                product.title ?? '',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              // Mô tả
              Text(
                product.description ?? 'Không có mô tả',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIconBtn(Icons.chat_outlined, "Chat", () {
                    print("Bấm vào Chat");
                  }),

                  Container(width: 1, height: 30, color: Colors.grey[300]),

                  _buildIconBtn(Icons.add_shopping_cart, "Thêm giỏ", () {
                    addToCart(context);
                  }),
                ],
              ),
            ),

            Expanded(
              flex: 1,
              child: Material(
                color: Colors.deepOrange,
                child: InkWell(
                  onTap: () {
                    // --- SỬA LẠI ĐOẠN NÀY ---
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // CheckoutPage cần 1 List, nên ta để product vào trong ngoặc vuông []
                        builder: (context) => CheckoutPage(products: [product]),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text( // Thêm const cho tối ưu
                          "Mua ngay",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${product.price ?? 0}\$",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 1. Hàm tạo nút icon nhỏ bên trái (Chat/Cart)
  Widget _buildIconBtn(IconData icon, String label, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black54, size: 22),
          SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(fontSize: 10, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  void addToCart(BuildContext context) {
    myCart.add(product);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Đã thêm ${product.title} vào giỏ!"),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating, // Nổi lên trên cho đẹp
        action: SnackBarAction(
          label: "Xem giỏ",
          textColor: Colors.yellow,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const CartPage()));
          },
        ),
      ),
    );
  }

  Widget tabBar(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.share, color: Colors.black, size: 26),
        SizedBox(width: 15),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 26),
              if (myCart.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  constraints: BoxConstraints(minWidth: 16, minHeight: 16),
                  child: Text(
                    '${myCart.length}',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(width: 15),
        const Icon(Icons.more_vert, color: Colors.black, size: 26),
      ],
    );
  }
}