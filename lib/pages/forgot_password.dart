import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/sign_up_page.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  TextEditingController mailController = TextEditingController();

  String email = " ";

  final _formKey = GlobalKey<FormState>();

  resetPassword()async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Password Reset Email has been sent !!', style: TextStyle(
        fontSize: 18,
      ),
      ),
      ),
      );
    }on FirebaseException catch(e){
      if(e.code == "User-not-found"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('No user for that email', style: TextStyle(
            fontSize: 18,),
        ),
        )
        );

      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 70,),
            Container(
              alignment: Alignment.topCenter,
              child: Text('Password Recovery',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
            SizedBox(height: 10,),
            Text('Enter Your Email',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
                child: Form(
                  key: _formKey,
                  child:Padding(padding: EdgeInsets.only(left: 10),
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white70, width: 2.0),
                            borderRadius: BorderRadius.circular(20),

                          ),
                          child: TextFormField(
                            controller:mailController ,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Please enter email";
                              }
                              return null ;
                            },
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,

                              ),
                              prefixIcon: Icon(Icons.person, color: Colors.white70, size: 30,),
                              border: InputBorder.none,

                            ),

                          ),
                        ),
                        SizedBox(height: 40,),

                              GestureDetector(
                                onTap: (){
                                  if(_formKey.currentState!.validate()){
                                    email = mailController.text;
                                  }
                                  resetPassword();

                                },

                                child: Container(
                                  width: 140,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text("Send Email",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account ? ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,

                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage(),),);
                              },
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                  color: Color.fromARGB(225, 184, 166, 6),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                            ],
                          ),
                        ),



                ),
                ),



          ],
        ),
      ),
    );
  }
}
