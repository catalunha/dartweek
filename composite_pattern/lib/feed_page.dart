import 'package:composite_pattern/feed/feed.dart';
import 'package:composite_pattern/feed/feed_image.dart';
import 'package:composite_pattern/feed/feed_youtube.dart';
import 'package:composite_pattern/feed/ifeed.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  List<IFeed> feed = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    feed.add(Feed(text: 'Enviando mensagem de texto'));
    // feed.add(FeedImage(
    //     text: 'Enviando imagem',
    //     url:
    //         'https://t1.uc.ltmcdn.com/pt/images/3/7/6/img_o_que_significa_pagar_o_pato_23673_orig.jpg'));
    feed.add(FeedYoutube(text: 'Youtube Video', videoId: 'mhA-jE3YpMM'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: feed.length,
          itemBuilder: (context, index) => feed[index].render(),
        ));
  }
}
