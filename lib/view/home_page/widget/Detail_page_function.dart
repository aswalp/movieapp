import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/newmoviesl_model.dart';
import 'package:movieapp/movie_details/movie_details.dart';

void detailfunction(
    BuildContext context, Provider<List<Newmovies>> pro, int index) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailsUi(
          provider: pro,
          index: index,
        ),
      ));
}
