import 'package:flutter/material.dart';
import 'package:movieapp/responsive/responisive.dart';
import 'package:movieapp/view/home_page/homepage.dart';
import 'package:movieapp/view/signupandlogin/signup.dart';

class LoginUi extends StatelessWidget {
  const LoginUi({super.key});

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xff222222),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: sw,
                height: sh * (50 / Responsive.height),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: sh * (30 / Responsive.height),
                      width: sw * (30 / Responsive.width),
                      child: Image.asset(
                        "assets/images/icons/flashicon.png",
                        fit: BoxFit.contain,
                      )),
                  Text(
                    "Flash Movies",
                    style: TextStyle(
                        color: Responsive.primerycolors,
                        fontFamily: "Righteous",
                        fontSize: sw * (28 / Responsive.width)),
                  ),
                ],
              ),
              SizedBox(
                height: sh * (18 / Responsive.height),
              ),
              Text(
                "Unlimited Movie Reviews",
                style: TextStyle(
                    color: Responsive.primerycolors,
                    fontFamily: "Righteous",
                    fontSize: sw * (12 / Responsive.width)),
              ),
              SizedBox(
                height: sh * (85 / Responsive.height),
              ),
              Text(
                "Sign in Your Account",
                style: TextStyle(
                    color: Responsive.primerycolors,
                    fontFamily: "Righteous",
                    fontSize: sw * (16 / Responsive.width)),
              ),
              SizedBox(
                height: sh * (35 / Responsive.height),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: sw * (15 / Responsive.width),
                    vertical: sh * (10 / Responsive.height)),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: sw * (12 / Responsive.width)),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: const Color(0xffffffff),
                    labelText: "Email",
                    labelStyle: TextStyle(
                        color: const Color(0xffffffff),
                        fontFamily: "Karla",
                        fontSize: sw * (12 / Responsive.width)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: sw * (15 / Responsive.width),
                    vertical: sh * (10 / Responsive.height)),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  style: TextStyle(
                      color: const Color(0xffffffff),
                      fontSize: sw * (12 / Responsive.width)),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.key),
                    prefixIconColor: const Color(0xffffffff),
                    suffixIcon: const Icon(Icons.visibility_off),
                    suffixIconColor: const Color(0xffffffff),
                    labelText: "Password",
                    labelStyle: TextStyle(
                        color: const Color(0xffffffff),
                        fontFamily: "Karla",
                        fontSize: sw * (12 / Responsive.width)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: sh * (20 / Responsive.height),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 100),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              ScaleTransition(
                        // opacity: animation,
                        scale: animation,
                        child: child,
                      ),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const HomePageUi(),
                    ),
                  );
                },
                child: Container(
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
                    gradient: RadialGradient(
                      radius: 3,
                      focalRadius: 5,
                      colors: [Responsive.primerycolors, Colors.orange],
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        color: const Color(0xff000000),
                        fontFamily: "Karla",
                        fontSize: sw * (16 / Responsive.width)),
                  ),
                ),
              ),
              SizedBox(
                height: sh * (20 / Responsive.height),
              ),
              Divider(
                color: Colors.white,
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
                  height: 40,
                  width: 40,
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
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(6),
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
        bottomNavigationBar: InkWell(
          onTap: () {
            signupsheet(context);
          },
          child: Container(
            height: sh * (60 / Responsive.height),
            width: sw,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 8),
                  height: 4,
                  width: sw * (80 / Responsive.width),
                  color: Colors.grey,
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Righteous",
                      fontSize: sw * (16 / Responsive.width)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> signupsheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      enableDrag: false,
      isScrollControlled: true,
      useRootNavigator: true,
      showDragHandle: true,
      context: context,
      builder: (context) => const SignupPage(),
    );
  }
}
