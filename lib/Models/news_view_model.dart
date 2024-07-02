import 'package:wellness_wave/Models/api_views.dart';
import 'package:wellness_wave/Models/news_model.dart';

class NewsViewModel{

  final _rep=NewsRepository();
  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async{

    final response= await _rep.fetchCategoriesNewsApi(category);
    return response;
  }
}