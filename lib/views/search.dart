import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper_hub/data/data.dart';
import 'package:wallpaper_hub/models/wallpaper_hub_model.dart';
import 'package:wallpaper_hub/widgets/widget.dart';
import 'package:http/http.dart' as http;

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key, required this.seachQuery}) : super(key: key);

  final String seachQuery;
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController searchController = TextEditingController();
  List<WallpaperHubModel> wallpapers = [];

  getSearchWallpapers(String query) async {
    var url = 'https://api.pexels.com/v1/search?query=$query&per_page=1';
    //"https://api.pexels.com/v1/search?query=$query&per_page=1"

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
    getSearchWallpapers(widget.seachQuery);
    super.initState();
    searchController.text = widget.seachQuery;
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
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F8FD),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: 'search wallpaper',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        getSearchWallpapers(searchController.text.trim());
                      },
                      child: Container(
                        child: const Icon(Icons.search, size: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
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
