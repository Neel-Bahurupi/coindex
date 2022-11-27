import 'package:coin_dex/components/HomeScreen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  
  @override
  void initState(){
    super.initState();
    _navigationhome();
  }
  
  _navigationhome()async{
    await Future.delayed(Duration(milliseconds: 15000),(){});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const HomeScreen()));
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/images/logo.png"),
    );
  }
}
