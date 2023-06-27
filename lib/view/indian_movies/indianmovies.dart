import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:movieapp/models/main_movie_model.dart';
import 'package:movieapp/provider/indianprovider/indianprovider.dart';
import 'package:movieapp/responsive/responisive.dart';
import 'package:movieapp/utilities/api_key.dart';
import 'package:movieapp/view/home_page/homepage.dart';
import 'package:movieapp/view/home_page/widget/profile_drawer.dart';

import '../home_page/widget/Detail_page_function.dart';

class IndianMovies extends ConsumerWidget {
  const IndianMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int ind = ref.watch(indiansmoviesprovider);
    int nav = ref.watch(naviprovider);
    bool mode = ref.watch(modeProvider);
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;

    List<FutureProvider<MainMovieModels>> listindmovies = [
      malayalamprovider,
      hindiprovider,
      tamilprovider,
      teluguprovider,
    ];
    var indian = ref.watch(listindmovies[ind]);

    return Scaffold(
      backgroundColor: mode ? const Color(0xff222222) : Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mode ? const Color(0xff222222) : Colors.white,
        centerTitle: true,
        title: Text(
          "Indian Movies",
          style: TextStyle(
              color: mode ? Responsive.primerycolors : Colors.black,
              fontFamily: "Righteous",
              fontSize: sw * (24 / Responsive.width)),
        ),
        bottom: PreferredSize(
          preferredSize: Size(sw, 60),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FlutterToggleTab(
              // width in percent
              width: 90,
              borderRadius: 5,
              height: 30,
              selectedIndex: ind,
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
              labels: const ["Malaylam", "Hindi", "Tamil", "Telugu"],
              selectedLabelIndex: (index) {
                ref.read(indiansmoviesprovider.notifier).state = index;
              },
              isScroll: true,
            ),
          ),
        ),
      ),
      body: indian.when(
        data: (data) => buildindianmovies(data, listindmovies[ind], mode),
        error: (error, stackTrace) => const Text("error"),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mode ? const Color(0xff222222) : Colors.white,
        selectedItemColor: mode ? Responsive.primerycolors : Colors.red,
        unselectedItemColor: mode ? Colors.white : Colors.black,
        items: [
          BottomNavigationBarItem(
            label: "home",
            icon: Icon(
              nav == 0 ? Icons.home : Icons.home_outlined,
            ),
          ),
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
        currentIndex: nav,
        onTap: (value) {
          ref.read(naviprovider.notifier).state = value;
        },
      ),
    );
  }

  GridView buildindianmovies(
      MainMovieModels data, FutureProvider<MainMovieModels> indian, bool mode) {
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
          onTap: () => detailfunction(context, indian, index),
          child: data.results![index].posterPath == null
              ? Icon(
                  Icons.block,
                  color: mode ? Colors.white : Colors.black,
                  size: 40,
                )
              : Container(
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
                  )),
        );
      },
    );
  }
}

final indiansmoviesprovider = StateProvider<int>((ref) {
  return 0;
});
