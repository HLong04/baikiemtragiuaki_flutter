import 'package:flutter/material.dart';
import 'package:labtonghop/api.dart';
import 'package:labtonghop/detailproduct.dart';
import 'package:labtonghop/model/product.dart';
import 'package:labtonghop/mycart.dart';
import 'package:labtonghop/global_var.dart'; // Import file chứa myCart

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  // 1. BIẾN LƯU TỪ KHÓA TÌM KIẾM
  String keySearch = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: tabBar()),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: MyAPI.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Lỗi: ${snapshot.error}"));
          } else if (snapshot.hasData) {

            // 2. LOGIC LỌC SẢN PHẨM Ở ĐÂY
            List<Product> listGoc = snapshot.data!;

            List<Product> listHienThi = listGoc.where((p) {
              // Lấy tên sản phẩm, chuyển về chữ thường để so sánh
              final title = p.title?.toLowerCase() ?? "";
              final search = keySearch.toLowerCase();
              return title.contains(search);
            }).toList();

            if (listHienThi.isEmpty) {
              return const Center(child: Text("Không tìm thấy sản phẩm nào"));
            }

            return myListProduct(listHienThi); // Hiển thị list đã lọc
          } else {
            return const Center(child: Text("Không có dữ liệu"));
          }
        },
      ),
    );
  }

  Widget myListProduct(List<Product> ls) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.62,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: ls.length,
      itemBuilder: (context, red) {
        return myProduct(context, ls[red]);
      },
    );
  }

  Widget myProduct(BuildContext context, Product p) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyDetailProduct(product: p),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    p.image ?? '',
                    width: double.infinity,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              p.title ?? 'No Name',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            danhGia(p),
            const SizedBox(height: 10),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${p.price ?? 0}\$",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Đã bán ${p.rating?.count ?? 0}k+",
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // --- HÀM TABBAR ĐÃ SỬA ĐỂ NHẬP LIỆU ---
  Widget tabBar() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey, size: 20),
                  const SizedBox(width: 8),

                  // 3. THAY TEXT CỐ ĐỊNH BẰNG TEXTFIELD ĐỂ NHẬP
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        // Khi gõ phím -> Cập nhật keySearch -> Build lại UI
                        setState(() {
                          keySearch = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Tìm kiếm...',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                        border: InputBorder.none, // Bỏ viền gạch dưới
                        contentPadding: EdgeInsets.only(bottom: 12), // Căn chỉnh chữ
                      ),
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),

                  // Nút xóa text (hiện khi có chữ)
                  if (keySearch.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          keySearch = ""; // Xóa từ khóa
                        });
                      },
                      child: const Icon(Icons.close, color: Colors.grey, size: 18),
                    )
                  else
                    const Icon(Icons.camera_alt, color: Colors.grey, size: 20),
                ],
              ),
            ),
          ),

          const SizedBox(width: 15),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 26),
                if (myCart.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
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
          const Icon(Icons.chat_outlined, color: Colors.white, size: 26),
        ],
      ),
    );
  }

  Widget danhGia(Product p) {
    return Row(
      children: [
        if ((p.price ?? 0) <= 50.0) ...[
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepOrange),
              borderRadius: BorderRadius.circular(5),
              color: Colors.deepOrange.withOpacity(0.2),
            ),
            child: Row(
              children: const [
                Icon((Icons.thumb_up), color: Colors.deepOrange, size: 11),
                SizedBox(width: 3),
                Text(
                  'Rẻ Vô Địch',
                  style: TextStyle(fontSize: 13, color: Colors.deepOrange),
                ),
              ],
            ),
          ),
        ],
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.amberAccent),
            borderRadius: BorderRadius.circular(5),
            color: Colors.amberAccent.withOpacity(0.2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 5),
              Text(
                (p.rating?.rate ?? 0.0).toString(),
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}