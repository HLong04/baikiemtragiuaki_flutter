import 'package:flutter/material.dart';

class FormTinhBmi extends StatefulWidget {
  const FormTinhBmi({super.key});

  @override
  State<FormTinhBmi> createState() => _FormTinhBmiState();
}

class _FormTinhBmiState extends State<FormTinhBmi> {
  final _formKey = GlobalKey<FormState>();

  double _bmiValue = 0.0;
  String _phanLoai = "";

  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();

  void tinhBIM() {
    if (_formKey.currentState!.validate()) {
      double height = double.parse(_height.text);
      double weight = double.parse(_weight.text);

      setState(() {
        _bmiValue = weight / (height * height);

        if (_bmiValue < 18.5) {
          _phanLoai = "Thiếu cân";
        } else if (_bmiValue >= 18.5 && _bmiValue < 24.9) {
          _phanLoai = "Bình thường";
        } else if (_bmiValue >= 25 && _bmiValue < 29.9) {
          _phanLoai = "Thừa cân";
        } else {
          _phanLoai = "Béo phì";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Tính chỉ số BMI")),
        backgroundColor: Color(const Color.fromARGB(255, 2, 55, 98).value),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              tabBarChieuCao(),
              SizedBox(height: 20),
              tabBarCanNang(),
              SizedBox(height: 20),
              submitButtonBMI(),

              SizedBox(height: 25),
              Text(
                "Chỉ số BMI: ${_bmiValue.toStringAsFixed(2)}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Text(
                "Phân loại: $_phanLoai",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabBarChieuCao() {
    return TextFormField(
      controller: _height,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Chiều cao (m)",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12.0,
          ), // Bạn có thể thay đổi số 12
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Vui lòng nhập chiều cao";
        }
        if (double.tryParse(value) == null) {
          return "Nhập số hợp lệ!";
        }
        return null;
      },
    );
  }

  Widget tabBarCanNang() {
    return TextFormField(
      controller: _weight,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Cân nặng (kg)",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12.0,
          ), // Bạn có thể thay đổi số 12
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Vui lòng nhập cân nặng";
        }
        if (double.tryParse(value) == null) {
          return "Nhập số hợp lệ!";
        }
        return null;
      },
    );
  }

  Widget submitButtonBMI() {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: tinhBIM,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calculate),
            SizedBox(width: 10),
            Text("Tính BMI"),
          ],
        ),
      ),
    );
  }
}
