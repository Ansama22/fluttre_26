import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:NotesScreen ());
  }
}
class NotesScreen  extends StatelessWidget {
  NotesScreen({Key? Key}) : super(key: Key);
  List<Model> chats = [
    Model(name: "Laurent", img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlpig018McXiXJ8vmnYMkUNSmHEOL4hEpUnw&usqp=CAU", time: "20:18", message: "How about meeting tomorrow?"),
    Model(name: "Tracy", img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR3ogSPq6zNFNc5dirBvAZTqWJ5DlgOIj0ZQ&usqp=CAU", time: "19:22", message: "I love that idea,it is great"),
    Model(name: "Claire", img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHDadMOYLiYzTK8NxlB-0flKck718YdtiuOYxnKsufTajW87ooNGO1KsZmDrqCmpCf6M0&usqp=CAU", time: "14:34", message: "I will not come today"),
    Model(name: "Joe", img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi4kGmwg6pa5yDe4bKR2mglEpEVohV1CycMQ&usqp=CAU", time: "11:05", message: "Immediately"),
    Model(name: "Mark", img: "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1", time: "09:46", message: "I will not be able to finish it"),
    Model(name: "Williams", img: "https://images.pexels.com/photos/2341350/pexels-photo-2341350.jpeg?cs=srgb&dl=pexels-jan-tafel-2341350.jpg&fm=jpg", time: "08:15", message: "I went to a university trip"),



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: const Text("Message"))

      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return chatItem(img: chats[index].img, time: chats[index].time, name: chats[index].name, message: chats[index].message);

      },
        itemCount: chats.length,
      ),

    );
  }
}


Widget chatItem({required String img, required String name, required String time, required String message}){
  return   Container(
    margin: EdgeInsets.all(7),
    padding: EdgeInsets.all(3),
    decoration: const BoxDecoration(
        border: Border(

            bottom: BorderSide(width: 1,color: Colors.grey))),


    child: Row(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage:NetworkImage(img
            ),

          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Text(name),
                SizedBox(width: 10,),
                Text(time),
              ],),
              Text(message),
            ],
          ),
          Spacer(), Icon(Icons.arrow_forward_ios_rounded),

        ]
    ),
  );
}

class Model{
  String name;
  String img;
  String time;
  String message;

  Model({required this.name, required this.img, required this.time, required this.message});
}