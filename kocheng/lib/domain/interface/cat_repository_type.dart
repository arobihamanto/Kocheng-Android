import 'package:kocheng/utils/result.dart';

abstract class CatRepositoryType {
  Future<Result>fetchCatImages();
}