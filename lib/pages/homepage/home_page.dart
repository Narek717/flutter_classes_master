import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:indigo/api/indigo_api.dart';
import 'package:indigo/models/product_model.dart';
import 'package:indigo/pages/homepage/settings_page.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsPage(),
      appBar: AppBar(

        title: const Text(
          'Home',
        ),
       actions: [
          PopupMenuButton(
           itemBuilder: (context) {
             return [
               PopupMenuItem(
                 value: 'edit',
                 child: Text('Edit'),
               ),
               PopupMenuItem(
                 value: 'delete',
                 child: Text('Delete'),
               )
             ];
           },
           onSelected: (String value){
             print('You Click on po up menu item');
           },
         ),
       ],
    ),
    );
  }
  Widget _buildBody(BuildContext context) {
    return FutureBuilder(
      future: IndigoAPI().products.getProductsData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data as List<ProductsModel>;

          return ListView.separated(
            itemBuilder: (context, index) {
              return Text(products[index].productName ?? '');
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: products.length,
          );
        } else {
          return const Center(
            child: Text('No Items'),
          );
        }
      },
    );
  }
}
