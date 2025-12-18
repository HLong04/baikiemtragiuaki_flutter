import 'package:flutter/material.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Form Đăng Nhập",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),

        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Tên người dùng',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ), // Bạn có thể thay đổi số 12
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tên người dùng';
                  }
                  return null;
                },
              ),

              SizedBox(height: 50),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Mật khẩu',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ), // Bạn có thể thay đổi số 12
                  ),
                  suffixIcon: Icon(Icons.visibility),
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
              SizedBox(height: 50),

              Center(
                child: ElevatedButton(
                  onPressed: _loginapp,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    minimumSize: Size(140, 40), // làm nút nhỏ lại
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.login, size: 20),
                      SizedBox(width: 8),
                      Text("Đăng nhập", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
