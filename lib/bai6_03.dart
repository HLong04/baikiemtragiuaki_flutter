import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labtonghop/bai6_01.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Biến để ẩn/hiện mật khẩu
  bool _obscurePassword = true;

  void _loginapp() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Đăng nhập thành công"),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  // Hàm chuyển sang trang Đăng ký
  void _navigateToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- Ô nhập tên người dùng ---
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  labelText: 'Tên người dùng',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tên người dùng';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20), // Giảm khoảng cách cho đẹp hơn

              // --- Ô nhập mật khẩu ---
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword, // Ẩn mật khẩu
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  labelText: 'Mật khẩu',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  // Nút con mắt để ẩn/hiện mật khẩu
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Mật khẩu không được để trống";
                  }
                  if (value.length < 6) {
                    return "Mật khẩu phải từ 6 ký tự trở lên";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // --- Nút Đăng Nhập ---
              Center(
                child: ElevatedButton(
                  onPressed: _loginapp,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    minimumSize: const Size(140, 40),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.login, size: 20),
                      SizedBox(width: 8),
                      Text("Đăng nhập", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // --- DÒNG LINK ĐĂNG KÝ (PHẦN BẠN CẦN) ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Chưa có tài khoản? "),
                  GestureDetector(
                    onTap: _navigateToRegister,
                    child: const Text(
                      "Đăng ký ngay",
                      style: TextStyle(
                        color: Colors.blue, // Màu link
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline, // Gạch chân cho giống link
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}