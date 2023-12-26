import 'dart:convert';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginUser extends StatefulWidget {
  @override
  _StatefulWidgetExampleState createState() => _StatefulWidgetExampleState();
}

class _StatefulWidgetExampleState extends State<LoginUser> {
  TextEditingController email1=TextEditingController();
  TextEditingController password1=TextEditingController();
  final _formKey = GlobalKey<FormState>();


 void login(String email,String password)async{
  try{
        Response response= await  post(
          Uri.parse('https://reqres.in/api/register'),
          body:{
            'email':email,
            'password': password,
          }
        );
        if(response.statusCode==200){
      Fluttertoast.showToast(
  msg: "Account Create Suceesful",
  toastLength: Toast.LENGTH_SHORT, // Duration for which the toast will be visible
  gravity: ToastGravity.CENTER_RIGHT, // Position of the toast
  timeInSecForIosWeb: 1, // Time for iOS/web
  backgroundColor: Colors.black87,
  textColor: Colors.white, 
); 



        }else{
           Fluttertoast.showToast(
  msg: "Failed",
  toastLength: Toast.LENGTH_SHORT, // Duration for which the toast will be visible
  gravity: ToastGravity.CENTER, // Position of the toast
  timeInSecForIosWeb: 1, // Time for iOS/web
  backgroundColor: Colors.black87,
  textColor: Colors.white, 
); 
        }

  }catch(e){
    print(e.toString());
  }

  }
  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child:
     Scaffold(
        body: Padding(padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            Center(child: Text("Login",style: TextStyle(fontSize: 30,fontStyle:FontStyle.italic),)),
            SizedBox(height: 20),
            TextFormField(
              controller: email1,
              decoration: InputDecoration(
                hintText: 'email'
              ),
              validator: (value) {
                if(value?.isEmpty??true){
                  return "Email cannto be empty";
                }
              },
              
            ),
            SizedBox(
              height: 20,
              
            ),
             TextFormField(
              controller: password1,
              decoration: InputDecoration(
                hintText: 'password'
              ),
              validator: (value) {
              if(value?.isEmpty??true){
                return "password cannot be empty";
              }
              },
              
            ),
            
            SizedBox(height: 40,),
            GestureDetector(
              onTap: () {
                login(email1.text.toString(),password1.text.toString());
                 if (_formKey.currentState?.validate() ?? false) {
            
          }

              },
              child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
              borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Text('Sign Up'),),
            ),
            )
            
          ],
          ),
        ),
        )
      
  
    ), );
    
    
     
  }
}
