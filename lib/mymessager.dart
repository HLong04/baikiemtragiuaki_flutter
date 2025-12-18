import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dữ liệu giả lập danh sách tin nhắn
    final List<Map<String, dynamic>> messages = [
      {
        "name": "Shop Quần Áo Nam",
        "message": "Dạ áo này bên em còn size L anh nhé!",
        "time": "10:30",
        "avatar": "https://i.pravatar.cc/150?img=1",
        "count": 2, // Số tin chưa đọc
      },
      {
        "name": "Giày Sneaker Chính Hãng",
        "message": "Đơn hàng của bạn đã được giao cho shipper.",
        "time": "Hôm qua",
        "avatar": "https://i.pravatar.cc/150?img=3",
        "count": 0,
      },
      {
        "name": "Phụ Kiện Điện Thoại",
        "message": "Bạn ơi, mẫu ốp lưng này đang giảm giá 50% ạ.",
        "time": "12/10",
        "avatar": "https://i.pravatar.cc/150?img=5",
        "count": 5,
      },
      {
        "name": "Mỹ Phẩm Xách Tay",
        "message": "Cảm ơn bạn đã ủng hộ shop!",
        "time": "10/10",
        "avatar": "https://i.pravatar.cc/150?img=9",
        "count": 0,
      },
      {
        "name": "Đồ Gia Dụng",
        "message": "Bảo hành 12 tháng nhé bạn.",
        "time": "09/10",
        "avatar": "https://i.pravatar.cc/150?img=12",
        "count": 0,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Tin nhắn",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.mark_chat_read_outlined, color: Colors.deepOrange),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.separated(
        itemCount: messages.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = messages[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            onTap: () {
              // Sau này làm trang chi tiết chat thì navigate ở đây
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Đang chat với ${item['name']}")),
              );
            },
            // Ảnh đại diện
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(item['avatar']),
                  onBackgroundImageError: (_, __) => const Icon(Icons.store),
                ),
                // Chấm xanh online (Giả vờ)
                if (index % 2 == 0)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  )
              ],
            ),
            // Tên Shop
            title: Text(
              item['name'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            // Nội dung tin nhắn
            subtitle: Text(
              item['message'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: (item['count'] > 0) ? Colors.black87 : Colors.grey,
                fontWeight: (item['count'] > 0) ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            // Thời gian và số lượng tin chưa đọc
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  item['time'],
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 5),
                if (item['count'] > 0)
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.deepOrange,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "${item['count']}",
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}