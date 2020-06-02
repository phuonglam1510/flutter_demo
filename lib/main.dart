import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:grah_app/components/headline-cards.dart';
import 'package:grah_app/components/story-item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grah App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                  text: 'All',
                ),
                Tab(
                  icon: Icon(Icons.kitchen),
                  text: 'Horror',
                ),
                Tab(
                  icon: Icon(Icons.face),
                  text: 'Funny',
                ),
              ],
            ),
            title: Text('Grah'),
          ),
          body: TabBarView(
            children: [
              Container(padding: const EdgeInsets.all(16), child: StoryList()),
              Container(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    children: <Widget>[HeadlineCards()],
                  )),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

class Tabs extends StatefulWidget {
  @override
  TabsState createState() => TabsState();
}

class TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[Text('All'), Text('Horor'), Text('Funny')]);
  }
}

class StoryList extends StatelessWidget {
  final _list = <WordPair>[];
  @override
  Widget build(BuildContext context) {
    _list.addAll(generateWordPairs().take(50));

    return _buildList();
  }

  Widget _buildList() {
    return ListView.builder(itemBuilder: (contxt, i) {
      if (i > _list.length - 1) {
        return null;
      }
      return StoryItem(item: _list[i]);
    });
  }
}
