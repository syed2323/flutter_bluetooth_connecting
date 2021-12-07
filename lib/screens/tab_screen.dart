import 'dart:async';

import 'package:flutter/material.dart';
import 'package:machine_eyes_flutter/Utils/utils.dart';
// import 'package:machine_eyes_flutter/models/shed.dart';
import 'package:machine_eyes_flutter/models/shed_resullt.dart';
import 'package:machine_eyes_flutter/screens/dashboard_screen.dart';
import 'package:machine_eyes_flutter/service/http_service.dart';
import 'package:machine_eyes_flutter/screens/Ip_addresses.dart';
import 'package:page_transition/page_transition.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final HttpService httpService = HttpService();
  Future<ShedResult> shedSummary;
  Timer timer;
  TabController _tabController;

  @override
  void initState() {
    getShedData();
    timer = Timer.periodic(Duration(seconds: Utils.apiHittingDelayInSeconds),
        (Timer t) => getShedData());

    super.initState();
  }

  void getShedData() {
    setState(() {
      shedSummary = httpService.getShedOverAllSummary();
    });
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    return FutureBuilder(
      future: shedSummary,
      builder: (BuildContext ctx, AsyncSnapshot<ShedResult> snap) {
        if (snap.hasData) {
          ShedResult shedList = snap.data;

          final List<Tab> tabList = shedList.getShedsResult.map((e) {
            return Tab(
              text: e.shedName,
            );
          }).toList();

          final List<Widget> tabViewList = shedList.getShedsResult.map((e) {
            return DashboardScreen(e);
          }).toList();

          // widget._t TabController(length: tabList.length);
          // return Container();
          //
          return DefaultTabController(
            // initialIndex: 0,

            length: shedList.getShedsResult.length,
            child: Scaffold(
              appBar: AppBar(
                actions: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: IP_address(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.add_location_alt_outlined,
                          size: 26.0,
                        ),
                      )),
                ],
                title: Text('Machine Eyes'),
                bottom: TabBar(
                  tabs: tabList,
                  onTap: (int index) {
                    setState(() {
                      Utils.currentTabPos = index;
                    });
                  },
                ),
              ),
              body: TabBarView(
                children: tabViewList,
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
