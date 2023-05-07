import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Magic 8 Ball'),
        backgroundColor: Colors.blueAccent,
      ),
      body: BallPage(),
    ),
  ),
);

class BallPage extends StatefulWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  State<BallPage> createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballNum = 1;
  final TextEditingController _controller = TextEditingController();

  void changeBall() {
    setState(() {
      ballNum = Random().nextInt(5) + 1;
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                changeBall();
              },
              child: Image.asset('images/ball$ballNum.png'),
            ),
            SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                color: Colors.blue.shade50,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Question',
                  ),
                  onFieldSubmitted: (value) {
                    changeBall();
                  },
                ),
              ),
            ),
          ],
        ),
    );
  }
}

