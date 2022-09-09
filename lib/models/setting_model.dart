import 'dart:convert';
// List<SettingsModel> usersFromJson(String str) => List<SettingsModel>.from(json.decode(str).map((x) => SettingsModel.fromJson(x)));
// String usersToJson(List<SettingsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SettingsModel {
  SettingsModel({
    this.id,
    this.settingName,
    this.settingValue,
  });

  int? id;
  String? settingName;
  bool? settingValue;

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
    id: json["id"],
    settingName: json["setting_name"],
    settingValue: json["setting_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "setting_name": settingName,
    "setting_value": settingValue,
  };
}
