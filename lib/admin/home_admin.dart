import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/add_food.dart';
import 'package:food_delivery_app/widgets/support/widget_support.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: [
            Center(
              child: Text(
                'Home Admin',
                style: AppWidget.headerTextFieldStyle(),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddFood(),),);
              },
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color:  Colors.black,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Image.asset('images/food.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),

                        ),
                        SizedBox(width: 40,),
                        Text(
                          textAlign: TextAlign.center,
                          'Add Food Items',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'poppins',


                          ) ,
                        ),
                      ],
                    ),
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
