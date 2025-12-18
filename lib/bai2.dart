import 'package:flutter/material.dart';

class Myexercise2 extends StatelessWidget {
  const Myexercise2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return SafeArea(
      child: Container(
        color: Color.fromARGB(255, 2, 40, 57),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [stack1(), stack2(), stack3(), stack4(), stack5()],
        ),
      ),
    );
  }

  Widget stack1() {
    var img =
        "https://images.pexels.com/photos/6010581/pexels-photo-6010581.jpeg";
    var noteh1 = "Siêu xe thể thao Ferrari";
    var noteh2 = "Màu xanh lá";
    var noteh3 = "50 chiếc";
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: 0, bottom: 10, left: 20, right: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),

        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noteh1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(noteh2, style: TextStyle(color: Colors.white)),
                ],
              ),
              Text(noteh3, style: TextStyle(color: Colors.white)),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget stack2() {
    var img =
        "https://images.pexels.com/photos/19411236/pexels-photo-19411236.jpeg";
    var noteh1 = "Siêu xe thể thao Ferrari";
    var noteh2 = "Màu đỏ gạch";
    var noteh3 = "50 chiếc";
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: 0, bottom: 10, left: 20, right: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),

        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noteh1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(noteh2, style: TextStyle(color: Colors.white)),
                ],
              ),
              Text(noteh3, style: TextStyle(color: Colors.white)),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget stack3() {
    var img =
        "https://images.pexels.com/photos/9113865/pexels-photo-9113865.jpeg";
    var noteh1 = "Siêu xe thể thao Ferrari";
    var noteh2 = "Màu đỏ";
    var noteh3 = "50 chiếc";
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: 0, bottom: 10, left: 20, right: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),

        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noteh1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(noteh2, style: TextStyle(color: Colors.white)),
                ],
              ),
              Text(noteh3, style: TextStyle(color: Colors.white)),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget stack4() {
    var img =
        "https://images.pexels.com/photos/26954164/pexels-photo-26954164.jpeg";
    var noteh1 = "Siêu xe thể thao Ferrari";
    var noteh2 = "Màu đen";
    var noteh3 = "50 chiếc";
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: 0, bottom: 10, left: 20, right: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),

        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noteh1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(noteh2, style: TextStyle(color: Colors.white)),
                ],
              ),
              Text(noteh3, style: TextStyle(color: Colors.white)),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget stack5() {
    var img =
        "https://images.pexels.com/photos/27212760/pexels-photo-27212760.jpeg";
    var noteh1 = "Siêu xe thể thao Ferrari";
    var noteh2 = "Màu gạch";
    var noteh3 = "50 chiếc";
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: 0, bottom: 10, left: 20, right: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),

        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noteh1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(noteh2, style: TextStyle(color: Colors.white)),
                ],
              ),
              Text(noteh3, style: TextStyle(color: Colors.white)),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
