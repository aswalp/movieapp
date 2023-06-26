import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:movieapp/models/genere_model.dart';
import 'package:movieapp/models/main_movie_model.dart';
// import 'package:movieapp/provider/genre-provider/genre_provider.dart';
// import 'package:movieapp/models/newmoviesl_model.dart';
import 'package:movieapp/responsive/responisive.dart';
import 'package:movieapp/utilities/api_key.dart';
import 'package:movieapp/utilities/generefunction.dart';
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
          data: (data) => detailview(sw, sh, data, index, mode, ref, context),
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

  Column detailview(double sw, double sh, MainMovieModels data, int index,
      bool mode, WidgetRef ref, BuildContext context) {
    // var generlistAsyncValue = ref.watch(genreList(context));
    // var generlist = generlistAsyncValue.whenData((value) => value).value;

    var id = data.results![index].genreIds;

    var genlist = Genlist.g;

    var c = generefunction(id!, genlist);
    return Column(
      children: [
        SizedBox(
          width: sw,
          height: sh * (200 / Responsive.height),
          child: Image.network(
            "${ApiKey.imagekey}/w780/${data.results![index].backdropPath ?? data.results![index].posterPath}",
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
                        height: sh * (80 / Responsive.height),
                        width: sw * (100 / Responsive.width),
                      ),
                      Positioned(
                        bottom: 1,
                        child: data.results![index].posterPath == null
                            ? Icon(
                                Icons.block,
                                color: mode ? Colors.white : Colors.black,
                                size: 40,
                              )
                            : Container(
                                height: sh * (130 / Responsive.height),
                                width: sw * (90 / Responsive.width),
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
                      SizedBox(
                        height: sh * (10 / Responsive.height),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: sw * (150 / Responsive.width),
                            child: Text(
                              DateFormat("yyyy/MMM/dd")
                                  .format(data.results![index].releaseDate!),
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
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: sw * (16 / Responsive.width),
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
                height: sh * (5 / Responsive.height),
              ),
              SizedBox(
                height: sh * (40 / Responsive.height),
                width: sw * (200 / Responsive.width),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: c.length,
                  itemBuilder: (context, index) {
                    return Text(
                      c[index],
                      style: TextStyle(
                          color: mode ? Responsive.primerycolors : Colors.black,
                          fontFamily: "Righteous",
                          fontSize: sw * (10 / Responsive.width)),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Text(
                      "/",
                      style: TextStyle(
                          color: mode ? Responsive.primerycolors : Colors.black,
                          fontFamily: "Righteous",
                          fontSize: sw * (10 / Responsive.width)),
                    );
                  },
                ),
              ),
              // SizedBox(
              //   height: sh * (5 / Responsive.height),
              // ),
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
