import 'package:coin_dex/components/ReusableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButton(),
            Container(
              margin: EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ReusableCard(
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My portfolio",
                        style: TextStyle(color: Color.fromRGBO(146, 145, 177, 1),fontSize: 20),
                      ),
                      SizedBox(height:20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$2000",
                            style: TextStyle(fontSize: 32),
                          ),
                          Row(
                            children: [
                              Icon(Icons.arrow_drop_down,color: Colors.red,),
                              Text("14%",style: TextStyle(fontSize: 20,color: Colors.red)),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Invested",style: TextStyle(fontSize: 20,color: Color.fromRGBO(146, 145, 177, 1)),),
                              SizedBox(height: 10,),
                              Text("\$146.22",style: TextStyle(fontSize: 20))
                            ],
                          ),
                          Column(
                            children: [
                              Text("Available",style: TextStyle(fontSize: 20,color: Color.fromRGBO(146, 145, 177, 1)),),
                              SizedBox(height: 10,),
                              Text("\$146.22",style: TextStyle(fontSize: 20))
                            ],
                          )
                        ],
                      )
                    ],
                  )
                  , 210, 20),
                  SizedBox(height: 40,),
                  Text("Investments",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 20,),
                  ReusableCard(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Crypto blue chip",style: TextStyle(fontSize: 18),),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("\$220",style: TextStyle(fontSize: 20),),
                              Text("-14.2%",style: TextStyle(fontSize: 16,color: Colors.green),)
                            ],
                          )
                        ],
                      ),
                      92, 20),
                  SizedBox(height: 8,),
                  ReusableCard(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Metaverse",style: TextStyle(fontSize: 18),),
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
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
