import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Second Screen",
          style: TextStyle(color: Colors.blue),
        ),
        leading: GestureDetector(
          onTap: () {Navigator.pop(context);},
            child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        )),
        backgroundColor: Colors.white,
      ),
    );
  }
}
