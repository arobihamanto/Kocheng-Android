import 'package:kocheng/data/repositories/cat_repository.dart';
import 'package:kocheng/utils/result.dart';

abstract class FetchCatImagesUseCaseType {
  Future<Result> execute();
}

class FetchCatImagesUseCase implements FetchCatImagesUseCaseType {

  final CatRepository _catRepository;

  FetchCatImagesUseCase(this._catRepository);

  @override
  Future<Result> execute() async {
    final result = await _catRepository.fetchCatImages();
    if (result is Error) {
      return Result.error(result.message);
    }
    if (result is Success) {
      return Result.success(result.value);
    }
    return null;
  }

}
