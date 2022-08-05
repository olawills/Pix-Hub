import 'package:flutter/material.dart';
import 'package:wallpaper_hub/views/category.dart';

class CategoriesTile extends StatelessWidget {
  const CategoriesTile({Key? key, required this.imgUrl, required this.title})
      : super(key: key);

  final String imgUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryWidget(
              categoryName: title.toLowerCase(),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 4),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgUrl,
                height: 50,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              // color: Colors.black26,
              // decoration: BoxDecoration(
              //   color: Colors.black26,
              //   borderRadius: BorderRadius.circular(8),
              // ),
              height: 50,
              width: 200,
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
