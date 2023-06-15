import 'package:flutter/material.dart';
import 'package:movieapp/responsive/responisive.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Container(
      height: sh * 0.8,
      width: sw,
      decoration:  BoxDecoration(
        color: Responsive.primerycolors,
        borderRadius:const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: sh * (30 / Responsive.height),
          ),
          Text(
            "Create your Account",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Righteous",
                fontSize: sw * (20 / Responsive.width)),
          ),
          SizedBox(
            height: sh * (30 / Responsive.height),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: sw * (15 / Responsive.width),
                vertical: sh * (10 / Responsive.height)),
            child: TextField(
              style: TextStyle(
                  color: Colors.black, fontSize: sw * (12 / Responsive.width)),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                prefixIconColor: Colors.grey,
                labelText: "Enter your Email",
                labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Karla",
                    fontSize: sw * (12 / Responsive.width)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: sw * (15 / Responsive.width),
                vertical: sh * (10 / Responsive.height)),
            child: TextField(
              style: TextStyle(
                  color: Colors.black, fontSize: sw * (12 / Responsive.width)),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                prefixIconColor: Colors.grey,
                suffixIcon: const Icon(Icons.visibility_off),
                suffixIconColor: Colors.grey,
                labelText: "password",
                labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Karla",
                    fontSize: sw * (12 / Responsive.width)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: sw * (15 / Responsive.width),
                vertical: sh * (10 / Responsive.height)),
            child: TextField(
              style: TextStyle(
                  color: Colors.black, fontSize: sw * (12 / Responsive.width)),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                prefixIconColor: Colors.grey,
                suffixIcon: const Icon(Icons.visibility_off),
                suffixIconColor: Colors.grey,
                labelText: "confirm password",
                labelStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Karla",
                    fontSize: sw * (12 / Responsive.width)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
          ),
          Container(
            height: sh * (60 / Responsive.height),
            width: sw * (150 / Responsive.width),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // boxShadow: const [
              //   BoxShadow(
              //       offset: Offset(5, 2),
              //       color: Colors.grey,
              //       blurRadius: 10,
              //       spreadRadius: 5),
              // ],
              gradient: const RadialGradient(
                radius: 3,
                focalRadius: 5,
                colors: [Color(0xff181818), Color(0xff020202)],
              ),
            ),
            child: Text(
              "Continue",
              style: TextStyle(
                  color: const Color(0xffffffff),
                  fontFamily: "Karla",
                  fontSize: sw * (16 / Responsive.width)),
            ),
          ),
          SizedBox(
            height: sh * (20 / Responsive.height),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "----------------------------",
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Righteous",
                    fontSize: sw * (10 / Responsive.width)),
              ),
              Text(
                "or",
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Righteous",
                    fontSize: sw * (10 / Responsive.width)),
              ),
              Text(
                "----------------------------",
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Righteous",
                    fontSize: sw * (10 / Responsive.width)),
              ),
            ],
          ),
          SizedBox(
            height: sh * (20 / Responsive.height),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: Colors.white),
              child: Image.asset(
                "assets/images/icons/go.jpg",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: sw * (20 / Responsive.width),
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              // padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: Colors.white),
              child: Image.asset(
                "assets/images/icons/fa.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: sw * (20 / Responsive.width),
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 40,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: Colors.white),
              child: Image.asset(
                "assets/images/icons/apple.png",
                color: Colors.black,
                fit: BoxFit.contain,
              ),
            ),
          ])
        ],
      ),
    );
  }
}
