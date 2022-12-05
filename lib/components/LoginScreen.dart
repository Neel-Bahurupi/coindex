import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>{

  var connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'Wallet',
          description: 'An app for converting pictures to NFT',
          url: 'https://walletconnect.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]
      )
  );
  var _session, _uri, _signature;

  loginUsingMetamask(BuildContext context) async {
    if (!connector.connected) {
      try {
        var session = await connector.createSession(onDisplayUri: (uri) async {
          _uri = uri;
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });
        setState(() {
          _session = session;
        });
      } catch (exp) {
        print(exp);
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    connector.on(
        'connect',
            (session) => setState(
              () {
            _session = _session;
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
          },
        ));
    connector.on(
        'session_update',
            (payload) => setState(() {
          _session = payload;
        }));
    connector.on(
        'disconnect',
            (payload) => setState(() {
          _session = null;
        }
        )
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset("assets/images/logo.png",height: 30,fit:BoxFit.fitHeight),
            const Text("oindex")
          ],
        ),
        backgroundColor: const Color(0x00f5f5f5),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 250,),
            Image.asset("assets/images/logo.png"),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  loginUsingMetamask(context);
                },
                child: const Text('Connect to Metamask')
            )
          ],
        ),
      ),
    );
  }
}