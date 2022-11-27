import 'package:flutter/material.dart';
import 'package:coin_dex/components/ReusableCard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class CoinsetDetailsScreen extends StatefulWidget {
  const CoinsetDetailsScreen({Key? key}) : super(key: key);

  @override
  _CoinsetDetailsScreenState createState() => _CoinsetDetailsScreenState();
}

class _SalesData{
  _SalesData(this.year,this.sales);
  String year;
  int sales;
}

class _CoinsetDetailsScreenState extends State<CoinsetDetailsScreen> {
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  late CrosshairBehavior _crosshairBehavior;

  @override
  void initState(){
    _crosshairBehavior = CrosshairBehavior(
      // Enables the crosshair
        enable: true
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButton(),
            Container(
                margin: const EdgeInsets.all(22),
                child : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "NFT",
                          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                        ),
                        Icon(Icons.share)
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableCard(
                            Row(
                              children: const [
                                Icon(Icons.people_alt_outlined),
                                SizedBox(width: 5),
                                Text("22.4K ",style: TextStyle(fontSize: 18),),
                                Text("investors", style: TextStyle(
                                  color: Color.fromRGBO(146, 145, 177, 1),
                                  fontSize: 10
                                ),)
                              ],
                            ),
                            50,
                            12),
                        ReusableCard(
                            Row(
                              children: const [
                                Icon(Icons.arrow_drop_down,color: Colors.red,),
                                Text("12.3%", style: TextStyle(fontSize: 18,color: Colors.red)),
                              ],
                            ),
                            50,
                            12)
                      ],
                    )
                  ],
                )
            ),
            SfCartesianChart(
                crosshairBehavior: _crosshairBehavior,
                tooltipBehavior: TooltipBehavior(enable: true),

                primaryXAxis: CategoryAxis(),
                series: <ChartSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                      dataSource: data,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      name: 'Sales',
                      // Enable data label
                      dataLabelSettings: const DataLabelSettings(isVisible: false))
                ]),
            Container(
              margin: EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Constituents",style: TextStyle(fontSize: 20),),
                  SizedBox(height: 25,),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Table(
                      children: [
                        TableRow(
                          children: [
                            Text("Name",style: TextStyle(fontSize: 16,color: Color.fromRGBO(146, 145, 177, 1)),),
                            Text("Holdings %",style: TextStyle(fontSize: 16,color: Color.fromRGBO(146, 145, 177, 1))),
                            Text("1D change",style: TextStyle(fontSize: 16,color: Color.fromRGBO(146, 145, 177, 1)))
                          ]
                        ),
                        TableRow(
                            children: [
                              Text("Ethereum",style: TextStyle(height: 2.5,color: Color.fromRGBO(212, 212, 212, 0.61)),),
                              Text("10",style: TextStyle(height: 2.5,color: Color.fromRGBO(212, 212, 212, 0.61)),),
                              Text("14%",style: TextStyle(height: 2.5,color: Color.fromRGBO(212, 212, 212, 0.61)),)
                            ]
                        ),
                        TableRow(
                            children: [
                              Text("NFT",style: TextStyle(height: 2.5,color: Color.fromRGBO(212, 212, 212, 0.61)),),
                              Text("80",style: TextStyle(height: 2.5,color: Color.fromRGBO(212, 212, 212, 0.61)),),
                              Text("12%",style: TextStyle(height: 2.5,color: Color.fromRGBO(212, 212, 212, 0.61)),)
                            ]
                        ),
                        TableRow(
                            children: [
                              Text("NFT",style: TextStyle(height: 2.5,color: Color.fromRGBO(212, 212, 212, 0.61)),),
                              Text("80",style: TextStyle(height: 2.5,color: Color.fromRGBO(212, 212, 212, 0.61)),),
                              Text("12%",style: TextStyle(height: 2.5,color: Color.fromRGBO(212, 212, 212, 0.61)),)
                            ]
                        ),
                        TableRow(
                            children: [
                              Text("NFT",style: TextStyle(height: 2.5,color: Color.fromRGBO(212, 212, 212, 0.61)),),
                              Text("80",style: TextStyle(height: 2.5,color: Color.fromRGBO(212, 212, 212, 0.61)),),
                              Text("12%",style: TextStyle(height: 2.5,color: Color.fromRGBO(212, 212, 212, 0.61)),)
                            ]
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        child: TextButton(
          child: Text("Invest",style: TextStyle(color: Colors.white),),
          onPressed: (){},
        ),
        color: Color.fromRGBO(31, 31, 57, 0.5),
      ),

    );
  }
}