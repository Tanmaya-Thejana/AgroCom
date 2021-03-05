import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'theme_dart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'WELCOME TO AGROCOM',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                fontFamily: 'WordSansPro',
                color: Colours.textColor),
          ),
        ),
        backgroundColor: Colours.background,
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100.0,bottom: 45.0),
              child: Image(
                width: 300.0,
                height: 300.0,
                fit: BoxFit.fill,
                image: AssetImage('assets/farmer.png'),
              ),
            ),
            Text('Be Your Own Trader!',style: TextStyle(fontWeight: FontWeight.w700,
            color: Colors.white,fontSize: 27.0),),
            Container(
              margin: EdgeInsets.only(top: 40.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colours.loginGradientStart,
                    offset: Offset(1.0, 6.0),
                    blurRadius: 20.0,
                  ),
                  BoxShadow(
                    color: Colours.loginGradientEnd,
                    offset: Offset(1.0, 6.0),
                    blurRadius: 20.0,
                  ),
                ],
                gradient: LinearGradient(
                  colors: [
                    Colours.loginGradientEnd,
                    Colours.loginGradientStart
                  ],
                  begin: FractionalOffset(0.2, 0.2),
                  end: FractionalOffset(1.0, 1.0),
                  stops: [0.0, 1.0],
                ),
              ),
              child: MaterialButton(
                highlightColor: Colours.loginGradientStart,
                splashColor: Colours.background,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                  child: ListTile(
                    title: Text(
                      'Click To Trade',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 31.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    trailing: Icon(
                      FontAwesomeIcons.solidArrowAltCircleRight,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
