import 'package:flutter/material.dart';
import 'package:loader_extensions/data/model/giphy_model.dart';
import 'package:transparent_image/transparent_image.dart';

class GridGifs extends StatelessWidget {
  final List<GiphyModel> giphyList;
  const GridGifs({Key? key, required this.giphyList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: giphyList.length,
      itemBuilder: (_, index) {
        final gif = giphyList[index];
        return FadeInImage.memoryNetwork(
            placeholder: kTransparentImage, image: gif.url);
      },
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
