import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/main_movie_model.dart';
// import 'package:movieapp/provider/animationmovies/animationmovies.dart';
import 'package:movieapp/provider/newMovie_provider/newmovieprovider.dart';
import 'package:movieapp/provider/popular_movies/popularmovies.dart';
import 'package:movieapp/provider/top_rated/toprated.dart';
import 'package:movieapp/provider/trendingmovies/trendingprovider.dart';
import 'package:movieapp/provider/upcoming_provider/upcoming_provider.dart';
// import 'package:movieapp/provider/popular_movies/popularmovies.dart';
// import 'package:movieapp/provider/trendingmovies/trendingprovider.dart';
import 'package:movieapp/responsive/responisive.dart';
import 'package:movieapp/services/apiserives.dart';
// import 'package:movieapp/utilities/api_key.dart';
import 'package:movieapp/view/home_page/widget/top_rated.dart';
import 'package:movieapp/view/home_page/widget/newmoviesroller.dart';
import 'package:movieapp/view/home_page/widget/popularmovies.dart';
import 'package:movieapp/view/home_page/widget/profile_drawer.dart';
import 'package:movieapp/view/home_page/widget/trendingmovies.dart';
import 'package:movieapp/view/home_page/widget/upcomingmovies.dart';
import 'package:movieapp/view/search/search.dart';
import 'package:movieapp/view/see_all/see_all.dart';

class HomePageUi extends ConsumerWidget {
  const HomePageUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool mode = ref.watch(modeProvider);
    var newmoivemain = ref.watch(mainnowplayprovider);

    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(),
      drawer: ProfileDrawer(sw: sw),
      backgroundColor: mode ? const Color(0xff222222) : const Color(0xFFFFFFFF),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: mode ? const Color(0xff222222) : Colors.white,
            centerTitle: true,
            title: Row(
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
                      color: mode ? Responsive.primerycolors : Colors.black,
                      fontFamily: "Righteous",
                      fontSize: sw * (24 / Responsive.width)),
                ),
              ],
            ),
            expandedHeight: sh * (430 / Responsive.height),
            flexibleSpace: FlexibleSpaceBar(
              background: newmoivemain.when(
                data: (data) => buildnewmovieslider(sh, data),
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
            ),
            // primary: false,

            // expandedHeight: 550,
            leading: Builder(builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all((8.0)),
                child: CircleAvatar(
                  // radius: 10,
                  backgroundColor: const Color(0x54FFFFFF),
                  child: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();

                      // print(ref
                      //     .watch(apiservicesProvider)
                      //     .getsearchmovies("cbi 5"));
                    },
                    // tooltip:
                    //     MaterialLocalizations.of(context).openAppDrawerTooltip,
                    icon: Icon(
                      Icons.person,
                      color: !mode ? const Color(0xff0a141c) : Colors.white,
                    ),
                  ),
                ),
              );
            }),
            actions: [
              CircleAvatar(
                backgroundColor: const Color(0x54FFFFFF),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchUi(),
                          ));

                      // showSearch(context: context, delegate: Search());
                    },
                    icon: Icon(
                      Icons.search,
                      color: !mode ? const Color(0xff0a141c) : Colors.white,
                    )),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sw * (15.0 / Responsive.width)),
              child: Column(
                children: [
                  // buildnewmovieslider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending Now",
                        style: TextStyle(
                            color:
                                !mode ? const Color(0xff0a141c) : Colors.white,
                            fontFamily: "Righteous",
                            fontSize: sw * (20 / Responsive.width)),
                      ),
                      InkWell(
                        onTap: () => moviesgrid(context, maintrendindday, 0),
                        child: Text(
                          "See All",
                          style: TextStyle(
                              color: !mode
                                  ? const Color(0xff0a141c)
                                  : Colors.white,
                              fontFamily: "Righteous",
                              fontSize: sw * (12 / Responsive.width)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sh * (10 / Responsive.height),
                  ),

                  TrendingMovies(sh: sh, sw: sw),
                  SizedBox(
                    height: sh * (20 / Responsive.height),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " Popular Movies",
                        style: TextStyle(
                            color:
                                !mode ? const Color(0xff0a141c) : Colors.white,
                            fontFamily: "Righteous",
                            fontSize: sw * (20 / Responsive.width)),
                      ),
                      InkWell(
                        onTap: () => moviesgrid(context, mainpopmovies, 1),
                        child: Text(
                          "See All",
                          style: TextStyle(
                              color: !mode
                                  ? const Color(0xff0a141c)
                                  : Colors.white,
                              fontFamily: "Righteous",
                              fontSize: sw * (12 / Responsive.width)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sh * (10 / Responsive.height),
                  ),
                  PopularMovies(sh: sh, sw: sw),
                  SizedBox(
                    height: sh * (20 / Responsive.height),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " Top Rated Movies",
                        style: TextStyle(
                            color:
                                !mode ? const Color(0xff0a141c) : Colors.white,
                            fontFamily: "Righteous",
                            fontSize: sw * (20 / Responsive.width)),
                      ),
                      InkWell(
                        onTap: () =>
                            moviesgrid(context, maintopratedprovider, 2),
                        child: Text(
                          "See All",
                          style: TextStyle(
                              color: !mode
                                  ? const Color(0xff0a141c)
                                  : Colors.white,
                              fontFamily: "Righteous",
                              fontSize: sw * (12 / Responsive.width)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sh * (10 / Responsive.height),
                  ),
                  AnimationMovies(sh: sh, sw: sw),
                  SizedBox(
                    height: sh * (20 / Responsive.height),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " UpComing Movies",
                        style: TextStyle(
                            color:
                                !mode ? const Color(0xff0a141c) : Colors.white,
                            fontFamily: "Righteous",
                            fontSize: sw * (20 / Responsive.width)),
                      ),
                      InkWell(
                        onTap: () =>
                            moviesgrid(context, mainupcomingprovider, 3),
                        child: Text(
                          "See All",
                          style: TextStyle(
                              color: !mode
                                  ? const Color(0xff0a141c)
                                  : Colors.white,
                              fontFamily: "Righteous",
                              fontSize: sw * (12 / Responsive.width)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sh * (10 / Responsive.height),
                  ),

                  UpComingMovies(sh: sh, sw: sw),
                ],
              ),
            ),
          ),
        ],
      ),

      // bottomNavigationBar: BottomNavigationBar(items: const [
      //   BottomNavigationBarItem(
      //     label: "home",
      //     icon: Icon(
      //       Icons.home_outlined,
      //     ),
      //   ),
      //   BottomNavigationBarItem(
      //     label: "home",
      //     icon: Icon(
      //       Icons.home_outlined,
      //     ),
      //   )
      // ]),
    );
  }

  Consumer buildnewmovieslider(double sh, MainMovieModels data) {
    return Consumer(builder: (context, ref, _) {
      return CarouselSlider.builder(
        itemCount: data.results!.length,
        itemBuilder: (context, index, realIndex) {
          return NewMoviesScroller(
            index: index,
          );
        },
        options: CarouselOptions(
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            height: sh * (430 / Responsive.height),
            autoPlay: true,
            reverse: true,
            enlargeCenterPage: true),
      );
    });
  }
}

void moviesgrid(
    BuildContext context, FutureProvider<MainMovieModels> pro, int val) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SeeAll(
          ind: pro,
          val: val,
        ),
      ));
}
