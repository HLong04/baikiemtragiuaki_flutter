import 'package:flutter/material.dart';

class CoutApp extends StatefulWidget {
  const CoutApp({super.key});

  @override
  State<CoutApp> createState() => _CoutAppState();
}

class _CoutAppState extends State<CoutApp> {
  int couts = 0;
  void _couttang() {
    setState(() {
      couts++;
    });
  }

  void _coutgiam() {
    setState(() {
      couts--;
    });
  }

  void _coutreset() {
    setState(() {
      couts = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Ứng dụng Đếm Số",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 2, 40, 57),
      ),
      body: Container(
        color: Color.fromARGB(255, 2, 40, 57),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Giá trị hiện tại:",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              couts.toString(),
              style: TextStyle(color: Colors.red, fontSize: 40),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _coutgiam,
                  child: Container(
                    child: Row(
                      children: [Icon(Icons.arrow_downward), Text("Giảm")],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _coutreset,
                  child: Container(
                    child: Row(
                      children: [Icon(Icons.refresh), Text("Đặt lại")],
                    ),
                  ),
                ),
                SizedBox(width: 10),

                ElevatedButton(
                  onPressed: _couttang,
                  child: Container(
                    child: Row(
                      children: [Icon(Icons.arrow_upward), Text("Tăng")],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
