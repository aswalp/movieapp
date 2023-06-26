import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:movieapp/models/main_movie_model.dart';
import 'package:movieapp/provider/searchprovider/searchprovider.dart';
import 'package:movieapp/responsive/responisive.dart';
import 'package:movieapp/utilities/api_key.dart';
import 'package:movieapp/view/home_page/homepage.dart';
import 'package:movieapp/view/home_page/widget/Detail_page_function.dart';
// import 'package:movieapp/services/apiserives.dart';
import 'package:movieapp/view/home_page/widget/profile_drawer.dart';

class SearchUi extends ConsumerWidget {
  const SearchUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var search = ref.watch(searchMoviesProvider);
    int nav = ref.watch(naviprovider);

    // TextEditingController _texteditingcontroller = TextEditingController();
    bool mode = ref.watch(modeProvider);

    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: mode ? const Color(0xff0a141c) : Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: !mode ? const Color(0xff0a141c) : Colors.white,
            )),
        backgroundColor: mode ? const Color(0xff0a141c) : Colors.white,
        centerTitle: true,
        title: Text(
          "Search",
          style: TextStyle(
              color: mode ? Responsive.primerycolors : Colors.black,
              fontFamily: "Righteous",
              fontSize: sw * (24 / Responsive.width)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sw * (15 / Responsive.width),
                  vertical: sh * (10 / Responsive.height)),
              child: SizedBox(
                height: sh * (60 / Responsive.height),
                width: sw,
                child: TextField(
                  // controller: _texteditingcontroller,
                  onChanged: (value) {
                    ref.read(searchValueProvider).value = value;
                    print(value);
                    // _texteditingcontroller.text = value;
                    ref.invalidate(searchMoviesProvider);
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                      color: mode ? Colors.white : Colors.black,
                      fontSize: sw * (12 / Responsive.width)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                        mode ? const Color(0xff272111) : Color(0xFF878484),
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: mode ? Colors.white : Colors.black,
                    labelText: "Search Movies",
                    labelStyle: TextStyle(
                        color: mode ? Colors.white : Colors.black,
                        fontFamily: "Karla",
                        fontSize: sw * (12 / Responsive.width)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.transparent, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.transparent, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(color: Colors.transparent, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: sh,
              child: search.when(
                data: (data) => searchlist(data, sw, mode),
                error: (error, stackTrace) => Text("error"),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff222222),
        selectedItemColor: Responsive.primerycolors,
        unselectedItemColor: Colors.white,
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

  ListView searchlist(MainMovieModels data, double sw, bool mode) {
    // print(data);
    return ListView.separated(
      // shrinkWrap: true,
      // physics: const ScrollPhysics(),
      itemCount: data.results!.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => detailfunction(context, searchMoviesProvider, index),
          child: Container(
            padding: EdgeInsets.all(5),
            height: 120,
            width: sw,
            // decoration: BoxDecoration(color: Colors.transparent),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 120,
                  width: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: data.results![index].posterPath == null
                        ? Icon(
                            Icons.block,
                            color: mode ? Colors.white : Colors.black,
                            size: 40,
                          )
                        : Image.network(
                            "${ApiKey.imagekey}/w500/${data.results![index].posterPath!}",
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 250,
                        child: Text(
                          data.results![index].title!,
                          style: TextStyle(
                              color: Responsive.primerycolors,
                              fontFamily: "Righteous",
                              fontSize: sw * (16 / Responsive.width)),
                        )),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 16,
                        ),
                        Text(
                          data.results![index].voteAverage!.toStringAsFixed(1),
                          style: TextStyle(
                              color: mode
                                  ? Responsive.primerycolors
                                  : Colors.black,
                              fontFamily: "Righteous",
                              fontSize: sw * (12 / Responsive.width)),
                        ),
                      ],
                    ),
                    Text(
                      DateFormat("yyyy")
                          .format(data.results![index].releaseDate!),
                      style: TextStyle(
                          color: mode ? Responsive.primerycolors : Colors.black,
                          fontFamily: "Righteous",
                          fontSize: sw * (12 / Responsive.width)),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
