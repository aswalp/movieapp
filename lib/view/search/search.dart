import 'package:flutter/material.dart';
import 'package:movieapp/responsive/responisive.dart';

class SearchUi extends StatelessWidget {
  const SearchUi({super.key});

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff0a141c),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Color(0xff0a141c),
        centerTitle: true,
        title: Text(
          "Search",
          style: TextStyle(
              color: Responsive.primerycolors,
              fontFamily: "Righteous",
              fontSize: sw * (24 / Responsive.width)),
        ),
      ),
      body: Column(
        children: [
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
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.white,
                  labelText: "Search Movies",
                  labelStyle: TextStyle(
                      color: Colors.white,
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
          ),
        ],
      ),
    );
  }
}
