import 'package:flutter/material.dart';

class MyGuide extends StatelessWidget {
  const MyGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return Container(
      color: Color.fromARGB(255, 2, 40, 57),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [stack1(), stack2(), stack3(), stack4(), stack5()],
        ),
      ),
    );
  }

  Widget stack1() {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.extension, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget stack2() {
    return SizedBox(
      height: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: "Welcome,\n",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: "Charlie",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget stack3() {
    return SizedBox(
      height: 120,
      child: Container(
        height: 100,
        width: 100,
        padding: EdgeInsets.all(10),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            prefixIcon: Icon(Icons.search, color: Colors.white),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2,
              ), // viền màu xanh khi chưa focus
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2,
              ), // viền màu xanh khi focus
            ),
          ),
        ),
      ),
    );
  }

  Widget stack4() {
    return SizedBox(
      height: 40,
      child: Text(
        "Saved Places",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget stack5() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 3 / 2,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10), // bo tròn 10px
          child: Image.asset("KhoAnh/Picture2.png", fit: BoxFit.cover),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset("KhoAnh/Picture3.png", fit: BoxFit.cover),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset("KhoAnh/Picture4.png", fit: BoxFit.cover),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset("KhoAnh/Picture5.png", fit: BoxFit.cover),
        ),
      ],
    );
  }
}
