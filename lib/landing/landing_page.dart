import 'package:flutter/material.dart';
import 'package:task_manager/landing/create_task.dart';

import '../model/task_model.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios)),
        actions:  [
          InkWell(
            onTap: () {
               Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CreateTask()));
            },
            child: Container(
              margin: EdgeInsets.only(right: 10),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(10),
              ),
              
              child: Icon(Icons.add,size: 30,color: Colors.white,)),
          )],
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: const Column(
          children: [
            Text("My Tasks",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
          ],
        ),
      ),
    );
  }
}