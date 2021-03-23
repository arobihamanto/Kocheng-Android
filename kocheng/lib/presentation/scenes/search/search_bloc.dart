import 'package:kocheng/domain/entities/cat.dart';
import 'package:kocheng/domain/usecases/fetch_cat_images_use_case.dart';
import 'package:kocheng/utils/result.dart';
import 'package:rxdart/rxdart.dart';

abstract class SearchBlocOutput {
  PublishSubject<List<Cat>> cats;
}

abstract class SearchBlocInput {
  void initState();
}

class SearchBloc implements SearchBlocInput, SearchBlocOutput {

  PublishSubject<List<Cat>> _cats = PublishSubject();

  FetchCatImagesUseCase fetchCatImagesUseCase;

  SearchBloc(FetchCatImagesUseCase fetchCatImagesUseCase) {
    this.fetchCatImagesUseCase = fetchCatImagesUseCase;
    cats = _cats.stream;
  }

  @override
  void initState() async {
    fetchCatImages();
  }

  SearchBlocOutput get outputs => this;
  SearchBlocInput get inputs => this;

  void fetchCatImages() async {
    final result = await fetchCatImagesUseCase.execute();

    if (result is Success) {
      _cats.sink.add(result.value);
    }

    if (result is Error) {
      print(result);
    }
  }

  dispose() async {
    _cats.close();
    cats.close();
  }

  @override
  PublishSubject<List<Cat>> cats;

}