import 'package:flutter/material.dart';
// import 'package:machine_eyes_flutter/Utils/utils.dart';
import 'package:machine_eyes_flutter/models/shed_resullt.dart';
import 'package:machine_eyes_flutter/widgets/dashboard_header.dart';
import 'package:machine_eyes_flutter/widgets/shed_loom_list.dart';

class DashboardScreen extends StatefulWidget {
  final GetShedsResult getShedsResult;

  DashboardScreen(this.getShedsResult);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          child: DashboardHeader(widget.getShedsResult),
        ),
        Expanded(
          child: ShedLoomList(widget.getShedsResult.shedID),
        ),
      ],
    );
  }
}
