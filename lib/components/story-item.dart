import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:grah_app/pages/detail.dart';

class StoryItem extends StatelessWidget {
  StoryItem({@required this.item});

  final WordPair item;

  Widget _buildTransition(context, animation, secondaryAnimation, child) {
    var begin = Offset(0, 1);
    var end = Offset.zero;
    var curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => DetailPage(
              item: item,
            ),
            transitionsBuilder: _buildTransition,
          ));
        },
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: Text(item.asCamelCase),
                subtitle: Text(item.asLowerCase),
                trailing: Icon(Icons.favorite_border),
                leading: Hero(
                    tag: item.asCamelCase,
                    child: Image(
                      image: NetworkImage(
                          'https://vietgiday.com/wp-content/uploads/2019/10/dark-ss2-1.jpg'),
                    )),
              )
            ]),
      ),
    );
  }
}
