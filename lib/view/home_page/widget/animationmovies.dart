import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/provider/animationmovies/animationmovies.dart';
import 'package:movieapp/responsive/responisive.dart';

class AnimationMovies extends ConsumerWidget {
  const AnimationMovies({
    super.key,
    required this.sh,
    required this.sw,
  });

  final double sh;
  final double sw;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: sh * (190 / Responsive.height),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            height: sh * (180 / Responsive.height),
            width: sw * (130 / Responsive.width),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(ref.watch(animationprovider)[index].images),
                  fit: BoxFit.cover),
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
