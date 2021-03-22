import 'dart:convert';

import 'package:kocheng/domain/entities/cat.dart';
import 'cat_api_provider.dart';

abstract class CatApiServiceType {

  Future<List<Cat>> fetchCatImages();

}


class CatApiService implements CatApiServiceType {

  ApiProvider _provider = ApiProvider();

  @override
  Future<List<Cat>> fetchCatImages() async {
    final response = await _provider.get("/images/search");
    final catList = List<Cat>.from(response.map((x) => Cat.fromMap(x)));
    return catList;
  }


}