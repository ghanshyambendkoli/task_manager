import 'package:flutter/material.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  final _formKey = GlobalKey<FormState>();

  bool validateStructure(String value){
        String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        RegExp regExp = RegExp(pattern);
        return regExp.hasMatch(value);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
           children: [
           const Text("LOGIN",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.purple),),
           const SizedBox(height:10),
            Container(
              padding: const EdgeInsets.only(left: 10),
              
              child: TextFormField(
                validator: (value) {
                  //empty string validation 
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                 }
                 // using regular expression
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return "Please enter a valid email address";
                }
                return null;
                },
                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                ),
                              onSaved: (String? value) {
                                
                              },
                            ),
            ),
            const SizedBox(height: 15,),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                obscureText: true,
                validator: (value) {
                if (value == null || value.isEmpty) {
                 return 'Please enter some text';
                 }
                if(!validateStructure(value)){
                  return "Password must contain capital, numeric, special char";
                }
                return null;
                },
                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),  
                                  labelText: 'Password',
                                ),
                              onSaved: (String? value) {
                                
                              },
                            ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(onPressed: (){
                 if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
      
    }
  
              }, child:const Text("LOGIN")))
           ],
          ),
        ),
      ),
    );
  }
}