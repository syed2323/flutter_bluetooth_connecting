import 'package:flutter/material.dart';
import 'package:machine_eyes_flutter/models/ip_address.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class Ip_list extends StatefulWidget {
  @override
  _Ip_listState createState() => _Ip_listState();
}

class _Ip_listState extends State<Ip_list> {
  SharedPreferences prefs;
  List<IPAddress> final_ip = [];
  var list = [];
  List<String> ip = [];
  bool selectedip = false;

  Future<void> getIntFromLocalMemory(String key) async{
    prefs = await SharedPreferences.getInstance();
    List<String> encodedMapList = prefs.getStringList("IP_ADDRES") ?? null;

    print(encodedMapList);


    for(var map in encodedMapList){

      var decodedMap = json.decode(map) ;

        final_ip.add(IPAddress(decodedMap.keys.toList()[0], decodedMap.values.toList()[0]));

    }

    print("get_decode_map");


    setState(() {


      // final_ip.add(decodedMap);
      // print("final_ip");

    });
  }
  //
  @override
  void initState() {
    getIntFromLocalMemory("IP_ADDRES");
    super.initState();
    print("get_encoded_map");
  }

  onitemclick(selectedid) {
    setState(() {
      selectedip = !selectedip;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
          child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: final_ip.length,
        itemBuilder: (_, index) {
          return homeview();
        },
      )),
    ]));
  }

  Widget homeview() {
    return Container(
        //color: Colors.green,
        height: 640,
        width: 360,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            for (var ip in final_ip)
              Container(
                  child: Column(children: <Widget>[
                InkWell(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.only(left: 10),
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(10), //border corner radius
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.5), //color of shadow
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(children: [
                        Container(
                          child: Text(
                            ip.ip,
                            style: TextStyle(
                              fontSize: 26,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(right: 90)),
                        Container(
                          child: IconButton(
                              iconSize: 30.0,
                              padding:
                                  EdgeInsets.only(left: 4, right: 4, top: 0),
                              icon: ip.isSelected == true
                                  ? Icon(
                                      Icons.fiber_manual_record_sharp,
                                      size: 40,
                                      color: Colors.green,
                                    )
                                  : Icon(
                                      Icons.fiber_manual_record_outlined,
                                      size: 40,
                                    ),
                              onPressed: (){
                                print('selected ip:   '+ ip.ip);
                                int index_ip =final_ip.indexOf(ip);
                                print("index of ip:   " + index_ip.toString());
                                var counter=0;
                                for (var ip in final_ip){
                                  ip.isSelected = false;

                                  if (counter == index_ip){

                                    setState(() {
                                      ip.isSelected = true;
                                    });

                                  }
                                  counter++;
                                }

                              }
                          ),
                        ),
                      ]),
                    ),
                    onTap: () {
                      print('selected ip:   '+ ip.ip);
                      int index_ip =final_ip.indexOf(ip);
                      print("index of ip:   " + index_ip.toString());
                      var counter=0;
                      for (var ip in final_ip){
                        ip.isSelected = false;

                        if (counter == index_ip){

                          setState(() {
                            ip.isSelected = true;
                          });

                        }
                        counter++;
                      }
                    }
                ),
              ])),
          ],
        ));
  }
}
