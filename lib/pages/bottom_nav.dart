import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/pages/order_page.dart';
import 'package:food_delivery_app/pages/profile_page.dart';
import 'package:food_delivery_app/pages/wallet_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages ;
  late Widget currentPage ;
  late HomePage homePage;
  late ProfilePage profilePage;
  late WalletPage walletPage ;
  late OrderPage orderPage;

  @override
  void initState(){
    homePage = HomePage();
    orderPage = OrderPage();
    walletPage = WalletPage();
    profilePage = ProfilePage();
    pages = [homePage, orderPage,  walletPage , profilePage ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar:

      CurvedNavigationBar(
          height: 65,
          backgroundColor: Colors.white,
          color: Colors.black,

          animationDuration: Duration(microseconds: 500),
          onTap: (index){
            setState(() {
              currentTabIndex = index ;
            });

          },

          items: [
        Icon(Icons.home_outlined,
        color: Colors.white,
        ),
        Icon(Icons.shopping_bag_outlined,
          color: Colors.white,
        ),
        Icon(Icons.wallet_outlined,
          color: Colors.white,
        ),
        Icon(Icons.person_outline,
          color: Colors.white,
        ),


      ]),
      body: pages[currentTabIndex],
    );
  }
}
