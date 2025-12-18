import 'package:flutter/material.dart';

class GuiPhanHoi extends StatefulWidget {
  const GuiPhanHoi({super.key});

  @override
  State<GuiPhanHoi> createState() => _GuiPhanHoiState();
}

class _GuiPhanHoiState extends State<GuiPhanHoi> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _starController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  String? _showName;
  String? _showStar;
  String? _showNote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Gửi phản hồi")),
        backgroundColor: const Color.fromARGB(255, 2, 55, 98),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  tabBarHoTen(),
                  SizedBox(height: 16),
                  tabBarDanhGiaSao(),
                  SizedBox(height: 16),
                  tabBarNotep(),
                  SizedBox(height: 16),
                  submitButtonPhanHoi(),
                ],
              ),
            ),

            // =========================
            // KẾT QUẢ HIỂN THỊ BÊN DƯỚI
            // =========================
            SizedBox(height: 24),
            if (_showName != null) ...[
              Text("Họ tên: $_showName", style: TextStyle(fontSize: 18)),
              Text("Số sao: $_showStar", style: TextStyle(fontSize: 18)),
              Text(
                "Nội dung góp ý: $_showNote",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget tabBarHoTen() {
    return TextFormField(
      controller: _nameController,
      decoration: InputDecoration(
        labelText: "Họ tên",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) =>
          value == null || value.isEmpty ? "Vui lòng nhập họ tên" : null,
    );
  }

  Widget tabBarDanhGiaSao() {
    return TextFormField(
      controller: _starController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.star),
        labelText: "Đánh giá (1 - 5 sao)",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) =>
          value == null || value.isEmpty ? "Vui lòng nhập số sao" : null,
    );
  }

  Widget tabBarNotep() {
    return TextFormField(
      controller: _noteController,
      maxLines: 5, // làm ô cao lên
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.note, size: 28),
        labelText: "Nội dung góp ý",
        labelStyle: TextStyle(fontSize: 18),
        contentPadding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ), // padding làm ô to hẳn
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
      style: TextStyle(fontSize: 18),
      validator: (value) =>
          value == null || value.isEmpty ? "Vui lòng nhập nội dung" : null,
    );
  }

  Widget submitButtonPhanHoi() {
    return SizedBox(
      width: 170,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            setState(() {
              _showName = _nameController.text;
              _showStar = _starController.text;
              _showNote = _noteController.text;
            });
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.send),
            SizedBox(width: 6),
            Text("Gửi phản hồi"),
          ],
        ),
      ),
    );
  }
}
