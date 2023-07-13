import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'edit_note_screen.dart';
import 'register.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp();
  runApp( MyApp());
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

class NotesScreen extends StatefulWidget {
  NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List notes = [];

  final firebaseStore = FirebaseFirestore.instance;
  @override
  void initState() {
    // TODO: implement initState
    getNOteFromFirebase();
    super.initState();
  }


  void getNOteFromFirebase(){
    print("===================================");
    firebaseStore.collection("notes").get().then((value) {
      for(var document in value.docs){

        final note = document.data();
        print(note);
        notes.add(note);
        print(notes);
      };
      setState(() {

      });
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("Notes")),),
        floatingActionButton: FloatingActionButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context){
          return AddNewNoteScreen();
        })); },
          child: Icon(Icons.add),
        ),

        body: ListView.builder(itemBuilder: (context, index) {
          return addNoteScreen(note: notes[index]['note'], id: notes[index]['id']);

        },

          itemCount: notes.length,
        )
    );
  }

  Widget addNoteScreen({required String note,required String id})
  {
    return  Container(

      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Text(note,style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          Spacer(),
          IconButton(onPressed: (){

            //
          }, icon: Icon(Icons.edit)),
          IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,)),
        ],
      ),
    );
  }}


