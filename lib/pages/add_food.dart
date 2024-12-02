import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/support/widget_support.dart';
import 'package:image_picker/image_picker.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {

  String? value ;
  final List<String> items = ['Ice-Cream' , 'Burger' , 'Salad', 'Pizza'];

  TextEditingController nameController = TextEditingController();
  TextEditingController itemController = TextEditingController();
  TextEditingController detailController = TextEditingController();


  final ImagePicker _picker = ImagePicker();
  File? selectedImage ;

  Future getImage()async{
    var image = await _picker.pickImage(source: ImageSource.gallery);

    selectedImage = File(image!.path);
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_outlined,color: Color(0xff373866),),),
            centerTitle: true,
            title:Text(
              'Add Item',
              style: AppWidget.headerTextFieldStyle(),
            ) ,
      ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20 , top:  20, bottom: 70),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upload the Item Picture',
                  style: AppWidget.semiBoldTextFieldStyle(),
                ),
                GestureDetector(
                  onTap: (){
                    getImage();
                  },
                    child: SizedBox(height: 20,)),
               selectedImage == null ? Center(
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black,
                      ),

                    ),
                  ),
                ):Center(
                 child: Material(
                   elevation: 4,
                   borderRadius: BorderRadius.circular(20),
                   child: Container(
                     width: 150,
                     height: 150,
                     decoration: BoxDecoration(
                       border: Border.all(color: Colors.black, width: 1.5),
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                       child: Image.file(
                         selectedImage!,
                         fit: BoxFit.cover,
                       ),
                     ),


                   ),
                 ),
               ),
                SizedBox(height: 40,),
                Text(
                  'Item Name',
                  style: AppWidget.semiBoldTextFieldStyle(),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller:nameController ,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Item Name',
                      hintStyle: AppWidget.lightTextFieldStyle(),

                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Text(
                  'Item Price',
                  style: AppWidget.semiBoldTextFieldStyle(),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller:itemController ,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Item Price',
                      hintStyle: AppWidget.lightTextFieldStyle(),

                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Text(
                  'Item Detail',
                  style: AppWidget.semiBoldTextFieldStyle(),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    maxLines: 6,
                    controller:detailController ,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Item Detail',
                      hintStyle: AppWidget.lightTextFieldStyle(),

                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Text(
                  'Select Category',
                  style: AppWidget.semiBoldTextFieldStyle(),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          items: items.map((item) =>
                              DropdownMenuItem<String>(
                                value: item,
                                child:
                              Text(item,
                                style: TextStyle(
                                    fontSize:18,
                                    color: Colors.black  ),),),).toList(),
                           onChanged:((value)=> setState(() {
                             this.value = value ;
                           })) ,
                        dropdownColor:Colors.white ,
                        hint: Text(
                          'Select Category',

                        ),
                        iconSize: 36,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,),
                        value: value,

                      ),
                  ),
                ),
                SizedBox(height: 30,),
                Center(
                  child: Material(
                    elevation: 5,

                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: Center(
                        child: Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
    );
  }
}
