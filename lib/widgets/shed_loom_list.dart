import 'dart:async';
// import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:machine_eyes_flutter/Utils/utils.dart';
import 'package:machine_eyes_flutter/models/shed.dart';
import 'package:machine_eyes_flutter/screens/loom_details.dart';
import 'package:machine_eyes_flutter/service/http_service.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pretty_json/pretty_json.dart';

class ShedLoomList extends StatefulWidget {
  final String id;

  ShedLoomList(this.id);

  @override
  _ShedLoomListState createState() => _ShedLoomListState();
}

class _ShedLoomListState extends State<ShedLoomList> {
  final HttpService httpService = HttpService();
  Timer timer;
  Future<Shed> myLoomData;

  @override
  void initState() {
    super.initState();
    _getLoomData();
    timer = Timer.periodic(Duration(seconds: Utils.apiHittingDelayInSeconds),
        (Timer t) => _getLoomData());
  }

  void _getLoomData() {
    setState(() {
      // print("SHED IDDDDDDDDDDD::::" + widget.id);
      myLoomData = httpService.getLoomDataById(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget buildLoomChild(List<GetLoomsDataResult> loomList, int index) {
      final loom = loomList[index];
      final value = loom.value;
      final personalInfo = value.personalInfo;
      // final CurrentParams = value.currentParams;
      final ShiftParams = value.shiftParams;
      final runningStatistics = ShiftParams.runningStatistics;
      double runningEff = double.parse(runningStatistics.efficiency.toString());
      // print(
      //     "runningStatistics::::" + runningStatistics['Efficiency'].toString());
      var effInDouble = runningEff / 100;

      Color color;
      if (Utils.checkRange(runningEff) == PerformanceRange.POOR) {
        color = Colors.red;
      }

      if (Utils.checkRange(runningEff) == PerformanceRange.AVERAGE) {
        color = Colors.orange;
      }

      if (Utils.checkRange(runningEff) == PerformanceRange.GOOD) {
        color = Colors.green;
      }

      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return LoomDetails(loom.value.personalInfo.mAC);
              },
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.all(
            4,
          ),
          padding: EdgeInsets.all(
            4,
          ),
          child: Card(
            elevation: 4,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Text(
                            personalInfo.loomName,
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 20),
                            child: loom.value.currentParams.currentState == 0
                                ? SvgPicture.asset(
                                    "assets/images/on_off_button.svg",
                                    height: 20,
                                    width: 20,
                                    color: Colors.red,
                                  )
                                : SizedBox()),
                        Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              loom.value.currentParams.currentState == 1
                                  // 1==1
                                  ? Text(
                                      'running',
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 11),
                                    )
                                  : Text(
                                      'stopped',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 11),
                                    ),
                              Row(
                                children: [
                                  Text(
                                    'RPM',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    loom.value.currentParams.currentRPM
                                        .toString(),
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Container(
                    padding: EdgeInsets.all(
                      8,
                    ),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularPercentIndicator(
                          radius: 60.0,
                          lineWidth: 4.0,
                          animation: false,
                          percent: effInDouble,
                          center: Text(
                            "${runningEff.toString()}%",
                            style: TextStyle(fontSize: 12),
                          ),
                          progressColor: color,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return FutureBuilder(
      future: myLoomData,
      builder: (BuildContext ctx, AsyncSnapshot<Shed> snap) {
        if (snap.hasData) {
          Shed shed = snap.data;

          // print("SHED DATA:::${prettyJson(shed, indent: 2)}");

          List<GetLoomsDataResult> loomsList = shed.getLoomsDataResult;
          return ListView.builder(
            itemBuilder: (ctx, index) {
              return buildLoomChild(loomsList, index);
            },
            itemCount: loomsList.length,
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
