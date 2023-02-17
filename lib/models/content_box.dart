import 'package:flutter/material.dart';


//Structure of Carousel Boxes initially consisting of title, value and an icon

class ContentBox extends StatelessWidget {
  final String title;
  final dynamic value;
  final String myIcon;

  const ContentBox({super.key, required this.title, required this.value,required this.myIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
              colors: [Colors.black, Colors.black26],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
          Image.asset("assets/PNG/$myIcon",color: Colors.white,width: 70,height: 70,),
          Text(
            "$value°",
            style: const TextStyle(fontSize: 25),
          )
        ],
      ),
    );
  }
}
