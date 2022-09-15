import 'package:flutter/material.dart';
import 'package:wallpaper_hub/models/wallpaper_hub_model.dart';
import 'package:wallpaper_hub/views/image_view.dart';

Widget brandName() {
  return RichText(
    text: const TextSpan(
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      children: <TextSpan>[
        TextSpan(
          text: 'Pics',
          style: TextStyle(color: Colors.black87),
        ),
        TextSpan(
          text: ' Hub',
          style: TextStyle(color: Colors.blue),
        ),
      ],
    ),
  );
}

Widget wallpaperHubList({List<WallpaperHubModel>? wallpapers, context}) {
  int numbersOfPage = 2;
  double childAspectRatios = 0.6;
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      crossAxisCount: numbersOfPage,
      childAspectRatio: childAspectRatios,
      mainAxisSpacing: 6.0,
      children: wallpapers!.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ImageViewer(imgUrl: wallpaper.src!.portrait!),
                ),
              );
            },
            child: Hero(
              tag: wallpaper.src!.portrait!,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    wallpaper.src!.portrait!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}

Widget wallpapersWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 40,
        width: 150,
        decoration: const BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.only(topLeft: Radius.zero)),
        child: const Center(
          child: Text(
            'Wallpapers',
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final Function() onTap;
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: icon,
      label: Text(text),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20.0),
        fixedSize: Size(250, 65),
        textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        primary: Colors.lightBlueAccent,
        onPrimary: Colors.white,
        elevation: 15,
        shadowColor: Colors.blue,
        side: BorderSide(color: Colors.black87, width: 2),
        //shape: StadiumBorder(),
      ),
    );
  }
}
