import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_delivery_app/widgets/support/widget_support.dart';
import 'package:http/http.dart' as http;

import '../widgets/app_constant.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  Map<String , dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 65,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: Text(
                      'Wallet',
                      style: AppWidget.boldTextFieldStyle(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                ),
                child: Row(
                  children: [
                  Image.asset('images/wallet.png',
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,),
                    SizedBox(width: 40,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Wallet',
                          style: AppWidget.semiBoldTextFieldStyle(),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\$' '100' ,
                          style: AppWidget.boldTextFieldStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Add Money',
                  style: AppWidget.boldTextFieldStyle(),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFE9E2E2),),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '\$' '100',
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFE9E2E2),),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '\$' '500',
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFE9E2E2),),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '\$' '1000',
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFE9E2E2),),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '\$' '2000',
                      style: AppWidget.semiBoldTextFieldStyle(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,),
                padding: EdgeInsets.symmetric(vertical: 12,),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFF008080),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Add Money',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppins',

                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
  Future<void> makePayment(String amount) async {
    try{
      paymentIntent = await createPaymentIntent(amount , 'USD');
      await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret : paymentIntent!['client_secret'],
        style: ThemeMode.dark,
        merchantDisplayName: "Zeyad",
      )).then((value){});

      displayPaymentSheet(amount);
    }catch(e,s){
      print('exception:$e$s ');
    }


  }
  displayPaymentSheet(String amount)async{
    try{
      await Stripe.instance.presentPaymentSheet().then((value)async{
        showDialog(context: context, builder: (_)=> AlertDialog(
          content:
          Row(
            children: [
              Icon(Icons.check_circle,color: Colors.green,),
              Text(
                'Payment Successfully',
                style: AppWidget.semiBoldTextFieldStyle(),
              ),
            ],
          ),
        ));

        paymentIntent = null;
      }).onError((error, stackTrace) {
        print("Error is ---> $error $stackTrace");
      },);

    }on StripeException catch(e){
      print("Error is ---> $e");
      showDialog(context: context, builder: (_)=> const AlertDialog(
        content: Text("Canceled",
        ),
      ));
    }catch (e){
      print(e);
    }
  }
  createPaymentIntent(String amount , String currency) async {
    try{
      Map<String , dynamic> body = {
        'amount' : calculateAmount(amount),
        'currency' : currency,
        'payment_method_types[]' : 'card' ,
      };
      var response = await http.post(
        Uri.parse("http://api.stripe.com/v1/payment_intents"),
        headers: {
          'Authorization' :' Bearer $secretKey',
          'Content-Type' : 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      print("Payment Intent Body ->>> ${response.body.toString()}");
      return jsonDecode(response.body);
    }catch(err){
      print('err chargint user : ${err.toString()}');
    }
  }
  calculateAmount(String amount){
    final caculatedAmount = (int.parse(amount)*100);
    return caculatedAmount.toString();
  }
}
