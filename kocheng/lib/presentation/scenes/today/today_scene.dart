import 'package:flutter/material.dart';
import 'package:kocheng/data/repositories/cat_repository.dart';
import 'package:kocheng/domain/usecases/fetch_cat_images_use_case.dart';
import 'package:kocheng/presentation/scenes/search/search_scene.dart';
import 'package:kocheng/presentation/scenes/today/today_bloc.dart';

class TodayScene extends StatefulWidget {

  final bloc = TodayBloc(FetchCatImagesUseCase(CatRepository()));

  @override
  _TodaySceneState createState() => _TodaySceneState();
}

class _TodaySceneState extends State<TodayScene> {

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
      appBar: AppBar(
        title: Text('Today\'s Cat'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SearchScene();
            },));
          },)
        ],
      ),
      body: imageUrl == '' ? Container() :
      GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
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
