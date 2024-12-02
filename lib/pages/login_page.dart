import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/bottom_nav.dart';
import 'package:food_delivery_app/pages/forgot_password.dart';
import 'package:food_delivery_app/pages/sign_up_page.dart';
import 'package:food_delivery_app/widgets/support/widget_support.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String email = "", password = "" ;
  final _formKey = GlobalKey<FormState>();

  TextEditingController useremailcontroller = TextEditingController();
  TextEditingController userpasscontroller = TextEditingController();

  userLogin()async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseException catch(e){
      if(e.code == 'User-not-Found'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No User Found For that Email' , style: TextStyle(fontSize: 18, color: Colors.black,),),),);
      }
      else if(e.code == 'Wrong Password'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Wrong passwword' , style: TextStyle(fontSize: 18, color: Colors.black,),),),);
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
                        height: MediaQuery.of(context).size.height/2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),


                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 30,),
                              Text('Login',
                                style: AppWidget.headerTextFieldStyle(),
                              ),
                              SizedBox(height: 30,),
                              TextFormField(
                                controller: useremailcontroller,
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return "Please Enter Email";
                                  }
                                  return null ;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: AppWidget.semiBoldTextFieldStyle(),
                                  prefixIcon: Icon(Icons.email),
                                ),

                              ),
                              SizedBox(height: 40,),
                              TextFormField(
                                controller: userpasscontroller,
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return "Please Enter Password";
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
                              SizedBox(height: 40,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword(), ),);
                                },
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text('Forgot Password ? ',
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  ),
                                ),
                              ),
                              SizedBox(height: 90,),
                              GestureDetector(
                                onTap: (){
                                  if(_formKey.currentState!.validate()){
                                    email = useremailcontroller.text;
                                    password = userpasscontroller.text;
                                  }
                                  userLogin();
                                },
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=> BottomNav(),),
                                    );
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
                                            child: Text(
                                              'LOGIN',
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
                          MaterialPageRoute(builder: (context)=> SignUpPage(),),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account ? ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Sign Up',
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
