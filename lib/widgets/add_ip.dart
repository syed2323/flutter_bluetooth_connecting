import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:machine_eyes_flutter/screens/Ip_addresses.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

class Ip_add extends StatefulWidget {
  @override
  _Ip_addState createState() => _Ip_addState();
}

class _Ip_addState extends State<Ip_add> {
  final ipaddress_1 = TextEditingController();
  final ipaddress_2 = TextEditingController();
  final ipaddress_3 = TextEditingController();
  final ipaddress_4 = TextEditingController();

  SharedPreferences prefs;
  List<String> selectedIpList = [];
  var decodedMap;

  // Future<void> getIntFromLocalMemory(String key) async {
  //   prefs = await SharedPreferences.getInstance();
  //   String encodedMap = prefs.getString("IP_ADDRES") ?? null;
  //   print(encodedMap);
  //
  //   setState(() {
  //      decodedMap = json.decode(encodedMap);
  //     print("get_decode_map");
  //     print(decodedMap);
  //   });
  // }


  Future<void> saveIntInLocalMemory(String key, String value) async {
    prefs.setStringList('IP_ADDRES', selectedIpList);
  }

  initPref() async {
    prefs = await SharedPreferences.getInstance();
  }


  @override
  void initState() {
    initPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    list_of_ip() {
      var ip = ipaddress_1.text.toString() +
          "." +
          ipaddress_2.text.toString() +
          "." +
          ipaddress_3.text.toString() +
          "." +
          ipaddress_4.text.toString();

      print("addes ip address is:::" + ip);
      Map<String, bool> selectedIpMap = {
        ip: false,
      };

      selectedIpList = prefs.getStringList("IP_ADDRES")??null;

      if(selectedIpList == null){
        selectedIpList = [];
      }


      print(selectedIpMap);

      String encodedMap = json.encode(selectedIpMap);

      setState(() {
        selectedIpList.add(encodedMap);
        print(selectedIpList);
      });

      saveIntInLocalMemory("IP_ADDRES", selectedIpList.toString());
    }

    return Material(
        child: Column(children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            padding: EdgeInsets.only(right: 90),
            child: Text(
              "Insert Your IP Address",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(right: 10, top: 20)),
              Container(
                  width: 50,
                  padding: EdgeInsets.only(top: 30),
                  child: TextField(
                    controller: ipaddress_1,
                    autocorrect: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 3,
                    maxLengthEnforced: true,
                  )),
              Padding(padding: EdgeInsets.only(right: 5)),
              Container(
                  width: 20,
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    ".",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  )),
              Container(
                  width: 50,
                  padding: EdgeInsets.only(top: 30),
                  child: TextField(
                    controller: ipaddress_2,
                    autocorrect: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 3,
                    maxLengthEnforced: true,
                  )),
              Padding(padding: EdgeInsets.only(right: 5)),
              Container(
                  width: 20,
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    ".",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  )),
              Container(
                  width: 50,
                  padding: EdgeInsets.only(top: 30),
                  child: TextField(
                    controller: ipaddress_3,
                    autocorrect: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 1,
                    maxLengthEnforced: true,
                  )),
              Padding(padding: EdgeInsets.only(right: 5)),
              Container(
                  width: 20,
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    ".",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  )),
              Container(
                  width: 50,
                  padding: EdgeInsets.only(top: 30),
                  child: TextField(
                    controller: ipaddress_4,
                    autocorrect: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 3,
                    maxLengthEnforced: true,
                  )),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 25, right: 70)),
          Container(
            padding: EdgeInsets.only(left: 170),
            child: FloatingActionButton.extended(
              onPressed: () async {
                list_of_ip();
                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // await prefs.clear();

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => IP_address()));


              },
              label: const Text('Submitt'),
              icon: const Icon(Icons.done_all),
              backgroundColor: Colors.blue[900],
            ),
          )
        ]));
  }


}
