import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/main_movie_model.dart';
import 'package:movieapp/provider/newMovie_provider/newmovieprovider.dart';
import 'package:movieapp/responsive/responisive.dart';
import 'package:movieapp/utilities/api_key.dart';
import 'package:movieapp/view/home_page/widget/Detail_page_function.dart';

class NewMoviesScroller extends ConsumerWidget {
  const NewMoviesScroller({
    required this.index,
    super.key,
  });
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;

    var nowplayingmain = ref.watch(mainnowplayprovider);
    return SingleChildScrollView(
        child: nowplayingmain.when(
      data: (data) => nowplayinglist(sw, context, sh, ref, data),
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
    ));
  }

  Column nowplayinglist(double sw, BuildContext context, double sh,
      WidgetRef ref, MainMovieModels data) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: sw * (160 / Responsive.height),
        ),
        InkWell(
          onTap: () => detailfunction(context, mainnowplayprovider, index),
          child: Container(
            width: sw * (270 / Responsive.width),
            height: sh * (265 / Responsive.height),
            padding: EdgeInsets.all(sw * (20 / Responsive.width)),
            decoration: BoxDecoration(
              // color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(
                      "${ApiKey.imagekey}/w500/${data.results![index].posterPath!}"),
                  fit: BoxFit.cover),
            ),
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
                    data.results![index].voteAverage.toString(),
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
                color: const Color(0xff272111),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: 150,
                child: Text(
                  data.results![index].title!,
                  style: TextStyle(
                      color: Responsive.primerycolors,
                      fontFamily: "Righteous",
                      fontSize: sw * (12 / Responsive.width)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
