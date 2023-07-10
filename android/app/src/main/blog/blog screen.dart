import 'package:flutter/material.dart';

import 'add_blog_screen.dart';
import 'blogs_model.dart';
import 'edit_blog_screen.dart';
//import "package:untitled/blog/add_blog_screen.dart";
//import 'package:untitled/blog/blogs_model.dart';
//import 'package:untitled/blog/edit_blog_screen.dart';

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
          primarySwatch: Colors.amber,
        ),
        home:BlogScreen ());
  }
}
class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();

}


class _BlogScreenState extends State<BlogScreen> {
  final String imageUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-nhGym1zx_bYU3B507_qNQ2CAR3yT7R-qeA&usqp=CAU";
  final String name = "Ansam";

  final String blogImageUrl =
      "https://imgd.aeplcdn.com/1056x594/n/cw/ec/44686/activa-6g-right-front-three-quarter.jpeg";

  List<BlogsModel> blogs = [
    // BlogsModel("image", "title", "body")de

  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {

        Navigator.push(context, MaterialPageRoute(builder: (context) => AddBlogScreen(),)).then((value) {
          BlogsModel blog = value;
          blogs.add(blog);
          setState(() {

          });

        },);
      },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Center(child: const Text("Blog")),
      ),

      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 8,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => userItem(),
            ),
          ),
          Expanded(

            child: ListView.builder(
              itemCount: blogs.length,
              itemBuilder: (context, index) => blogItem(index),
            ),
          )
        ],
      ),
    );
  }

  userItem() {
    return Container(
      margin: EdgeInsets.all(7),

      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(

                radius: 25,
                backgroundImage: NetworkImage(imageUrl ) ,
              ),
              CircleAvatar(

                radius: 10,
                backgroundColor: Colors.green,
              ),

            ],
          ),
          Text("Ansam")
        ],
      ),
    );
  }
  Widget blogItem(int index) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // border: const Border.fromBorderSide(
        //   BorderSide(color: Colors.black),
        // ),
        color: Colors.grey[300],
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.network(
              blogs[index].image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(blogs[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return EditBlogScreen ();
                    },)) .then((value)  {
                      BlogsModel blog = value ;
                      blogs[index]=blog;
                      setState(() {

                      });
                    });
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.purple,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    blogs.removeAt(index);
                    setState(() {

                    });

                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              blogs[index].body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );

  }
}