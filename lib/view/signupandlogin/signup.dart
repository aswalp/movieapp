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
      padding: EdgeInsets.symmetric(
          vertical: sh * (60 / Responsive.height),
          horizontal: sw * (10 / Responsive.width)),
      height: sh * 0.8,
      width: sw,
      decoration: BoxDecoration(
        color: Color(0xfff2be13),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
            // color: Colors.black,
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
              Color(0xff1e1601),
              Color(0xff020100),
            ])),
        child: Column(
          children: [
            SizedBox(
              height: sh * (30 / Responsive.height),
            ),
            Text(
              "Create your Account",
              style: TextStyle(
                  color: Color(0xfff2be13),
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
              child: SizedBox(
                height: sh * (60 / Responsive.height),
                width: sw,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: sw * (12 / Responsive.width)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xff272111),
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: Colors.white,
                    labelText: "Enter your Email",
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: "Karla",
                        fontSize: sw * (12 / Responsive.width)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sw * (15 / Responsive.width),
                  vertical: sh * (10 / Responsive.height)),
              child: SizedBox(
                height: sh * (60 / Responsive.height),
                width: sw,
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: sw * (12 / Responsive.width)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xff272111),
                    prefixIcon: Icon(Icons.key),
                    prefixIconColor: Colors.white,
                    suffixIcon: const Icon(Icons.visibility_off),
                    suffixIconColor: Colors.white,
                    labelText: "password",
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: "Karla",
                        fontSize: sw * (12 / Responsive.width)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sw * (15 / Responsive.width),
                  vertical: sh * (10 / Responsive.height)),
              child: SizedBox(
                height: sh * (60 / Responsive.height),
                width: sw,
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: sw * (12 / Responsive.width)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xff272111),
                    prefixIcon: Icon(Icons.key),
                    prefixIconColor: Colors.white,
                    suffixIcon: const Icon(Icons.visibility_off),
                    suffixIconColor: Colors.white,
                    labelText: "confirm password",
                    labelStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: "Karla",
                        fontSize: sw * (12 / Responsive.width)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.transparent, width: 0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.transparent, width: 0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.transparent, width: 0),
                    ),
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
                color: Color(0xfff2be13),

                // boxShadow: const [
                //   BoxShadow(
                //       offset: Offset(5, 2),
                //       color: Colors.white,
                //       blurRadius: 10,
                //       spreadRadius: 5),
                // ],
                // gradient: const RadialGradient(
                //   radius: 3,
                //   focalRadius: 5,
                //   colors: [Color(0xff181818), Color(0xff020202)],
                // ),
              ),
              child: Text(
                "Continue",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Karla",
                    fontSize: sw * (16 / Responsive.width)),
              ),
            ),
            SizedBox(
              height: sh * (10 / Responsive.height),
            ),
            Divider(
              color: Colors.white,
            ),
            SizedBox(
              height: sh * (10 / Responsive.height),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                alignment: Alignment.center,
                height: sh * (40 / Responsive.height),
                width: sw * (40 / Responsive.width),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white),
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
                height: sh * (40 / Responsive.height),
                width: sw * (40 / Responsive.width),
                // padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white),
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
                height: sh * (40 / Responsive.height),
                width: sw * (40 / Responsive.width),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white),
                child: Image.asset(
                  "assets/images/icons/apple.png",
                  color: Colors.black,
                  fit: BoxFit.contain,
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
