import 'package:flutter/material.dart';
import 'package:labtonghop/model/product.dart';

class CheckoutPage extends StatelessWidget {
  final List<Product> products;

  const CheckoutPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    double subTotal = products.fold(0, (sum, item) => sum + (item.price ?? 0));
    double shippingFee = 2.0;
    double total = subTotal + shippingFee;

    return Scaffold(
      appBar: AppBar(title: const Text("Thanh toán")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Địa chỉ nhận hàng",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Nguyễn Văn A | (+84) 987 654 321", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  const Text("Số 123, Đường ABC, Quận XYZ, TP. Hồ Chí Minh", style: TextStyle(color: Colors.black87)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // --- 2. DANH SÁCH SẢN PHẨM ---
            const Text(
              "📦 Sản phẩm đã chọn",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true, // Quan trọng để nằm trong ScrollView
              physics: const NeverScrollableScrollPhysics(), // Tắt cuộn riêng
              itemCount: products.length,
              itemBuilder: (context, index) {
                final p = products[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(p.image ?? '', width: 50, height: 50, fit: BoxFit.cover),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(p.title ?? '', maxLines: 1, overflow: TextOverflow.ellipsis),
                            Text("${p.price}\$", style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const Text("x1", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // --- 3. PHƯƠNG THỨC THANH TOÁN ---
            const Text(
              "💳 Phương thức thanh toán",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  RadioListTile(
                    value: 1,
                    groupValue: 1, // Mặc định chọn cái này
                    onChanged: (val) {},
                    title: const Text("Thanh toán khi nhận hàng (COD)"),
                    activeColor: Colors.deepOrange,
                    contentPadding: EdgeInsets.zero,
                  ),
                  const Divider(height: 1),
                  RadioListTile(
                    value: 2,
                    groupValue: 1,
                    onChanged: (val) {},
                    title: const Text("Thẻ tín dụng / Ghi nợ"),
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // --- 4. CHI TIẾT THANH TOÁN ---
            const Text("📄 Chi tiết thanh toán", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildSummaryRow("Tổng tiền hàng", "${subTotal.toStringAsFixed(2)}\$"),
            _buildSummaryRow("Phí vận chuyển", "${shippingFee.toStringAsFixed(2)}\$"),
            const Divider(),
            _buildSummaryRow(
                "Tổng thanh toán",
                "${total.toStringAsFixed(2)}\$",
                isTotal: true
            ),
            const SizedBox(height: 80), // Khoảng trống để không bị nút che
          ],
        ),
      ),

      // --- NÚT ĐẶT HÀNG ---
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, -5))
        ]),
        child: ElevatedButton(
          onPressed: () {
            // --- XỬ LÝ ĐẶT HÀNG THÀNH CÔNG ---
            // 1. Xóa các sản phẩm đã mua khỏi giỏ hàng gốc
            for (var p in products) {
              myCart.remove(p);
            }

            // 2. Hiển thị thông báo thành công
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) => AlertDialog(
                title: const Column(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 50),
                    SizedBox(height: 10),
                    Text("Đặt hàng thành công!"),
                  ],
                ),
                content: const Text("Cảm ơn bạn đã mua sắm. Đơn hàng đang được xử lý."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(); // Tắt popup
                      Navigator.of(context).pop(); // Quay về trang giỏ hàng
                    },
                    child: const Text("OK"),
                  )
                ],
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
          child: Text(
            "ĐẶT HÀNG (${total.toStringAsFixed(2)}\$)",
            style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              label,
              style: TextStyle(
                  fontSize: isTotal ? 16 : 14,
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal
              )
          ),
          Text(
              value,
              style: TextStyle(
                  fontSize: isTotal ? 18 : 14,
                  fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                  color: isTotal ? Colors.deepOrange : Colors.black
              )
          ),
        ],
      ),
    );
  }
}