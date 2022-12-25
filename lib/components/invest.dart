import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Invest extends StatefulWidget {
  const Invest({Key? key}) : super(key: key);

  @override
  _InvestState createState() => _InvestState();
}

class _InvestState extends State<Invest> {

  TextEditingController valueController = TextEditingController();
  String inputValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SafeArea(
        child: Container(
          margin: EdgeInsets.all(22),
          child: Column(
            children: [
              TextField(
                controller: valueController ,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Value',
                ),
                onChanged: (text){
                  setState(() {
                    inputValue = text;
                  });
                },

              ),
              SizedBox(height: 20,),
              TextButton(
                  onPressed: (){},
                  child: Text("Invest",style: TextStyle(color: Colors.white),),
                  style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(31, 31, 57, 1),
                    padding: EdgeInsets.fromLTRB(40,15,40,15)
                  )
                  // ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(31, 31, 57, 1))),
              )
            ],
          ),
        ),
      )
    );
  }
}
