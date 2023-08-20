import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_manager/landing/create_task.dart';
import 'package:task_manager/localDB/database_helper.dart';

import '../model/task_model.dart';
import 'package:intl/intl.dart';



class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // instance of DB
  SqliteDatabaseHelper _databaseHelper = SqliteDatabaseHelper();

  // list for all Task data
   List<Task> listdata=[];
  @override
  void initState() {
    _databaseHelper.getDataBase();
   getDBData();
    super.initState();
  }
  // for getting all user data
  getDBData() async {
    listdata = await _databaseHelper.getAllTask();
    setState(() {
      
    });
  }

  //format date 
  formatDate(date){
    final DateFormat formatter = DateFormat('dd-MMM-yy');
  final String formatted = formatter.format(DateTime.parse(date));
    // listdata[index].dueDate;
    return formatted;
  }
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
                      MaterialPageRoute(builder: (context) => CreateTask())).then((value){
                        getDBData();
                      } );
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
        child:  Column(
          children: [
            Text("My Tasks",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
          Container(
            height: 500,
            child: ListView.builder(
                itemCount: listdata.length,
                itemBuilder:(context, index) {
                  return ListTile(
                    title: Text(listdata[index].name!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                    subtitle: Text(listdata[index].category!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                    trailing: Text(formatDate(listdata[index].dueDate!)),
                  );
                },
              ),
          )
          ],
        ),
      ),
    );
  }
}