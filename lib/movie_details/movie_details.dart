import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/newmoviesl_model.dart';
import 'package:movieapp/responsive/responisive.dart';
import 'package:movieapp/view/home_page/widget/profile_drawer.dart';

class MovieDetailsUi extends ConsumerWidget {
  const MovieDetailsUi({
    super.key,
    required this.provider,
    required this.index,
  });
  final Provider<List<Newmovies>> provider;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool mode = ref.watch(modeProvider);
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    var item = ref.watch(provider)[index];

    return Scaffold(
      backgroundColor: mode ? const Color(0xff0a141c) : Colors.white,
      appBar: AppBar(
        backgroundColor: mode ? const Color(0xff0a141c) : Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: mode ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Details",
          style: TextStyle(
              color: !mode ? const Color(0xff0a141c) : Responsive.primerycolors,
              fontFamily: "Righteous",
              fontSize: sw * (20 / Responsive.width)),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: sw,
            height: sh * (250 / Responsive.height),
            child: Image.asset(
              item.images,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: sh * (10 / Responsive.height),
                horizontal: sw * (20 / Responsive.width)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(sw * (8 / Responsive.width)),
                      decoration: BoxDecoration(
                        color: const Color(0xff272111),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        ref.watch(provider)[index].name,
                        style: TextStyle(
                            color: Responsive.primerycolors,
                            fontFamily: "Righteous",
                            fontSize: sw * (22 / Responsive.width)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(sw * (8 / Responsive.width)),
                      decoration: BoxDecoration(
                        color: const Color(0xff272111),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          Text(
                            ref.watch(provider)[index].rating.toString(),
                            style: TextStyle(
                                color: Responsive.primerycolors,
                                fontFamily: "Righteous",
                                fontSize: sw * (12 / Responsive.width)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: sh * (10 / Responsive.height),
                ),
                Container(
                  padding: EdgeInsets.all(sw * (8 / Responsive.width)),
                  decoration: BoxDecoration(
                    color: const Color(0xff272111),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    ref.watch(provider)[index].description,
                    style: TextStyle(
                        color: Responsive.primerycolors,
                        fontFamily: "Righteous",
                        fontSize: sw * (18 / Responsive.width)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
