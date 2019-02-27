import 'package:base_flutter_app/src/data/model/product.dart';
import 'package:base_flutter_app/src/data/resource/repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final _repository = Repository();
  final _productsFetcher = PublishSubject<Product>();

  Observable<Product> get allProducts => _productsFetcher.stream;

  fetchAllProducts() async {
    Product _product = await _repository.fetchAllProducts();
    _productsFetcher.sink.add(_product);
  }

  dispose() {
    _productsFetcher.close();
  }
}

final bloc = HomeBloc();
