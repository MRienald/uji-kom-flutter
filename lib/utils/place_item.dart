import 'package:flutter/material.dart';
import 'package:flutter_ujikom_test_2/model/news.dart';
import 'package:get/get.dart';

class PlaceListItem extends StatelessWidget {
  final int index;
  final News mData;
  const PlaceListItem({super.key, required this.index, required this.mData});
  final image = "https://picsum.photos/200/300";

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        splashColor: Colors.orangeAccent,
        onTap: () {

        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(image),
              radius: 30,
            ),
            title: Text(mData.title ?? ''),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                mData.description ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
