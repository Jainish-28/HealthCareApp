import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:wellness_wave/Models/news_model.dart';


class NewsRepository{

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    String url =
        'https://newsapi.org/v2/everything?q=${category}&apiKey=921cc0b2293e47c3a79bb57333024dce';

    final response = await http.get(Uri.parse(url));

    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      final body=jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception("Error");
  }
}