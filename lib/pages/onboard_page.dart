import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/sign_up_page.dart';
import 'package:food_delivery_app/widgets/content_model.dart';
import 'package:food_delivery_app/widgets/support/widget_support.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {

  int currentIndex = 0 ;
  late PageController _controller ;
  @override
  void initState() {

    _controller = PageController(initialPage: 0);

    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: 3,
                onPageChanged: (index){
                setState(() {
                  currentIndex = index ;
                });
                },
                itemBuilder:(_,i){
                return Padding(
                  padding: const EdgeInsets.all(70.0),
                  child: Column(
                    children: [
                      Image.asset(contents[i].image,
                      height: 500,
                        width: MediaQuery.of(context).size.width,
                        ),
                      SizedBox(height: 30,),
                      Text(
                        contents[i].title,
                        style: AppWidget.semiBoldTextFieldStyle(),
                      ),
                      SizedBox(height: 10,),
                      Text(
                          contents[i].desc,
                        style: AppWidget.lightTextFieldStyle(),

                              ),
                    ],
                  ),
                );
                }
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                List.generate(
                  contents.length,
                    (index)=> buildDot(index, context),
                ),

            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(40),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(

              color: Color(0xffff5722),
              borderRadius: BorderRadius.circular(20),

            ),
            child: TextButton(

                onPressed: (){


                  if(currentIndex==contents.length-1){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (_)=> SignUpPage(),

                    ),

                    );

                  }

                    _controller.nextPage(duration: Duration(milliseconds: 150), curve: Curves.bounceIn);


                },
                child: Text(
                  currentIndex == contents.length-1 ? 'Continue': 'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.bold,
                  ),
                )

            ),
          ),
        ],
      ),



    );
  }
  Container buildDot(int index , BuildContext context)  {
   return Container(
      height: 10,
      width: currentIndex == index ? 25:10,
      margin: EdgeInsets.only(right: 4),
      decoration: BoxDecoration(
        color: Color(0xffff5722),
        borderRadius: BorderRadius.circular(20),
      ),

    );


  }

  }

