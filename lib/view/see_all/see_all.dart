import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:movieapp/models/main_movie_model.dart';
import 'package:movieapp/provider/trendingmovies/trendingprovider.dart';
// import 'package:movieapp/models/newmoviesl_model.dart';
// import 'package:movieapp/provider/top_rated/toprated.dart';
// import 'package:movieapp/provider/popular_movies/popularmovies.dart';
// import 'package:movieapp/provider/trendingmovies/trendingprovider.dart';
import 'package:movieapp/responsive/responisive.dart';
import 'package:movieapp/utilities/api_key.dart';
import 'package:movieapp/view/home_page/widget/Detail_page_function.dart';
// import 'package:movieapp/view/home_page/widget/Detail_page_function.dart';
import 'package:movieapp/view/home_page/widget/profile_drawer.dart';

class SeeAll extends ConsumerWidget {
  const SeeAll({
    super.key,
    required this.ind,
    required this.val,
  });
  final int val;
  final FutureProvider<MainMovieModels> ind;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int daw = ref.watch(dayandweek);
    bool mode = ref.watch(modeProvider);
    var pro = ref.watch(ind);
    var week = ref.watch(maintrendingweek);

    // double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mode ? const Color(0xff222222) : Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          val == 0
              ? "Trending Movies"
              : val == 1
                  ? "Populur Movies"
                  : val == 2
                      ? "Top rated movies"
                      : "Upcoming Movies",
          style: TextStyle(
              color: mode ? Responsive.primerycolors : Colors.black,
              fontFamily: "Righteous",
              fontSize: sw * (24 / Responsive.width)),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: mode ? Colors.white : Colors.black,
            )),
        backgroundColor: mode ? const Color(0xff0a141c) : Colors.white,
        bottom: val == 0
            ? PreferredSize(
                preferredSize: Size(sw, 55),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FlutterToggleTab(
                    // width in percent
                    width: 40,
                    borderRadius: 30,
                    height: 30,
                    selectedIndex: daw,
                    selectedBackgroundColors: const [
                      Color(0xFF141313),
                      Color(0xDD171616)
                    ],
                    selectedTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                    unSelectedTextStyle: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    labels: const ["day", "week"],
                    selectedLabelIndex: (index) {
                      ref.read(dayandweek.notifier).state = index;
                    },
                    isScroll: true,
                  ),
                ),
              )
            : null,
      ),
      body: val == 0 && daw == 1
          ? week.when(
              data: (data) => gridlist(ref, data, ind, context),
              error: (error, stackTrace) {
                return const Center(
                  child: Text("error"),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          : pro.when(
              data: (data) => gridlist(ref, data, ind, context),
              error: (error, stackTrace) {
                return const Center(
                  child: Text("error"),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
    );
  }

  GridView gridlist(WidgetRef ref, MainMovieModels data,
      FutureProvider<MainMovieModels> pro, BuildContext context) {
    // double sh = MediaQuery.of(context).size.height;

    return GridView.builder(
      itemCount: data.results!.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 4,
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => detailfunction(context, pro, index),
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey,
            child: Container(
              // height: sh * (180 / Responsive.height),
              // width: sw * (130 / Responsive.width),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(
                        "${ApiKey.imagekey}/w500/${data.results![index].posterPath!}"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        );
      },
    );
  }
}

final dayandweek = StateProvider<int>((ref) {
  return 0;
});
