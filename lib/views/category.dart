import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_hub/data/data.dart';
import 'package:wallpaper_hub/models/wallpaper_hub_model.dart';
import 'package:wallpaper_hub/widgets/widget.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key, required this.categoryName})
      : super(key: key);

  final String categoryName;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<WallpaperHubModel> wallpapers = [];
  //var url = ("https://api.pexels.com/v1/curated?page=2&per_page=40");
  var url = 'https://api.pexels.com/v1/curated?page=2&per_page=80';
  /* Uri.http(
      'https://api.pexels.com', '/v1/curated', {'page': '2&per_page=40'});*/

  getSearchWallpapers(String query) async {
    var response =
        await http.get(Uri.parse(url), headers: {"Authorization": apiKEY});
    dynamic jsonName = response.body.toString();

    Map<String, dynamic> jsonData = jsonDecode(jsonName);
    jsonData["photos"].forEach((element) {
      //print(element);
      WallpaperHubModel wallpaperHubModel = WallpaperHubModel();
      wallpaperHubModel = WallpaperHubModel.fromMap(element);
      wallpapers.add(wallpaperHubModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpapers(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 16.0,
              ),
              wallpaperHubList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}
