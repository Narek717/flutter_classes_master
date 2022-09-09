import 'package:dio/dio.dart';
import 'package:indigo/models/setting_model.dart';

class SettingsApi {
  final Dio appDioClient;

  SettingsApi(
      this.appDioClient,
      );
  Future<List<SettingsModel>> getSettingsData() async {
    List<SettingsModel> settings = [];

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/settings',
    );
    if (result.data is List) {
      settings = result.data.map<SettingsModel>(
            (e) => SettingsModel.fromJson(e),
      )
          .toList();
    }
    return settings;
  }
}
