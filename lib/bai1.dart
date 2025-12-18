import 'package:flutter/material.dart';

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(255, 2, 40, 57),
      child: SingleChildScrollView(
        child: Column(
          children: [
            block1(),
            block2(),
            block3(),
            block4(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget block1() {
    var src =
        "https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    return Padding(
      padding: EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          src,
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget block2() {
    var namePlace = "Mercedes Benz";
    var addressPlace = "Jl. Gatot Subroto No. 1, Jakarta";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  namePlace,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: const Color.fromARGB(255, 210, 207, 207),
                  ),
                ),
                SizedBox(height: 5),
                Text(addressPlace, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 20),
              SizedBox(width: 5),
              Text(
                "4.5",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget block3() {
    var color = Colors.blue;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, "CALL"),
          _buildButtonColumn(color, Icons.near_me, "ROUTE"),
          _buildButtonColumn(color, Icons.share, "SHARE"),
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget block4() {
    var note =
        "Mercedes-Benz là một trong những hãng sản xuất xe ô tô, xe buýt, xe tải danh tiếng trên thế giới. Hãng được xem là một trong những hãng sản xuất xe hơi lâu đời nhất còn tồn tại đến ngày nay. Khởi đầu, hãng thuộc sở hữu bởi Daimler-Benz. Hiện tại, hãng là một thành viên của công ty mẹ, Daimler AG.";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        note,
        textAlign: TextAlign.justify,
        style: TextStyle(color: Colors.grey[400], height: 1.6, fontSize: 15),
      ),
    );
  }
}
