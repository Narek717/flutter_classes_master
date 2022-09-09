import 'package:dio/dio.dart';
import 'package:indigo/models/product_model.dart';

class ProductsApi {
  final Dio appDioClient;

  ProductsApi(
    this.appDioClient,
  );
  Future<List<ProductsModel>> getProductsData() async {
    List<ProductsModel> products = [];

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/products',
    );
    if (result.data is List) {
      products = result.data.first
          .map<ProductsModel>(
            (e) => ProductsModel.fromJson(e),
          )
          .toList();
    }
    return products;
  }
}
