import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/models/main_movie_model.dart';
import 'package:movieapp/utilities/api_key.dart';

class Apiservices {
  static Dio dio = Dio(
    BaseOptions(
        baseUrl: "https://api.themoviedb.org",
        queryParameters: {"api_key": ApiKey.key}),
  );

  Future<MainMovieModels> getpopular() async {
    try {
      Response response = await dio.get(
        "/3/movie/popular",
      );

      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);

        return mainMovieModelsFromJson(json);
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
    throw Exception();
  }

  Future<MainMovieModels> getTrendingday() async {
    try {
      Response response = await dio.get(
        "/3/trending/movie/day",
      );

      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);

        return mainMovieModelsFromJson(json);
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
    throw Exception();
  }

  Future<MainMovieModels> gettoprated() async {
    try {
      Response response = await dio.get(
        "/3/movie/top_rated",
      );

      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);

        return mainMovieModelsFromJson(json);
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
    throw Exception();
  }

  Future<MainMovieModels> getnowplay() async {
    try {
      Response response = await dio.get(
        "/3/movie/now_playing",
      );

      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);

        return mainMovieModelsFromJson(json);
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
    throw Exception();
  }
}

final apiservicesProvider = Provider<Apiservices>((ref) => Apiservices());
