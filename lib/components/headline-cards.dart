import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HeadlineCards extends StatelessWidget {
  final images = <String>[];
  HeadlineCards() {
    images.addAll([
      'https://vietgiday.com/wp-content/uploads/2019/10/dark-ss2-1.jpg',
      'https://www.brinknews.com/wp-content/uploads/2019/09/GettyImages-854625740.jpg',
      'https://cms.hostelworld.com/hwblog/wp-content/uploads/sites/2/2019/01/26860888698_101111c116_z.jpg',
      'https://www.brinknews.com/wp-content/uploads/2019/09/GettyImages-854625740.jpg',
      'https://vietgiday.com/wp-content/uploads/2019/10/dark-ss2-1.jpg',
    ]);
  }

  Widget _buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'text here',
          style: TextStyle(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('2',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text('2',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Icon(
                  Icons.comment,
                  color: Colors.white,
                )
              ],
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 300, enlargeCenterPage: true),
      items: images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                // padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    new BoxShadow(
                        color: Colors.black26,
                        offset: Offset.zero,
                        blurRadius: 10,
                        spreadRadius: 0)
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: <Widget>[
                        Image(
                          height: 300,
                          fit: BoxFit.cover,
                          image: NetworkImage(image),
                          alignment: Alignment.topLeft,
                        ),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              height: 60,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(color: Colors.black26),
                              child: _buildRow(),
                            ))
                      ],
                    )));
          },
        );
      }).toList(),
    );
  }
}
