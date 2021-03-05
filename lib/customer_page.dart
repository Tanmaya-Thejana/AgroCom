import 'package:agrocomapp/cart_page.dart';
import 'package:flutter/material.dart';
import 'theme_dart.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Customer extends StatefulWidget {
  @override
  _CustomerState createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {

  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

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
    }
    catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      actions: <Widget>[
        Tooltip(message: 'Go to cart',
          child: IconButton(
            icon: Icon(Icons.shopping_cart, color: Colours.textColor,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
          ),
        ),
        Tooltip(message: 'Sign Out',
          child: IconButton(
            icon: Icon(Icons.arrow_drop_down_circle, color: Colours.textColor,),
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },),
        ),
      ],
      title: Text(
        'AGROCOM',
        style: TextStyle(
          color: Colours.textColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Color(0xFF5BC4B8),
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
      ),);
  }
}




