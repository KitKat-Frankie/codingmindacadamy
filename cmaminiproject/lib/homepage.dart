import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todos =[];
  String input ="";

  createTodos(){
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MYTODOS").doc(input);

    //Map
    Map<String, String> todos= {"todoTile":input};

    documentReference.set(todos).whenComplete((){
      print("$input created");
    });
  }

  deleteTodos(){

  }

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
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder:(BuildContext context){
          return AlertDialog(title:const Text("Add TodoList"),
          content: TextField(onChanged:(String value){
            input = value;
          }),
          actions: <Widget>[
            FlatButton(onPressed: (){
              setState(() {
                todos.add(input);
              });
              Navigator.pop(context);
            }, child: const Text("add")),
          ],);
        });
      },
      child: const Icon(Icons.add,),),

      body:StreamBuilder(
        stream: FirebaseFirestore.instance.collection("MyTodos").snapshots(),
    builder: (context, snapshots) {
      return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(key: Key(todos[index]), child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              margin: const EdgeInsets.all(16),
              elevation: 4,
              child: ListTile(
                  title: Text(todos[index]),
                  trailing: IconButton(onPressed: () {},
                    icon: const Icon(Icons.delete),
                    color: Colors.redAccent,)
              ),));
          });
    })
    );
  }
}
