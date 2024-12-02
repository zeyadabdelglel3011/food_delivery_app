// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/bottom_nav.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/pages/login_page.dart';

import '../widgets/support/widget_support.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email = "" ,password = "" , name = "";

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();


  final _formKey = GlobalKey<FormState>();

  registriation()async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color(0xffff5722),
        content: Text(
        'Registered Successfully',
        style: AppWidget.semiBoldTextFieldStyle(),
      ),),);
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=> HomePage()),);
    }on FirebaseException catch(e){
      if(e.code=='weak-password'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xffff5722),
          content: Text(
          'Password is too weak!!',
          style: AppWidget.semiBoldTextFieldStyle(),
        ),),);

      }
      else if(e.code=='Email-already-in-use '){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Color(0xffff5722),
          content: Text(
          'Account already exists',
          style: AppWidget.semiBoldTextFieldStyle(),
        ),),);
      }
    }
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFff5c30),
                        Color(0xFFe74b1a),

                      ]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40),),
                ),
                child: Text(''),
              ),
              Container(
                margin: EdgeInsets.only(top: 60, left: 20,right: 20),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset('images/logo.png',
                        width: MediaQuery.of(context).size.width/2,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 50,),
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 5,
                      child: Container(
                        padding: EdgeInsets.only(left: 20,right: 20),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/1.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),


                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 30,),
                              Text('Sign Up',
                                style: AppWidget.headerTextFieldStyle(),
                              ),
                              SizedBox(height: 30,),
                              TextFormField(
                                controller: namecontroller,
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return 'Please Enter Name';
                                  }
                                  return null ;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Name',
                                  hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                  prefixIcon: Icon(Icons.person_outline),
                                ),

                              ),
                              SizedBox(height: 40,),
                              TextFormField(
                                controller: emailcontroller,
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return 'Please Enter E-mail';
                                  }
                                  return null ;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                  prefixIcon: Icon(Icons.email_outlined),
                                ),

                              ),
                              SizedBox(height: 40,),
                              TextFormField(
                                controller: passwordcontroller,
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return 'Please Enter Password';
                                  }
                                  return null ;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                  prefixIcon: Icon(Icons.password_outlined),
                                  suffixIcon: Icon(CupertinoIcons.eye_slash),
                                ),

                              ),



                              SizedBox(height: 120,),
                              GestureDetector(
                                onTap: ()async{
                                  if(_formKey.currentState!.validate()){
                                    email = emailcontroller.text;
                                    name = namecontroller.text;
                                    password = passwordcontroller.text;
                                  }
                                  registriation();
                                },
                                child: Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    width:200 ,
                                    padding: EdgeInsets.symmetric(vertical: 8,),
                                    decoration: BoxDecoration(
                                      color: Color(0xffff5722),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.push(context,
                                            MaterialPageRoute(builder: (context)=> BottomNav(),),
                                          );
                                        },
                                        child: Text(
                                          'SIGN UP',
                                          style: TextStyle(color: Colors.white,
                                            fontFamily: 'poppins',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 70,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> LoginPage(),),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
