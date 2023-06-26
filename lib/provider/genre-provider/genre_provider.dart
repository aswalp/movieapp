import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/genere_model.dart';

final genreList =
    FutureProvider.family<List<GenreModel>, BuildContext>((ref, context) async {
  String data =
      await DefaultAssetBundle.of(context).loadString("assets/data.json");
  return genreModelFromJson(data);
});
