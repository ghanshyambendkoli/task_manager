import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:task_manager/landing/landing_page.dart';
import 'package:task_manager/localDB/database_helper.dart';
import 'package:task_manager/model/task_model.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: _taskController,
                   
                    validator: (value) {
                   if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                 }
                    },
                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),  
                                      labelText: 'Task Name',
                                    ),
                                  onSaved: (String? value) {
                                    
                                  },
                                ),
                ),
                SizedBox(height: 20,),
                TextField(
            controller: _dateController, 
              decoration: const InputDecoration( 
                        icon: Icon(Icons.calendar_today),
                       labelText: "Enter Date"
                ),
               readOnly: true,  
               onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                          context: context,
                           initialDate: DateTime.now(), 
                          firstDate:DateTime(2023), 
                          lastDate: DateTime(2101)
                      );
                      _dateController.text = pickedDate.toString();
                     
                }
          ),
          Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: _categoryController,
                   
                    validator: (value) {
                   if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                 }
                    },
                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),  
                                      labelText: 'Category',
                                    ),
                                  onSaved: (String? value) {
                                    
                                  },
                                ),
                ),
          const SizedBox(height: 40,),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(onPressed: () async {
               SqliteDatabaseHelper _databaseHelper = SqliteDatabaseHelper();
             var msg =  await _databaseHelper.insertTask(Task(
                name: _taskController.text,
                dueDate: _dateController.text,
                category: _categoryController.text
               ));
               log(msg.toString());
               if(msg!=0){
                Navigator.pop(context);
               }           
    }
              , child:const Text("ADD TASK")))
            ],
          ),
        ),
      ),
    );
  }
}