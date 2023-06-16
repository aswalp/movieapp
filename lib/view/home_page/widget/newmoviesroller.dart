import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/provider/newMovie_provider/newmovieprovider.dart';
import 'package:movieapp/responsive/responisive.dart';

class NewMoviesScroller extends ConsumerWidget {
  int index;

  NewMoviesScroller({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: sw * (270 / Responsive.width),
            height: sh * (265 / Responsive.height),
            padding: EdgeInsets.all(sw * (20 / Responsive.width)),
            decoration: BoxDecoration(
              // color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(ref.watch(newmoviesprovider)[index].images),
                  fit: BoxFit.cover),
            ),
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: sw * (10 / Responsive.width)),
                padding: EdgeInsets.all(sw * (8 / Responsive.width)),
                decoration: BoxDecoration(
                  color: Color(0xff272111),
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
                      ref.watch(newmoviesprovider)[index].rating.toString(),
                      style: TextStyle(
                          color: Responsive.primerycolors,
                          fontFamily: "Righteous",
                          fontSize: sw * (12 / Responsive.width)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sh * (8 / Responsive.height),
              ),
              Container(
                margin: EdgeInsets.only(right: sw * (10 / Responsive.width)),
                padding: EdgeInsets.all(sw * (8 / Responsive.width)),
                decoration: BoxDecoration(
                  color: Color(0xff272111),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  ref.watch(newmoviesprovider)[index].description,
                  style: TextStyle(
                      color: Responsive.primerycolors,
                      fontFamily: "Righteous",
                      fontSize: sw * (12 / Responsive.width)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
