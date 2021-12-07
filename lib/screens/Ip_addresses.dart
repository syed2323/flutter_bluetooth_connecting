import 'package:flutter/material.dart';
import 'package:machine_eyes_flutter/widgets/add_ip.dart';
import 'package:machine_eyes_flutter/widgets/ip_list.dart';

class IP_address extends StatefulWidget {
  // const IP_address({ Key? key }) : super(key: key);

  @override
  _IP_addressState createState() => _IP_addressState();
}

class _IP_addressState extends State<IP_address> {
  Future<void> _refresh() {
    return Future.delayed(Duration(seconds: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
      // IconButton(
    //   icon: Icon(
    //     Icons.menue,
    //     color: Colors.white,
    //   ),
    //   onPressed: () {
    //     // do something
    //   },
    // )// ],
],

        backgroundColor: Colors.blue,
      ),
      body: RefreshIndicator(
        child: Ip_list(),
        onRefresh: _refresh,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showGeneralDialog(
            barrierLabel: "Label",
            barrierDismissible: true,
            barrierColor: Colors.black.withOpacity(0.5),
            transitionDuration: Duration(milliseconds: 700),
            context: context,
            pageBuilder: (context, anim1, anim2) {
              return Align(
                alignment: Alignment.center,
                child: Container(
                  height: 250,
                  width: 320,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.lightBlue[900],
                        width: 4.0,
                        style: BorderStyle.solid), //Border.all

                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue[200],
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Ip_add(),
                ),
              );
            },
            transitionBuilder: (context, anim1, anim2, child) {
              return SlideTransition(
                position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                    .animate(anim1),
                child: child,
              );
            },
          );
        },
        child: const Icon(Icons.add_location_alt_rounded),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
