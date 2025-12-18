import 'package:flutter/material.dart';
import 'package:labtonghop/checkout.dart';
import 'package:labtonghop/model/product.dart'; // Import trang thanh toán (sẽ tạo ở phần 2)

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final Set<Product> _selectedItems = {};

  @override
  Widget build(BuildContext context) {
    // Tính tổng tiền CHỈ của các sản phẩm ĐƯỢC CHỌN
    double totalAmount = _selectedItems.fold(0.0, (sum, item) => sum + (item.price ?? 0));

    return Scaffold(
      appBar: AppBar(title: const Text("Giỏ hàng của tôi")),
      body: myCart.isEmpty
          ? const Center(child: Text("Giỏ hàng đang trống"))
          : ListView.builder(
        itemCount: myCart.length,
        itemBuilder: (context, index) {
          final product = myCart[index];
          final isSelected = _selectedItems.contains(product);

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              // 1. Checkbox để chọn sản phẩm
              leading: Checkbox(
                value: isSelected,
                activeColor: Colors.deepOrange,
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      _selectedItems.add(product);
                    } else {
                      _selectedItems.remove(product);
                    }
                  });
                },
              ),
              // Hiển thị ảnh nhỏ bên cạnh checkbox
              title: Row(
                children: [
                  Image.network(product.image ?? '', width: 40, height: 40, fit: BoxFit.cover),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      product.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "${product.price}\$",
                  style: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    myCart.removeAt(index);
                    _selectedItems.remove(product); // Xóa cả trong list đã chọn
                  });
                },
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, -5))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Tổng thanh toán:", style: TextStyle(color: Colors.grey)),
                Text(
                  "${totalAmount.toStringAsFixed(2)}\$",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _selectedItems.isEmpty
                  ? null // Disable nút nếu chưa chọn gì
                  : () {
                // Chuyển sang trang thanh toán, truyền danh sách đã chọn qua
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutPage(products: _selectedItems.toList()),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: Text(
                "Mua hàng (${_selectedItems.length})",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}