import 'package:flutter/material.dart';
import 'package:flutter_ujikom_test_2/model/news.dart';
import 'package:flutter_ujikom_test_2/utils/place_item.dart';
import 'package:shimmer/shimmer.dart';

class PlacesShimmer extends StatelessWidget {
  PlacesShimmer({Key? key}) : super(key: key);

  static final beginColor = Colors.grey.withOpacity(0.05);
  static const endColor = Colors.white;

  final Gradient gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
    colors: [beginColor, beginColor, endColor, beginColor, beginColor],
    stops: const [0.0, 0.35, 0.5, 0.65, 1.0],
  );

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: gradient,
      child: _buildPlaceListShimmer(),
    );
  }
}

List<News> _dummyPlace() {
  List<News> data = [];

  for (int i = 0; i < 9; i++) {
    var usr = News(id: i.toString(), title: "name", author: "email");
    data.add(usr);
  }
  return data;
}

ListView _buildPlaceListShimmer() {
  return ListView.builder(
    itemCount: _dummyPlace().length,
    itemBuilder: (context, index) {
      return PlaceListItem(
        index: index,
        mData: _dummyPlace()[index],
      );
    },
  );
}
