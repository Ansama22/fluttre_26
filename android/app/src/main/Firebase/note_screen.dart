
import 'package:flutter/material.dart';

import 'add_note_screen.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  runApp( MyApp());
}

class Firebase {
  static initializeApp() {}
}

class MyApp extends StatelessWidget {
  MyApp({super.key});




  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:NotesScreen ());
  }
}

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Notes")),),
      floatingActionButton: FloatingActionButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context){
        return AddNewNoteScreen();
      })); },
        child: Icon(Icons.add),
      ),

      body: Column(children: [

        Container(

          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10)
          ),
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Text("note",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,)),
            ],
          ),
        )

      ],),
    );
  }
}