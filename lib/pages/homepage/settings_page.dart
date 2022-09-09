import 'package:flutter/material.dart';
import 'package:indigo/models/setting_model.dart';
import '../../api/indigo_api.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late Text text;
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
  Widget _buildBody(BuildContext context) {

    return FutureBuilder(
      future: IndigoAPI().settings.getSettingsData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          final settings = snapshot.data as List<SettingsModel>;

          return ListView.separated(
            itemBuilder: (context, index) {
               text = Text(settings[index].settingName ?? 'no items');
              return text;
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: settings.length,
          );
        } else {
          return const Center(
            child: Text('Items'),
          );
        }
      },
    );
  }
}
