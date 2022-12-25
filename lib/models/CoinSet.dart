import 'package:coin_dex/models/Coin.dart';

class CoinSet{
  String? name;
  List<Coin>? coins;
  List<int>? value;
  CoinSet(this.coins,this.name);
  
  CoinSet.from(String name, List coins){
    name =name;
    coins = coins;
  }
}

class CoinSetDisplayModel{
  List<CoinSet>? coinSets;
  CoinSetDisplayModel(this.coinSets);
  getListOfAllCoinsets(List coinsets){
    List<CoinSet> cs =[];
    coinsets[0].forEach((v) {
      cs.add(CoinSet(v[0],CoinDisplayModel(v[1]).getListOfCoins(v[1])));
    });
    return cs;
  }
}