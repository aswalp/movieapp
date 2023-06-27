import 'package:flutter/material.dart';
import 'package:movieapp/responsive/responisive.dart';

class Sample extends StatelessWidget {
  const Sample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BottomNavigationBar(
            backgroundColor: const Color(0xff222222),
            selectedItemColor: Responsive.primerycolors,
            unselectedItemColor: Colors.white,
            items: [
              // BottomNavigationBarItem(
              //   label: "home",
              //   icon: Icon(
              //     nav == 0 ? Icons.home : Icons.home_outlined,
              //   ),
              // ),
              const BottomNavigationBarItem(
                label: "Indian",
                icon: Icon(
                  Icons.movie,
                ),
              ),
              const BottomNavigationBarItem(
                label: "Search",
                icon: Icon(
                  Icons.search,
                ),
              ),
            ],
            // currentIndex: nav,
            // onTap: (value) {
            //   ref.read(naviprovider.notifier).state = value;
            // },
          ),
        ],
      ),
    );
  }
}
