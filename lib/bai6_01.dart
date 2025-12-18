import 'package:flutter/material.dart';
import 'package:labtonghop/bai6_03.dart';

class RegisterApp extends StatefulWidget {
  const RegisterApp({super.key});

  @override
  State<RegisterApp> createState() => _RegisterAppState();
}

class _RegisterAppState extends State<RegisterApp> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();

  bool _showPass = false;
  bool _showConfirmPass = false;

  void _doRegister() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Đăng ký thành công")));

      // Tùy chọn: Sau khi đăng ký thành công thì tự động quay về đăng nhập
      // Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView( // Thêm cái này để khi bàn phím hiện lên không bị lỗi che màn hình
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // HỌ TÊN
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Họ và tên",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập họ tên";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                // EMAIL
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập email";
                    }
                    if (!RegExp(
                      r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$",
                    ).hasMatch(value)) {
                      return "Email không hợp lệ";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                // MẬT KHẨU
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_showPass,
                  decoration: InputDecoration(
                    labelText: "Mật khẩu",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showPass ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _showPass = !_showPass;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập mật khẩu";
                    }
                    if (value.length < 6) {
                      return "Mật khẩu phải >= 6 ký tự";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                // XÁC NHẬN MẬT KHẨU
                TextFormField(
                  controller: _confirmPassController,
                  obscureText: !_showConfirmPass,
                  decoration: InputDecoration(
                    labelText: "Xác nhận mật khẩu",
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _showConfirmPass
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _showConfirmPass = !_showConfirmPass;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng xác nhận mật khẩu";
                    }
                    if (value != _passwordController.text) {
                      return "Mật khẩu không trùng khớp";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                Center(
                  child: ElevatedButton(
                    onPressed: _doRegister,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      minimumSize: Size(150, 40),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check),
                        SizedBox(width: 8),
                        Text("Đăng ký", style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // --- PHẦN NÚT QUAY LẠI ĐĂNG NHẬP ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Đã có tài khoản? "),
                    GestureDetector(
                      onTap: () {
                        // Lệnh này sẽ đóng trang Đăng ký và quay lại trang trước đó (Đăng nhập)
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginApp()),
                        );
                      },
                      child: Text(
                        "Đăng nhập ngay",
                        style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20), // Khoảng trống dưới cùng
              ],
            ),
          ),
        ),
      ),
    );
  }
}