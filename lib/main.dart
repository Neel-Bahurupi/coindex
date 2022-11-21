import 'package:flutter/material.dart';
import './components/HomeScreen.dart';
import './components/CoinsetDetailsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  void onTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List <Widget> _screenOptions = <Widget>[
    const HomeScreen(),
    const CoinsetDetailsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0x00f5f5f5)
        ),
        home: Scaffold(
            body: SafeArea(
              child: _screenOptions.elementAt(_selectedIndex)
            ) ,
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.money),
                    label: "Coinset"
                )
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              backgroundColor: Colors.black,
              onTap: onTap,
            ),
            appBar: AppBar(
              title: Text("CoinDex",style: TextStyle(fontSize: 16)),
              backgroundColor: Color(0x00f5f5f5),
            ),
        )
    );
  }
}


