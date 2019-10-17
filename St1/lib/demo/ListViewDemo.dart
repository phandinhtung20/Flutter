import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

//StatefulWidget
class RandomEnglishWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomEnglishWordsState();//return a state's object. Where is the state's class ?
  }
}

//State
class RandomEnglishWordsState extends State<RandomEnglishWords>{
  final _words = <WordPair>[];
  final _checkedWords = new Set<WordPair>();

  void checkWord(WordPair value) {
    setState(() {
      if (_checkedWords.contains(value)) {
        _checkedWords.remove(value);
      } else {
        _checkedWords.add(value);
      }
    });
  }

  void _toGoDetail() {
    final pageRoute = new MaterialPageRoute(builder: (context) {
      final buildList = _checkedWords.map((word) => new ListTile(
        title: new Text(word.asCamelCase,
                style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      ));      
      
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("List word"),
        ),
        body: new ListView(
          children: buildList.toList()
        ),
      );
    });

    Navigator.of(context).push(pageRoute);
  }

  Widget _getList(WordPair wordPaid, int index) {
    var isCheck = _checkedWords.contains(wordPaid);
    var textColor = index % 2 == 0 ? Colors.green : Colors.brown;
    return new ListTile(
      leading: new Icon(isCheck? Icons.check_box:Icons.check_box_outline_blank),
      title: new Text(wordPaid.asCamelCase, style: TextStyle(color: textColor)),
      onTap: () {
        checkWord(wordPaid);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Check word"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.airplay),
              onPressed: _toGoDetail)
        ],
      ),
      body: new ListView.builder(itemBuilder: (context, index) {
          if (index >= _words.length) {
            _words.addAll(generateWordPairs().take(10));
          }
          return _getList(_words[index], index);
        }
      ),
    );
  }
}

