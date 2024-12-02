import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/support/widget_support.dart';
import 'home_admin.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {

 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 TextEditingController usernameController = TextEditingController();
 TextEditingController userpassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xffededeb),
      body: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2),
              padding: EdgeInsets.only(top: 45,left: 20, right: 20),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 53, 51, 51),
                      Colors.black,

                    ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,

                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(MediaQuery.of(context).size.width, 110 ),

                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right:  30 , top:  60),
              child: Form(
                key:_formKey ,
                  child: Column(
                    children: [
                      Text(
                        "Let's Start With\nAdmin! ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30,),
                      Material(
                        elevation: 3,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: MediaQuery.of(context).size.height/2.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),

                          ),
                          child: Column(
                            children: [
                              SizedBox(height:50 ,),
                              Container(
                                padding: EdgeInsets.only(left: 20, top: 5,bottom: 5,),
                                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color.fromARGB(255, 160, 160, 147), ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: TextFormField(

                                    controller:usernameController ,
                                    validator:(value){
                                      if(value == null || value.isEmpty){
                                        return " Please enter a username";
                                      }
                                      return null;
                                    } ,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Username",
                                      hintStyle: TextStyle(
                                        color:  Color.fromARGB(255, 160, 160, 147),
                                        fontSize: 18,

                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 40,),
                              Container(
                                padding: EdgeInsets.only(left: 20, top: 5,bottom: 5,),
                                margin: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color.fromARGB(255, 160, 160, 147), ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: TextFormField(
                                    obscureText: true,
                                    controller:userpassController ,
                                    validator:(value){
                                      if(value == null || value.isEmpty){
                                        return " Please enter your password";
                                      }
                                      return null;
                                    } ,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                        color:  Color.fromARGB(255, 160, 160, 147),
                                        fontSize: 18,


                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 40,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeAdmin(),),);
                                  loginAdmin();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  margin:  EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                  width: MediaQuery.of(context).size.width,
                                 decoration: BoxDecoration(
                                   color: Colors.black,
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                  child: Center(
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  loginAdmin()
  {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot){
      for (var result in snapshot.docs) {
        if(result.data()['id'] != usernameController.text.trim()){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color(0xffff5722),
            content: Text(
              'Your id is not correct',
              style: AppWidget.semiBoldTextFieldStyle(),
            ),),);
        }else  if(result.data()['password'] != userpassController.text.trim()){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Color(0xffff5722),
            content: Text(
              'Your password is not correct',
              style: AppWidget.semiBoldTextFieldStyle(),
            ),),);
        }else{
          Route route = MaterialPageRoute(builder: (context)=> HomeAdmin()  );
          Navigator.pushReplacement(context, route);
        }
      }
    });
  }
}
