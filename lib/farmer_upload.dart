import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'theme_dart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Farmer extends StatefulWidget {
  @override
  _FarmerState createState() => _FarmerState();
}

class _FarmerState extends State<Farmer> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  String fprod;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AGROCOM',
          style: TextStyle(
            color: Colours.textColor,
            fontSize: 27.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color(0xFF5BC4B8),
        actions: <Widget>[
          Tooltip( message: 'Sign Out',
          child: IconButton(icon: Icon(Icons.arrow_drop_down_circle,color: Colours.textColor,),
          onPressed: () {
            _auth.signOut();
            Navigator.pop(context);
          },),)
          ,
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colours.loginGradientEnd, Colours.loginGradientStart],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 2.0),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Select the product and no. of units.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 26.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,fontFamily: 'Pacifico',)),
                Text(
                  'Each unit = 250g.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,fontFamily: 'Pacifico',
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                  child: Text(
                    'Vegetables:',
                    style: TextStyle(
                        fontSize: 23.0,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                buildCard('Carrot'),
                buildCard('Tomato'),
                buildCard('Onion'),
                buildCard('Corn'),
                buildCard('Potato'),
                buildCard('Sweet potato'),
                buildCard('Peas'),
                buildCard('Lady Finger'),
                buildCard('Beans'),
                buildCard('Raddish'),
                buildCard('Mushroom'),
                buildCard('Drumstick'),
                buildCard('Cabbage'),
                buildCard('Cauliflower'),
                buildCard('Snake Gourd'),
                buildCard('Bottle Gourd'),
                buildCard('Bitter Gourd'),
                buildCard('Pumpkin'),
                buildCard('Brinjal'),
                buildCard('Beetroot'),
                buildCard('Cucumber'),
                buildCard('Ginger'),
                buildCard('Garlic'),
                buildCard('Lemon'),
                buildCard('Capsicum'),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                  child: Text(
                    'Fruits:',
                    style: TextStyle(
                        fontSize: 23.0,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                buildCard('Apple'),
                buildCard('Mango'),
                buildCard('Banana'),
                buildCard('Avacado'),
                buildCard('Pineapple'),
                buildCard('Lychee'),
                buildCard('Jackfruit'),
                buildCard('Musk-Melon'),
                buildCard('Water-Melon'),
                buildCard('Grapes'),
                buildCard('Guava'),
                buildCard('Kiwi'),
                buildCard('Orange'),
                buildCard('Papaya'),
                buildCard('Pomegranate'),
                buildCard('Pear'),
                buildCard('Sapota'),
                buildCard('Strawberry'),
                buildCard('Mosambi'),
                buildCard('Custard Apple'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card buildCard(String prod) {
    bool item = false;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '$prod',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colours.textColor,
                    fontSize: 25.0),
              ),
              CupertinoSwitch(
                value: item,
                onChanged: (bool newValue) {
                  setState(() {
                    item = newValue;
                    fprod = prod;
                    print(fprod);
                  });
                },
                activeColor: Colours.background,
              ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.solidArrowAltCircleUp,
                  size: 35.0,
                  color: Colours.textColor,
                ),
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: Text(
                        'Hey there!',
                        style:
                            TextStyle(fontSize: 23.0, color: Colours.textColor),
                      ),
                      content: Text(
                        'Your items have been uploaded.',
                        style:
                            TextStyle(fontSize: 20.0, color: Colours.textColor),
                      ),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          child: Text(
                            'OK',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colours.homeButton),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Enter no. of units.',
              hintStyle: TextStyle(
                color: Colors.blueGrey,
                fontSize: 18.0,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colours.textColor, width: 3.0),
                borderRadius: BorderRadius.circular(30.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colours.textColor, width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.0),
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Enter the price.',
              hintStyle: TextStyle(
                color: Colors.blueGrey,
                fontSize: 18.0,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colours.textColor, width: 3.0),
                borderRadius: BorderRadius.circular(30.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colours.textColor, width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 2.0),
          )
        ],
      ),
    );
  }
}
