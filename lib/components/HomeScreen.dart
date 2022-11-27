import 'package:coin_dex/components/PortfolioScreen.dart';
import 'package:coin_dex/components/ReusableCard.dart';
import 'package:flutter/material.dart';
import "ReusableCard.dart";
import "CoinsetDetailsScreen.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
