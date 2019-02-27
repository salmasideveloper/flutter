import 'package:base_flutter_app/src/data/model/product.dart';
import 'package:base_flutter_app/src/res/values/strings.dart';
import 'package:base_flutter_app/src/ui/home/home_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text(strAppBarTitle),
      ),
      body: StreamBuilder(
        stream: bloc.allProducts,
        builder: (context, AsyncSnapshot<Product> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<Product> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}',
            fit: BoxFit.cover,
          );
        });
  }
}
