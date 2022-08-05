import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final TextEditingController searchController = TextEditingController();
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              onTap;
            },
            child: Container(
              child: const Icon(Icons.search, size: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}
