import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/main_movie_model.dart';
// import 'package:movieapp/models/newmoviesl_model.dart';
import 'package:movieapp/responsive/responisive.dart';
import 'package:movieapp/utilities/api_key.dart';
import 'package:movieapp/view/home_page/widget/profile_drawer.dart';

class MovieDetailsUi extends ConsumerWidget {
  const MovieDetailsUi({
    super.key,
    required this.provider,
    required this.index,
  });
  final FutureProvider<MainMovieModels> provider;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool mode = ref.watch(modeProvider);
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    var item = ref.watch(provider);

    return Scaffold(
      backgroundColor: mode ? const Color(0xff222222) : Colors.white,
      appBar: AppBar(
        backgroundColor: mode ? const Color(0xff222222) : Colors.white,
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
      body: SingleChildScrollView(
        child: item.when(
          data: (data) => detailview(sw, sh, data, index, mode),
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
    );
  }

  Column detailview(
      double sw, double sh, MainMovieModels data, int index, bool mode) {
    return Column(
      children: [
        SizedBox(
          width: sw,
          height: sh * (200 / Responsive.height),
          child: Image.network(
            "${ApiKey.imagekey}/w500/${data.results![index].backdropPath!}",
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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 100,
                      ),
                      Positioned(
                        bottom: 1,
                        child: Container(
                          height: 130,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${ApiKey.imagekey}/w500/${data.results![index].posterPath!}"),
                                  fit: BoxFit.cover)),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: sw * (180 / Responsive.width),
                        child: Text(
                          data.results![index].title!,
                          style: TextStyle(
                              color: mode
                                  ? Responsive.primerycolors
                                  : Colors.black,
                              fontFamily: "Righteous",
                              fontSize: sw * (16 / Responsive.width)),
                        ),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 40,
                            child: Text(
                              data.results![index].originalLanguage!,
                              style: TextStyle(
                                  color: mode
                                      ? Responsive.primerycolors
                                      : Colors.black,
                                  fontFamily: "Righteous",
                                  fontSize: sw * (16 / Responsive.width)),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 16,
                              ),
                              Text(
                                "${data.results![index].voteAverage!.toStringAsFixed(1)}/10",
                                style: TextStyle(
                                    color: mode
                                        ? Responsive.primerycolors
                                        : Colors.black,
                                    fontFamily: "Righteous",
                                    fontSize: sw * (12 / Responsive.width)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: sh * (10 / Responsive.height),
              ),
              const Divider(),
              Container(
                padding: EdgeInsets.all(sw * (8 / Responsive.width)),
                child: Text(
                  data.results![index].overview!,
                  style: TextStyle(
                      color: mode ? Responsive.primerycolors : Colors.black,
                      fontFamily: "Righteous",
                      fontSize: sw * (18 / Responsive.width)),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
