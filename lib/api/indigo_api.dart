import 'package:dio/dio.dart';
import 'package:indigo/api/products/products_api.dart';
import 'package:indigo/api/products/settings_api.dart';

class IndigoAPI {
  static IndigoAPI? _singleton;

  late ProductsApi products;
  Dio appDioClient = Dio();
  late SettingsApi settings;


  factory IndigoAPI() {
    if (_singleton == null) {
      _singleton = IndigoAPI._internal();
    }
    return _singleton!;
  }

  IndigoAPI._internal() {
    // Init subclasses
    products = ProductsApi(appDioClient);
    settings = SettingsApi(appDioClient);
  }
}
