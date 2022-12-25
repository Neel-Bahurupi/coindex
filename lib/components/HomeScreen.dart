import 'package:coin_dex/components/PortfolioScreen.dart';
import 'package:coin_dex/components/ReusableCard.dart';
import 'package:coin_dex/services/smart_contract_functions.dart';
import 'package:flutter/material.dart';
import 'CoinsetsScreen.dart';
import "ReusableCard.dart";
import "CoinsetDetailsScreen.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void onTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List <Widget> _screenOptions = <Widget>[
    const HomePage(),
    const Coinsets()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Row(
          children: [
            Image.asset("assets/images/logo.png",height: 30,fit:BoxFit.fitHeight),
            const Text("oindex")
          ],
        ),
        backgroundColor: const Color(0x00f5f5f5),
      ),
      body: SafeArea(
          child: _screenOptions.elementAt(_selectedIndex)
      )
    );
  }
}
class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();

}

class HomePageState extends State<HomePage>{

  @override
  void initState(){

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(onPressed: (){
            debugPrint('pressed');
            //CoinDex().getAllCoinSets();
            //CoinDex().getPortFolio();
            //CoinDex().sell(0);
            CoinDex().buy(0, BigInt.from(10));
          }, child: const Text('Press')),
          GestureDetector(
            onTap: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PortfolioScreen())
            );
            },
            child: ReusableCard(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "My Account",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(146, 145, 177, 1)
                      ),
                    ),
                    Text(
                      "\$1200",
                      style: TextStyle(
                          fontSize: 32,
                          color:Color.fromRGBO(212, 212, 212, 1)
                      ),
                    )
                  ],
                ),
                128,
                22
            ),
          ),
          const SizedBox(height:24),
          const Text(
              "Popular coin sets",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(245, 245, 245, 1)
              )
          ),
          const SizedBox(height:11),

          GestureDetector(
            onTap: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CoinsetDetailsScreen())
            );},
            child: ReusableCard(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        "NFT",
                        style : TextStyle(
                          fontSize: 20,
                        )
                    ),
                    Column(
                      children: const [
                        Text(
                            "Returns",
                            style:TextStyle(
                                color : Color.fromRGBO(146, 145, 177, 1)
                            )
                        ),
                        Text(
                            "14.26%",
                            style:TextStyle(
                                color: Colors.red,
                                fontSize: 20
                            )
                        )
                      ],
                    )

                  ],
                )
                ,90,22
            ),
          ),
          const SizedBox(height:13),
          ReusableCard(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      "Metaverse",
                      style : TextStyle(
                        fontSize: 20,
                      )
                  ),
                  Column(
                    children: const [
                      Text(
                          "Returns",
                          style:TextStyle(
                              color : Color.fromRGBO(146, 145, 177, 1)
                          )
                      ),
                      Text(
                          "10%",
                          style:TextStyle(
                              color: Colors.green,
                              fontSize: 20
                          )
                      )
                    ],
                  )

                ],
              )
              ,90,22
          )
        ],
      ),
    );
  }

}
