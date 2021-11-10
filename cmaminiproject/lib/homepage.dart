import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todos =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.white70,
        title: const Text("Todo",
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.normal
          ),),
        centerTitle: true,
      ),

      //body: ,

    );
  }
}
