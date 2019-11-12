import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void main() => runApp(Login());

class Login extends StatefulWidget {

      Login(  {Key key})  : super(key: key);


      @override
      Loginstate createState() =>
          Loginstate();


}
class Loginstate extends State<Login> {
    @override
  void initState() {

      super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return   new Column(
        mainAxisSize: MainAxisSize.min,
          children: <Widget>[
           new Text('Top'),
         
          ],
        );
       
  }

   
}