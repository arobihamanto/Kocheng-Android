import 'package:flutter/material.dart';
import 'package:kocheng/data/repositories/cat_repository.dart';
import 'package:kocheng/domain/usecases/fetch_cat_images_use_case.dart';
import 'package:kocheng/presentation/scenes/search/search_bloc.dart';

class SearchScene extends StatefulWidget {

  final bloc = SearchBloc(FetchCatImagesUseCase(CatRepository()));

  @override
  _SearchSceneState createState() => _SearchSceneState();
}

class _SearchSceneState extends State<SearchScene> {

  var imageUrl = '';

  @override
  void initState() {
    super.initState();
    widget.bloc.initState();
    _bindBloc();
  }

  void _bindBloc() {
    widget.bloc.outputs.cats.listen((value) {
      setState(() {
        imageUrl = value.first.url;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: imageUrl == '' ? Container() :
      GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        onTap: () {
          widget.bloc.initState();
        },
      ),
    );
  }

}
