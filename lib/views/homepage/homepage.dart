import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:wallpaper_hub/category_tile/category_tile.dart';
import 'package:wallpaper_hub/data/data.dart';
import 'package:wallpaper_hub/models/categories_model.dart';
import 'package:wallpaper_hub/models/wallpaper_hub_model.dart';
import 'package:wallpaper_hub/utils/utils.dart';
import 'package:wallpaper_hub/views/search.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:wallpaper_hub/widgets/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoriesModel> categories = [];
  List<WallpaperHubModel> wallpapers = [];

  var url = ("https://api.pexels.com/v1/curated?page=2&per_page=80");

  //https://api.pexels.com/v1/curated?page=2&per_page=40

  TextEditingController searchController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  getTrendingWallpapers() async {
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
    getTrendingWallpapers();
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: brandName(),
        elevation: 0.0,
        backgroundColor: Colors.white54,
        leading: IconButton(
          icon: const Icon(
            Icons.logout_outlined,
            color: Colors.blue,
          ),
          onPressed: () => FirebaseAuth.instance.signOut(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.black87,
            ),
            onPressed: () {},
          )
        ],
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchWidget(
                                seachQuery: searchController.text.trim()),
                          ),
                        );
                      },
                      child: Container(
                        child: const Icon(Icons.search, size: 20.0),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10.0,
              ),
              Container(
                height: 80.0,
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoriesTile(
                        imgUrl: categories[index].imgUrl!,
                        title: categories[index].categoriesName!,
                      );
                    }),
              ),
              
              const SizedBox(
                height: 5.0,
              ),

              wallpaperHubList(wallpapers: wallpapers, context: context)
            ],
          ),
        ),
      ),
    );
  }
}

