import 'dart:async';

import 'package:flutter/material.dart';

class TimeApp extends StatefulWidget {
  const TimeApp({super.key});

  @override
  State<TimeApp> createState() => _TimeAppState();
}

class _TimeAppState extends State<TimeApp> {
  final TextEditingController _timelist = TextEditingController();
  int _seconds = 0;
  Timer? _timer; // lưu timer để hủy sau này
  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int secs = seconds % 60;
    String minuteStr = minutes.toString().padLeft(2, '0');
    String secondStr = secs.toString().padLeft(2, '0');
    return "$minuteStr:$secondStr";
  }

  void _startCountdown() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }

    setState(() {
      _seconds = int.tryParse(_timelist.text) ?? 0; // lấy giá trị người nhập
    });

    // chỉ chạy khi người nhập số hợp lệ
    if (_seconds > 0) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (_seconds > 0) {
            _seconds--;
          } else {
            timer.cancel();
          }
        });
      });
    }
  }

  void _resetCountdown() {
    _timer?.cancel();
    setState(() {
      _seconds = 0;
      _timelist.clear();
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // hủy timer để tránh rò rỉ bộ nhớ
    _timelist.dispose(); // giải phóng controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            "Time App",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 2, 40, 57),
        // foregroundColor: Colors.blue,
      ),
      body: Container(
        color: Color.fromARGB(255, 2, 40, 57),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Nhập số giây cần đếm",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 10),
            TextField(
              controller: _timelist,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nhập số thời gian (giây)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            Text(
              formatTime(_seconds),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _startCountdown,
                  child: Container(
                    child: Row(
                      children: [Icon(Icons.play_arrow), Text("Bắt đầu")],
                    ),
                  ),
                ),
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: _resetCountdown,
                  child: Container(
                    child: Row(
                      children: [Icon(Icons.refresh), Text("Đặt lại")],
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
