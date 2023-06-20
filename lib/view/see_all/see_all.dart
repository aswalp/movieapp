import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/provider/animationmovies/animationmovies.dart';
import 'package:movieapp/provider/popular_movies/popularmovies.dart';
import 'package:movieapp/provider/trendingmovies/trendingprovider.dart';
import 'package:movieapp/responsive/responisive.dart';

class SeeAll extends ConsumerWidget {
  const SeeAll({
    super.key,
    required this.ind,
  });
  final int ind;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Provider> pro = [
      trendingprovider,
      popMoviesprovider,
      animationprovider,
    ];
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff0a141c),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ind == 0
              ? "Trending"
              : ind == 1
                  ? "Populur"
                  : "Animation",
          style: TextStyle(
              color: Responsive.primerycolors,
              fontFamily: "Righteous",
              fontSize: sw * (24 / Responsive.width)),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Color(0xff0a141c),
      ),
      body: GridView.builder(
        itemCount: ref.watch(trendingprovider).length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 4,
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8),
        itemBuilder: (context, index) {
          return Container(
            // height: sh * (180 / Responsive.height),
            // width: sw * (130 / Responsive.width),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(ref.watch(pro[ind])[index].images),
                  fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
