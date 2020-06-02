import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({this.item});

  final WordPair item;
  final EdgeInsets padding = const EdgeInsets.all(20);

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Detail page'),
      // ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                    tag: item.asCamelCase,
                    child: Image(
                      image: NetworkImage(
                          'https://vietgiday.com/wp-content/uploads/2019/10/dark-ss2-1.jpg'),
                    )),
                Positioned(
                    top: MediaQuery.of(context).padding.top,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: padding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                              splashColor: Colors.black54,
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 30,
                              )),
                          Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            Padding(
              padding: padding,
              child: Text('Movie Title here',
                  style: Theme.of(context).textTheme.headline4),
            )
          ],
        ),
      ),
    );
  }
}
