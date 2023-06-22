import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/main_movie_model.dart';
import 'package:movieapp/provider/trendingmovies/trendingprovider.dart';
import 'package:movieapp/responsive/responisive.dart';
import 'package:movieapp/utilities/api_key.dart';
import 'package:movieapp/view/home_page/widget/Detail_page_function.dart';

class TrendingMovies extends ConsumerWidget {
  const TrendingMovies({
    super.key,
    required this.sh,
    required this.sw,
  });

  final double sh;
  final double sw;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var maintrending = ref.watch(maintrendindday);
    return maintrending.when(
      data: (data) => trendingmovie(ref, data),
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
    );
  }

  SizedBox trendingmovie(WidgetRef ref, MainMovieModels data) {
    return SizedBox(
      height: sh * (190 / Responsive.height),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => detailfunction(context, maintrendindday, index),
            child: Container(
              height: sh * (180 / Responsive.height),
              width: sw * (130 / Responsive.width),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(
                        "${ApiKey.imagekey}/w500/${data.results![index].posterPath!}"),
                    fit: BoxFit.cover),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: sw * (10 / Responsive.width),
          );
        },
      ),
    );
  }
}
