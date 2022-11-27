import 'package:coin_dex/components/ReusableCard.dart';
import 'package:flutter/material.dart';

class Coinsets extends StatefulWidget {
  const Coinsets({Key? key}) : super(key: key);

  @override
  _CoinsetsState createState() => _CoinsetsState();
}

class _CoinsetsState extends State<Coinsets> {
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
              children: [
                ReusableCard(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Crypto blue chip",style: TextStyle(fontSize: 18),),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$500",style: TextStyle(fontSize: 20),),
                            Text("-14.2%",style: TextStyle(fontSize: 16,color: Colors.red),)
                          ],
                        )
                      ],
                    ),
                    92, 20),
                ReusableCard(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Crypto blue chip",style: TextStyle(fontSize: 18),),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$500",style: TextStyle(fontSize: 20),),
                            Text("-14.2%",style: TextStyle(fontSize: 16,color: Colors.red),)
                          ],
                        )
                      ],
                    ),
                    92, 20),
                ReusableCard(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Crypto blue chip",style: TextStyle(fontSize: 18),),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$500",style: TextStyle(fontSize: 20),),
                            Text("-14.2%",style: TextStyle(fontSize: 16,color: Colors.red),)
                          ],
                        )
                      ],
                    ),
                    92, 20),
                ReusableCard(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Crypto blue chip",style: TextStyle(fontSize: 18),),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$500",style: TextStyle(fontSize: 20),),
                            Text("-14.2%",style: TextStyle(fontSize: 16,color: Colors.red),)
                          ],
                        )
                      ],
                    ),
                    92, 20)
              ],
            ),
          )
        ],
      ),
    );
  }
}
