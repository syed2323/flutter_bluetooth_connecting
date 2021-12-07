import 'dart:async';
import 'package:flutter/material.dart';
import 'package:machine_eyes_flutter/Utils/utils.dart';
import 'package:machine_eyes_flutter/models/shed_resullt.dart';
import 'package:machine_eyes_flutter/service/http_service.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DashboardHeader extends StatefulWidget {
  final GetShedsResult shedResult;

  DashboardHeader(this.shedResult);

  @override
  _DashboardHeaderState createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader> {
  final HttpService httpService = HttpService();
  Timer timer;
  Future<ShedResult> shedSummary;
  ShedResult shedList;
  GetShedsResult shed;

  @override
  void initState() {
    super.initState();
    // timer = Timer.periodic(Duration(seconds: 3), (Timer t) => getLoomSummary());

    // shedList = widget.shedResult;
    shed = widget.shedResult;
    Utils.currentShed = shed.shedName;
  }

  void getLoomSummary() {
    setState(() {
      shedSummary = httpService.getShedOverAllSummary();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget buildStatsText(String text, String cat, Color color) {
      return Container(
        margin: EdgeInsets.only(
          right: 4,
        ),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                  color: color, fontSize: 12, fontWeight: FontWeight.w600),
            ),
            Text(
              cat,
              style: TextStyle(color: Colors.grey[300], fontSize: 10),
            ),
          ],
        ),
      );
    }

    Widget buildCircularItem(String text, IconData iconData, Color iconColor,
        double percent, String category) {
      var effInDouble = percent * 100;

      Color color;
      if (Utils.checkRange(effInDouble) == PerformanceRange.POOR) {
        color = Colors.red;
      }

      if (Utils.checkRange(effInDouble) == PerformanceRange.AVERAGE) {
        color = Colors.orange;
      }

      if (Utils.checkRange(effInDouble) == PerformanceRange.GOOD) {
        color = Colors.green;
      }

      return Column(
        children: [
          new CircularPercentIndicator(
            radius: 70.0,
            lineWidth: 5.0,
            animation: false,
            percent: percent,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text),
                Icon(
                  iconData,
                  size: 24,
                  color: iconColor,
                ),
              ],
            ),
            progressColor: Colors.green,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            category,
            style: TextStyle(color: iconColor, fontSize: 11),
          ),
        ],
      );
    }

    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    shed.shedName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                buildStatsText(
                  shed.shedSummary.collectiveSummary.runningLooms.toString(),
                  "Running",
                  Colors.green,
                ),
                buildStatsText(
                  shed.shedSummary.collectiveSummary.shortStopped.toString(),
                  "Short Stop",
                  Colors.orangeAccent,
                ),
                buildStatsText(
                  shed.shedSummary.collectiveSummary.longStopped.toString(),
                  "Long Stop",
                  Colors.red,
                ),
                buildStatsText(
                  shed.shedSummary.collectiveSummary.totalLooms.toString(),
                  "Total Loom",
                  Colors.black,
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[300],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildCircularItem(
                "${shed.shedSummary.collectiveSummary.efficiency.toStringAsFixed(1)}%",
                Icons.graphic_eq,
                Colors.green,
                double.parse(shed.shedSummary.collectiveSummary.efficiency
                        .toStringAsFixed(1)) /
                    100,
                'EFFICIENCY',
              ),
              buildCircularItem(
                "${shed.shedSummary.shortSummary.totalLoss.toStringAsFixed(1)}%",
                Icons.crop_square,
                Colors.orange,
                double.parse(shed.shedSummary.shortSummary.totalLoss
                        .toStringAsFixed(1)) /
                    100,
                'SHORT STOP',
              ),
              buildCircularItem(
                "${shed.shedSummary.longSummary.totalLoss.toStringAsFixed(1)}%",
                Icons.timer,
                Colors.deepOrange,
                double.parse(shed.shedSummary.shortSummary.totalLoss
                        .toStringAsFixed(1)) /
                    100,
                'LONG STOP',
              ),
              buildCircularItem(
                shed.shedSummary.collectiveSummary.rPM.toStringAsFixed(0),
                Icons.speed,
                Colors.green,
                double.parse(shed.shedSummary.collectiveSummary.rPM
                        .toStringAsFixed(0)) /
                    1000,
                'RPM',
              ),
            ],
          ),
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.only(
              bottom: 8,
            ),
            child: Text(
              'SHIFT: MORNING   DURATION: 06:00:00   ACTIVE',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
