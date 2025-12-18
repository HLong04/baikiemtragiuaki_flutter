import 'package:flutter/material.dart';
import 'package:labtonghop/bai3.dart';
import 'package:labtonghop/bai4.dart';
import 'package:labtonghop/bai2.dart';
import 'package:labtonghop/bai5_01.dart';
import 'package:labtonghop/bai5_02.dart';
import 'package:labtonghop/bai5_03.dart';
import 'package:labtonghop/bai6_01.dart';
import 'package:labtonghop/bai6_02.dart';
import 'package:labtonghop/bai6_03.dart';
import 'package:labtonghop/bai6_04.dart';
import 'package:labtonghop/bai7.dart';
import 'package:labtonghop/bai8_01.dart';
import 'package:labtonghop/login.dart';
import 'package:labtonghop/model/user.dart';
import 'package:labtonghop/myprofile.dart';
import 'package:labtonghop/bai1.dart';

class MyHomeWork extends StatefulWidget {
  final User user;
  const MyHomeWork({super.key, required this.user});

  @override
  State<MyHomeWork> createState() => _MyHomeWorkState();
}

class _MyHomeWorkState extends State<MyHomeWork> {
  // Mặc định chọn index 0 (Là trang chủ mình tự thêm vào)
  int _selectedIndex = 0;

  // Mình thêm "Trang Chủ" vào đầu danh sách để hiển thị khi mới login
  late final List<Map<String, dynamic>> _dsBaiTap;

  @override
  void initState() {
    super.initState();
    _dsBaiTap = [
      // Index 0: Trang chủ
      {
        'title': 'Trang Chủ',
        'content': _buildWelcomeHome(),
        'group': 'Home',
        'icon': Icons.home_rounded, // Icon ngôi nhà
      },

      // --- NHÓM 1: CÁC BÀI TẬP CƠ BẢN (Stateless / UI) ---
      {
        'title': 'Bài 1: MyPlace',
        'content': MyPlace(),
        'group': 'UI Basics',
        'icon': Icons.place, // Icon địa điểm
      },
      {
        'title': 'Bài 2: Exercise 2',
        'content': Myexercise2(),
        'group': 'UI Basics',
        'icon': Icons.widgets, // Icon các khối widget
      },
      {
        'title': 'Bài 3: MyGuide',
        'content': MyGuide(),
        'group': 'UI Basics',
        'icon': Icons.map_outlined, // Icon bản đồ/hướng dẫn
      },
      {
        'title': 'Bài 4: HomePage',
        'content': MyHomePage(),
        'group': 'UI Basics',
        'icon': Icons.web_asset, // Icon giao diện web/app
      },

      // --- NHÓM 2: TEST STATEFUL (Bài 5 - 11) ---
      {
        'title': 'Bài 5: Change Color',
        'content': ChangeColorApp(),
        'group': 'Stateful',
        'icon': Icons.color_lens, // Icon bảng màu
      },
      {
        'title': 'Bài 6: Count App',
        'content': CoutApp(),
        'group': 'Stateful',
        'icon': Icons.plus_one, // Icon số đếm
      },
      {
        'title': 'Bài 7: Time App',
        'content': TimeApp(),
        'group': 'Stateful',
        'icon': Icons.access_time_filled, // Icon đồng hồ
      },
      {
        'title': 'Bài 8: Tính BMI',
        'content': FormTinhBmi(),
        'group': 'Stateful',
        'icon': Icons.monitor_weight, // Icon cân sức khỏe
      },
      {
        'title': 'Bài 9: Register',
        'content': RegisterApp(),
        'group': 'Stateful',
        'icon': Icons.person_add, // Icon thêm người dùng
      },
      {
        'title': 'Bài 10: Login',
        'content': LoginApp(),
        'group': 'Stateful',
        'icon': Icons.login, // Icon đăng nhập
      },


      {
        'title': 'Bài 11: Phản hồi',
        'content': GuiPhanHoi(),
        'group': 'Stateful',
        'icon': Icons.feedback, // Icon phản hồi/tin nhắn
      },

      // --- NHÓM 3: TEST API (Bài 12 - 14) ---
      {
        'title': 'Bài 12: Product API',
        'content': MyProduct(),
        'group': 'API',
        'icon': Icons.shopping_bag, // Icon túi mua sắm
      },
      {
        'title': 'Bài 13: News API',
        'content': MyAppNews01(),
        'group': 'API',
        'icon': Icons.newspaper, // Icon báo chí
      },
      {
        'title': 'Bài 14: Login API',
        'content': MyLogin(),
        'group': 'API',
        'icon': Icons.cloud_done, // Icon kết nối cloud/API
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: Text(
          _dsBaiTap[_selectedIndex]['title'], // Tiêu đề thay đổi theo bài chọn
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 89, 161),
        // Nút Menu (Hamburger) sẽ tự động hiện ra ở đây do có thuộc tính `drawer`
        // iconTheme để chỉnh màu nút menu sang trắng
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: buttomProfile(context, widget.user),
          ),
        ],
      ),

      // DRAWER: Đây là cái menu trượt từ bên trái ra khi nhấn nút trên AppBar
      drawer: Drawer(
        child: Column(
          children: [
            // Phần đầu của Menu: Hiển thị thông tin User
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 2, 40, 71),
              ),
              accountName: Text(
                "${widget.user.firstName} ${widget.user.lastName}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(widget.user.email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(widget.user.image),
              ),
            ),
            // Phần danh sách bài tập
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: _dsBaiTap.length,
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return _buildDrawerItem(index);
                },
              ),
            ),
          ],
        ),
      ),

      // BODY: Hiển thị nội dung bài tập được chọn
      body: _dsBaiTap[_selectedIndex]['content'],
    );
  }

  // Widget xây dựng từng dòng trong Menu Drawer
  Widget _buildDrawerItem(int index) {
    bool isSelected = _selectedIndex == index;
    return ListTile(
      tileColor: isSelected
          ? Colors.blue.withOpacity(0.1)
          : null, // Tô màu nếu đang chọn
      leading: Icon(Icons.book, color: isSelected ? Colors.blue : Colors.grey),
      title: Text(
        _dsBaiTap[index]['title'],
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Colors.blue : Colors.black87,
        ),
      ),
      onTap: () {
        // Khi chọn bài:
        setState(() {
          _selectedIndex = index;
        });
        Navigator.pop(context);
      },
    );
  }

  // Trang chủ mặc định khi mới vào
  Widget _buildWelcomeHome() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home_work_outlined, size: 100, color: Colors.blueAccent),
          const SizedBox(height: 20),
          Text(
            "Xin chào ${widget.user.firstName} ${widget.user.lastName}!",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Nhấn vào menu bên trái để chọn bài tập",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Nút Profile bên phải AppBar (giữ nguyên của bạn)
  Widget buttomProfile(BuildContext context, User u) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyProfile(user: u)),
        );
      },
      child: CircleAvatar(radius: 20, backgroundImage: NetworkImage(u.image)),
    );
  }
}
