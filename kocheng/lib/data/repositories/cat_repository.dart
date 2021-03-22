import 'package:kocheng/domain/interface/cat_repository_type.dart';
import 'package:kocheng/infrastructure/network/cat_api_service.dart';
import 'package:kocheng/utils/result.dart';

class CatRepository implements CatRepositoryType {

  final _catService = CatApiService();

  @override
  Future<Result> fetchCatImages() async {
    final cats = await _catService
        .fetchCatImages()
        .catchError((e, s){
          return Result.error(e);
    });
    return Result.success(cats);
  }

}