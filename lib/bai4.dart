import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return SizedBox(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 20),
          scrollDirection: Axis.vertical,
          children: [
            searchbar(),
            menuBar(),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: const Text("757 chỗ nghỉ", style: TextStyle(fontSize: 16)),
            ),

            // --- DÙNG WIDGET CHUNG (GỌN GÀNG & KHÔNG LỖI) ---
            const HotelItemCard(
              name: "aNhiLL Boutique",
              image: "KhoAnh/pexels-thgusstavo-2102587.jpg",
              ratingScore: "9,5",
              ratingText: "Xuất sắc",
              reviewCount: "95",
              distance: "0,6km",
              price: "US109",
              description: "1 suite riêng tư: 1 giường",
            ),
            const HotelItemCard(
              name: "An Nam Hue Boutique",
              image: "KhoAnh/pexels-alona-kim-2156628507-34529942.jpg",
              ratingScore: "9,2",
              ratingText: "Tuyệt hảo",
              reviewCount: "34",
              distance: "0,9km",
              price: "US20",
              description: "1 phòng khách sạn: 1 giường",
            ),
            const HotelItemCard(
              name: "Huế Jade Hill Villa",
              image: "KhoAnh/pexels-taryn-elliott-4502973.jpg",
              ratingScore: "8,0",
              ratingText: "Rất tốt",
              reviewCount: "1",
              distance: "1,3km",
              price: "US285",
              // Dòng này dài nhất, nguyên nhân gây lỗi 54px cũ
              description:
              "1 biệt thự nguyên căn - 1.000 m2\n4 giường . 3 phòng ngủ . 1 phòng khách",
              specialNote: "Chỉ còn 1 căn với giá này trên Booking.com",
              isFreeCancellation: true,
            ),
            const HotelItemCard(
              name: "Êm Villa",
              image: "KhoAnh/pexels-benprater-34473149.jpg",
              ratingScore: "10",
              ratingText: "Tuyệt cú mèo",
              reviewCount: "10",
              distance: "1km",
              price: "US150",
              description: "1 phòng khách sạn: 1 giường",
            ),
          ],
        ),
      ),
    );
  }

  // --- CÁC WIDGET PHỤ GIỮ NGUYÊN ---
  Widget searchbar() {
    return Container(
      height: 80,
      color: const Color.fromARGB(255, 0, 133, 242),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.amber, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(Icons.arrow_back_ios, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Flexible(
                      child: Text(
                        "Xung quanh vị trí hiện tại",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      "23 thg 10 - 24 thg 10",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildMenuItem(Icons.swap_vert, "Sắp xếp"),
          _buildMenuItem(Icons.filter_list, "Bộ lọc"),
          _buildMenuItem(Icons.map_outlined, "Bản đồ"),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 30),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(fontSize: 20)),
      ],
    );
  }
}

class HotelItemCard extends StatelessWidget {
  final String name;
  final String image;
  final String ratingScore;
  final String ratingText;
  final String reviewCount;
  final String distance;
  final String price;
  final String description;
  final String? specialNote;
  final bool isFreeCancellation;

  const HotelItemCard({
    super.key,
    required this.name,
    required this.image,
    required this.ratingScore,
    required this.ratingText,
    required this.reviewCount,
    required this.distance,
    required this.price,
    required this.description,
    this.specialNote,
    this.isFreeCancellation = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- CỘT TRÁI: ẢNH ---
          Container(
            width: 130, // Cố định chiều rộng ảnh
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Bao bữa sáng",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    height: 180, // Chiều cao cố định
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 180,
                      color: Colors.grey[300],
                      child: const Icon(Icons.broken_image, size: 50),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // --- CỘT PHẢI: THÔNG TIN (Dùng Expanded để chiếm phần còn lại) ---
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Tên và Tim
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      // Flexible giúp tên tự xuống dòng nếu dài
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(Icons.favorite_border),
                  ],
                ),

                const SizedBox(height: 5),

                // 2. Sao
                Row(
                  children: List.generate(
                    5,
                        (index) =>
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                  ),
                ),

                const SizedBox(height: 5),

                // 3. Đánh giá (Dùng Wrap thay Row để không bị lỗi 8.9px)
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 80, 142),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        ratingScore,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      ratingText,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ".$reviewCount đánh giá",
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(height: 5),

                // 4. Địa chỉ (Dùng Expanded cho Text)
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.grey, size: 16),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        "Cách bạn $distance",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // 5. Thông tin phòng & Giá (Căn phải)
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Mô tả: Text căn phải, tự xuống dòng
                      Text(
                        description,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 3, // Giới hạn dòng
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Đã bao gồm thuế và phí",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      if (specialNote != null)
                        Text(
                          specialNote!,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      if (isFreeCancellation)
                        Row(
                          mainAxisSize:
                          MainAxisSize.min, // Chỉ chiếm diện tích cần thiết
                          children: const [
                            Icon(Icons.check, size: 16, color: Colors.green),
                            SizedBox(width: 4),
                            Text(
                              "Không cần thanh toán trước",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
