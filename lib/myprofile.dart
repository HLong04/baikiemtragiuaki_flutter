import 'package:flutter/material.dart';
import 'package:labtonghop/model/user.dart';

class MyProfile extends StatelessWidget {
  final User user;
  const MyProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    const Color mainBackgroundColor = Color.fromARGB(255, 2, 40, 71);
    const Color appBarColor = Color.fromARGB(255, 0, 89, 161);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "User Profile",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 40, 71),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: mainBackgroundColor,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 10), // Giảm bớt khoảng trống thừa

            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(user.image),
                onBackgroundImageError: (_, __) =>
                const Icon(Icons.person, size: 60, color: Colors.grey),
              ),
            ),

            const SizedBox(height: 15),

            Text(
              "${user.firstName} ${user.lastName}",
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),

            Text(
              "@${user.username}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.8),
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 30),

            // Phần khung trắng bên dưới
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                // --- SỬA Ở ĐÂY: Thêm ClipRRect để khi cuộn nội dung không bị chờm ra khỏi góc bo tròn ---
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),

                  // --- SỬA QUAN TRỌNG NHẤT: Bọc Column bằng SingleChildScrollView ---
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(), // Hiệu ứng cuộn mượt (giống iOS)
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 30,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Personal Information",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: appBarColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildInfoTile("User ID", "${user.id}", Icons.badge),
                          _buildInfoTile("Email", user.email, Icons.email), // Sửa icon Birthday cho hợp lý

                          // Thử thêm vài dòng giả để test cuộn
                          // _buildInfoTile("Address", "Hue City, Vietnam", Icons.location_on),

                          const SizedBox(height: 20),
                        ],
                      ),
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

  Widget _buildInfoTile(String label, String value, IconData icon) {
    const Color primaryColor = Color.fromARGB(255, 0, 89, 161);

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: primaryColor, size: 22),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}