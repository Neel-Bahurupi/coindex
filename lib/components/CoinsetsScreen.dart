import 'package:coin_dex/components/CoinsetDetailsScreen.dart';
import 'package:coin_dex/components/ReusableCard.dart';
import 'package:coin_dex/models/Coin.dart';
import 'package:coin_dex/models/CoinSet.dart';
import 'package:coin_dex/services/smart_contract_functions.dart';
import 'package:flutter/material.dart';
import 'package:web3dart/credentials.dart';

class Coinsets extends StatefulWidget {
  const Coinsets({Key? key}) : super(key: key);

  @override
  _CoinsetsState createState() => _CoinsetsState();
}



class _CoinsetsState extends State<Coinsets> {

  List<CoinSet> coinsets = [] ;

  @override
  void initState(){
    super.initState();
    loadCoinset();
  }

  void loadCoinset()async{
    List<CoinSet> tempCoinsets = [];
    List<dynamic> cs = (await CoinDex().getAllCoinSets())[0];
    for(int i=0;i<cs.length;i++){
      String name = cs[i][0];
      List<dynamic> addressOfCoins = cs[i][1];

      List<Coin>coins = [];
      for(EthereumAddress address in addressOfCoins){
        List<dynamic> nameAndSymbol = await CoinDex().getNameAndSymbol(address);
        Coin coin = Coin(name: nameAndSymbol[0], symbol: nameAndSymbol[1], address: address.toString());
        coins.add(coin);
      }
      double returns = 0;
      if(i == 0){
        returns = 0.006;
      }else{
        returns = -0.021;
      }
      tempCoinsets.add(CoinSet(coins, name,returns));
    }

    setState(() {
      coinsets = tempCoinsets;
    });

    // print(c.getName());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(22),
            child: Text(
              "All coinsets",
              style: TextStyle(fontSize: 32),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: coinsets.map(
                    (coinset) =>
                        GestureDetector(
                          onTap: (){Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CoinsetDetailsScreen(coinset.getName(), coinset.getCoins())));},
                          child: ReusableCard(
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(coinset.getName(),style: TextStyle(fontSize: 18),),
                                  Text(coinset.getReturns().toString(),style: TextStyle(fontSize: 16,color: (coinset.getReturns() <0 ? Colors.red: Colors.green)),)
                                ],
                              ),
                              92, 20),
                        ),).toList())
            ),

        ],
      ),
    );
  }
}
