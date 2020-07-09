import 'HomePage.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(
          fontFamily: 'Poppins',
          textTheme: TextTheme(
              headline4: TextStyle(
                  color: aPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))),
      home: LandingScreen(),
    );
  }
}

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: aPrimaryColor,
      body: Column(children: <Widget>[
        Expanded(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.bottomCenter,
                        image: AssetImage(
                          'assets/images/background.jpeg',
                        ),
                        fit: BoxFit.cover)))),
        Expanded(
            child: Container(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: aButtonColor, shape: BoxShape.circle),
                    child: SvgPicture.asset('assets/icons/food.svg')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'FOODIE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )),
            Text(
              'MASTER COOKING\nWITH AMAZING RECIPES',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            FittedBox(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return HomePage();
                  }));
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                        color: aButtonColor,
                        borderRadius: BorderRadius.circular(100)),
                    child: Row(children: [
                      Text('START COOKING',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      )
                    ])),
              ),
            )
          ],
        )))
      ]),
    );
  }
}
