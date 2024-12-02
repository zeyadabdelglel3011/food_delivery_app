import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/details_page.dart';
import 'package:food_delivery_app/service/database.dart';
import 'package:food_delivery_app/widgets/support/widget_support.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool iceCream = false , pizza = false , salad = false, burger = false ;


  Stream? foodItemStream ;

  ontheLoad()async{
    foodItemStream = await DatabaseMethods().getFoodItem("pizza");
    setState(() {

    });
  }
  @override
  void initState() {
  ontheLoad();
    super.initState();
  }

  Widget allItems(){
    return StreamBuilder(
        stream: foodItemStream ,
        builder:(context , AsyncSnapshot snapshot){
        return snapshot.hasData? ListView.builder(
          padding: EdgeInsets.zero,
            itemCount: snapshot.data.docs.length,
            shrinkWrap:  true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context , index) {

            DocumentSnapshot ds = snapshot.data.docs[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage(),),);
              },

              child: Row(

                children: [
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 5,
                      child: Container(

                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment : CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              ds["Image"],
                              height:150,
                              width: 150 ,
                              fit: BoxFit.cover,),
                            Text(ds["Name"],
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),
                            SizedBox(height: 5,),
                            Text('fresh and Healthy',
                              style: AppWidget.lightTextFieldStyle(),
                            ),
                            SizedBox(height: 5,),
                            Text("\$"+ ds["Price"],
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 5,
                      child: Container(

                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment : CrossAxisAlignment.start,
                          children: [
                            Image.asset('images/salad4.png', height:150, width: 150 , fit: BoxFit.cover,),
                            Text('Mix Veg Salad',
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),
                            SizedBox(height: 5,),
                            Text('Spicy with Onion',
                              style: AppWidget.lightTextFieldStyle(),
                            ),
                            SizedBox(height: 5,),
                            Text('\$28',
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 5,
                      child: Container(

                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment : CrossAxisAlignment.start,
                          children: [
                            Image.asset('images/salad2.png', height:150, width: 150 , fit: BoxFit.cover,),
                            Text('Veggie Taco Hash',
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),
                            SizedBox(height: 5,),
                            Text('fresh and Healthy',
                              style: AppWidget.lightTextFieldStyle(),
                            ),
                            SizedBox(height: 5,),
                            Text('\$25',
                              style: AppWidget.semiBoldTextFieldStyle(),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),

                ],
              ),
            );

            }):CircularProgressIndicator();
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(top: 50  , left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    'Hello Zeyad,',
                   style: AppWidget.boldTextFieldStyle(),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Delicious Food',
                style: AppWidget.headerTextFieldStyle(),
              ),
              Text(
                'Discover and Get Great food',
                style: AppWidget.lightTextFieldStyle(),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(right: 20),
                  child: showItem()),
              SizedBox(height: 30,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage(),),);
                  },

                  child: Row(

                    children: [
                      Container(
                        margin: EdgeInsets.all(4),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 5,
                          child: Container(

                            padding: EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment : CrossAxisAlignment.start,
                              children: [
                                Image.asset('images/salad2.png', height:150, width: 150 , fit: BoxFit.cover,),
                                Text('Veggie Taco Hash',
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),
                                SizedBox(height: 5,),
                                Text('fresh and Healthy',
                                  style: AppWidget.lightTextFieldStyle(),
                                ),
                                SizedBox(height: 5,),
                                Text('\$25',
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Container(
                        margin: EdgeInsets.all(4),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 5,
                          child: Container(

                            padding: EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment : CrossAxisAlignment.start,
                              children: [
                                Image.asset('images/salad4.png', height:150, width: 150 , fit: BoxFit.cover,),
                                Text('Mix Veg Salad',
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),
                                SizedBox(height: 5,),
                                Text('Spicy with Onion',
                                  style: AppWidget.lightTextFieldStyle(),
                                ),
                                SizedBox(height: 5,),
                                Text('\$28',
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Container(
                        margin: EdgeInsets.all(4),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          elevation: 5,
                          child: Container(

                            padding: EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment : CrossAxisAlignment.start,
                              children: [
                                Image.asset('images/salad2.png', height:150, width: 150 , fit: BoxFit.cover,),
                                Text('Veggie Taco Hash',
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),
                                SizedBox(height: 5,),
                                Text('fresh and Healthy',
                                  style: AppWidget.lightTextFieldStyle(),
                                ),
                                SizedBox(height: 5,),
                                Text('\$25',
                                  style: AppWidget.semiBoldTextFieldStyle(),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('images/salad4.png',
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                SizedBox(
                                  width :MediaQuery.of(context).size.width/2 ,
                                  child: Text(
                                    'Mediterranean Chickpea  Salad',
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                SizedBox(
                                  width :MediaQuery.of(context).size.width/2 ,
                                  child: Text(
                                    'Honey goot cheese ',
                                    style: AppWidget.lightTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                SizedBox(
                                  width :MediaQuery.of(context).size.width/2 ,
                                  child: Text(
                                    '\$28',
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('images/salad2.png',
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                SizedBox(
                                  width :MediaQuery.of(context).size.width/2 ,
                                  child: Text(
                                    'Veggie Taco Hash',
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                SizedBox(
                                  width :MediaQuery.of(context).size.width/2 ,
                                  child: Text(
                                    'fresh and Healthy',
                                    style: AppWidget.lightTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                SizedBox(
                                  width :MediaQuery.of(context).size.width/2 ,
                                  child: Text(
                                    '\$28',
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('images/salad4.png',
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                SizedBox(
                                  width :MediaQuery.of(context).size.width/2 ,
                                  child: Text(
                                    'Mediterranean Chickpea  Salad',
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                SizedBox(
                                  width :MediaQuery.of(context).size.width/2 ,
                                  child: Text(
                                    'Honey goot cheese ',
                                    style: AppWidget.lightTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                SizedBox(
                                  width :MediaQuery.of(context).size.width/2 ,
                                  child: Text(
                                    '\$28',
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('images/salad2.png',
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                SizedBox(
                                  width :MediaQuery.of(context).size.width/2 ,
                                  child: Text(
                                    'Veggie Taco Hash',
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                SizedBox(
                                  width :MediaQuery.of(context).size.width/2 ,
                                  child: Text(
                                    'fresh and Healthy',
                                    style: AppWidget.lightTextFieldStyle(),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                SizedBox(
                                  width :MediaQuery.of(context).size.width/2 ,
                                  child: Text(
                                    '\$28',
                                    style: AppWidget.semiBoldTextFieldStyle(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),


                ],
              ) ,

              ),

            ],
          ),
        ),
      ),


    ) ;

  }
  Widget showItem(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async{
            pizza = true ;
            iceCream = false ;
            salad = false ;
            burger = false ;

            foodItemStream = await DatabaseMethods().getFoodItem("Pizza");
            setState(() {

            });
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: pizza? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset('images/pizza.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: pizza ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: ()async{
            pizza = false ;
            iceCream = false ;
            salad = false ;
            burger = true ;
            foodItemStream = await DatabaseMethods().getFoodItem("Burger");
            setState(() {

            });
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: burger? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset('images/burger.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: burger? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: ()async{
            pizza = false ;
            iceCream = true ;
            salad = false ;
            burger = false ;
            foodItemStream = await DatabaseMethods().getFoodItem("Ice-cream");
            setState(() {

            });
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: iceCream? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset('images/ice-cream.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: iceCream? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: ()async{
            pizza = false ;
            iceCream = false ;
            salad = true ;
            burger = false ;
            foodItemStream = await DatabaseMethods().getFoodItem("Salad");
            setState(() {

            });
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: salad? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset('images/salad.png',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                color: salad? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

