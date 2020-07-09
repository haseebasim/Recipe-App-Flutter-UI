import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(children: [
        Row(children: [
          Text(
            'FOODIE',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          SvgPicture.asset(
            'assets/icons/menu.svg',
            height: 18,
          )
        ]),
        Container(
            decoration: BoxDecoration(
                color: aInputColor, borderRadius: BorderRadius.circular(5)),
            child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.search)))),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                NavItem(
                  text: 'RECOMMENDED',
                  color: aButtonColor,
                ),
                NavItem(
                  text: 'BURGER',
                  color: aPrimaryColor,
                ),
                NavItem(
                  text: 'PIZZA',
                  color: aPrimaryColor,
                ),
                NavItem(
                  text: 'SALAD',
                  color: aPrimaryColor,
                ),
                NavItem(
                  text: 'SOUP',
                  color: aPrimaryColor,
                ),
                NavItem(
                  text: 'CHINESE',
                  color: aPrimaryColor,
                ),
              ],
            ),
          ),
        ),
        Container(
            child: Column(
          children: [
            Post(imageName: 'pasta', postName: 'PASTA', name: 'Stephen Allen'),
            Post(
                imageName: 'burger', postName: 'BURGER', name: 'Stephen Allen'),
            Post(imageName: 'pizza', postName: 'PIZZA', name: 'Stephen Allen'),
            Post(imageName: 'salad', postName: 'SALAD', name: 'Stephen Allen'),
          ],
        ))
      ]),
    )));
  }
}

class NavItem extends StatelessWidget {
  final text;
  final color;

  const NavItem({Key key, this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
          child: Text(
        this.text,
        style:
            Theme.of(context).textTheme.headline4.copyWith(color: this.color),
      )),
    );
  }
}

class Post extends StatefulWidget {
  final imageName;
  final postName;
  final name;
  Post({Key key, this.imageName, this.postName, this.name}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> with SingleTickerProviderStateMixin {
  String imageName;
  String postName;
  String name;

  Animation animation;
  AnimationController animationController;

  _PostState();

  @override
  void initState() {
    
    super.initState();
    imageName = widget.imageName;
    postName = widget.postName;
    name= widget.name;

    animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animationController.addListener(() {
      
      setState(() {
        
      });
    });
    animationController.forward();
  }
  

  

  @override
  Widget build(BuildContext context) {
    animation = CurvedAnimation(parent: animationController, curve: Curves.ease);
    animation = Tween<double>(begin:50.0 , end: 200.0).animate(animation);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        child: Column(
          children: [
            Container(
                height: animation.value,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/$imageName.jpeg')))),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                postName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text('Posted By $name',
                    style: TextStyle(
                      color: aSecondaryColor,
                      fontSize: 15,
                    )))
          ],
        ),
      ),
    );
  }
}
