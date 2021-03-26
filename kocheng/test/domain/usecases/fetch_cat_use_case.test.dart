import 'package:flutter_test/flutter_test.dart';
import 'package:kocheng/domain/entities/cat.dart';
import 'package:kocheng/domain/interface/cat_repository_type.dart';
import 'package:kocheng/domain/usecases/fetch_cat_images_use_case.dart';
import 'package:kocheng/utils/result.dart';

class CatRepositoryMock implements CatRepositoryType {

  Result result;

  CatRepositoryMock({this.result});

  @override
  Future<Result> fetchCatImages() {
    return Future.value(result);
  }

}

List<Cat> cats = [
  Cat(id: 'kjbe33', height: 500, width: 500, breeds: []),
  Cat(id: 'ljn234', height: 500, width: 500, breeds: []),
  Cat(id: 'l324n0', height: 500, width: 500, breeds: [])
];

void main() {
  test('Fetch cat images success test', () async {

    // given
    final repository = CatRepositoryMock(result: Result.success(cats));
    final useCase = FetchCatImagesUseCase(repository);

    // when
    final result = await useCase.execute();
    bool isSuccess = false;

    if (result is Success) {
      isSuccess = true;
    }

    if (result is Error) {
      isSuccess = false;
    }

    // then
    expect(true, isSuccess);
  });

  test('Fetch cat images failure test', () async {

    // given
    final repository = CatRepositoryMock(result: Result.error('Error when fetch cat'));
    final useCase = FetchCatImagesUseCase(repository);

    // when
    final result = await useCase.execute();
    bool isSuccess = false;

    if (result is Success) {
      isSuccess = true;
    }

    if (result is Error) {
      isSuccess = false;
    }

    // then
    expect(false, isSuccess);
  });
}