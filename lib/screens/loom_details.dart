import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:machine_eyes_flutter/Utils/utils.dart';
// import 'package:machine_eyes_flutter/animation/animate_container.dart';
import 'package:machine_eyes_flutter/models/loom_data_result.dart';
import 'package:machine_eyes_flutter/service/http_service.dart';
import 'package:machine_eyes_flutter/widgets/linear_percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';
// import 'pie_chart.dart';

class LoomDetails extends StatelessWidget {
  final String mac;

  LoomDetails(this.mac);

  @override
  Widget build(BuildContext context) {
    Widget buildPieChart(Map<String, double> dataMap, List<Color> colorList) {
      return Card(
          margin: EdgeInsets.all(8),
          elevation: 4,
          child: Container(
            child: PieChart(
              dataMap: dataMap,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 20,
              chartRadius: MediaQuery.of(context).size.width / 2,
              colorList: colorList,
              initialAngleInDegree: 0,
              chartType: ChartType.disc,
              ringStrokeWidth: 40,
              legendOptions: LegendOptions(
                showLegendsInRow: true,
                legendPosition: LegendPosition.bottom,
                showLegends: true,
                legendShape: BoxShape.circle,
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: false,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: true,
                decimalPlaces: 1,
              ),
            ),
          ));
    }

    Color globalColor = Colors.grey[800];
    HttpService httpService = HttpService();
    Future<LoomDataResult> myLoomData = httpService.getLoomByMacId(mac);

    Widget buildLoomInfo(String loomNo, String loomName, String rpm,
        String percentage, int state) {
      return Card(
        elevation: 4,
        margin: EdgeInsets.all(8),
        child: Container(
          padding: EdgeInsets.all(
            8,
          ),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Loom# ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        loomName,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.speed,
                        color: Utils.colorEfficiency,
                      ),
                      Text(
                        rpm,
                        style: TextStyle(
                          fontSize: 14,
                          color: Utils.colorTotal,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  Utils.currentShed,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              linearPercentIndicator(
                context,
                double.parse(
                  percentage,
                ),
              ),
              state == 1
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Lottie.asset(
                              'assets/animations/setting_spinning.json'),
                          height: 80,
                          width: 80,
                        ),
                        Text('Running')
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child:
                              Lottie.asset('assets/animations/stopwatch.json'),
                          height: 80,
                          width: 80,
                        ),
                        Text(
                          'Stopped',
                        ),
                      ],
                    ),
            ],
          ),
        ),
      );
    }

    return FutureBuilder(
      future: myLoomData,
      builder: (BuildContext ctx, AsyncSnapshot<LoomDataResult> snap) {
        if (snap.hasData) {
          LoomDataResult loom = snap.data;
          ShortStopStatistics shortStopStatistics =
              loom.getLoomDataResult.shiftParams.shortStopStatistics;
          LongStopDurations longStopDurations =
              loom.getLoomDataResult.shiftParams.longStopDurations;

          // print("SHED DATA:::${prettyJson(shed, indent: 2)}");

          GetLoomDataResult loomResult = loom.getLoomDataResult;

          double runningEff = double.parse(
              (loomResult.shiftParams.runningStatistics.efficiency).toString());
          double shortStopLoss = double.parse(
              (loomResult.shiftParams.shortStopStatistics.totalLoss)
                  .toString());
          double longStopLoss = double.parse(
              (loomResult.shiftParams.longStopDurations.totalLoss).toString());

          Map<String, double> dataMap = {
            "Efficiency": runningEff,
            "Short Stop Loss": shortStopLoss,
            "Long Stop Loss": longStopLoss,
          };

          List<Color> colorList = [
            Utils.colorEfficiency,
            Utils.colorShortStop,
            Utils.colorLongStop,
          ];

          Widget buildTextTitles(String title, double textSize) {
            return Container(
              margin: EdgeInsets.only(
                left: 8,
                top: 8,
                bottom: 8,
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          Widget buildShortSummaryItems(String counter, String percentage,
              String sh, IconData iconData, String title, Color color) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.all(
                6,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        iconData,
                        color: color,
                        size: 34,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: TextStyle(
                                      color: color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      // Container(
                                      //   margin: EdgeInsets.only(
                                      //     right: 6,
                                      //   ),
                                      //   height: 12,
                                      //   width: 12,
                                      //   color: Colors.blueGrey,
                                      // ),
                                      Text(
                                        "Counter: $counter",
                                        style: TextStyle(
                                            fontSize: 12, color: globalColor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    height: 6,
                                    width: 6,
                                    child: Icon(
                                      Icons.timer,
                                      color: globalColor,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    child: Text(
                                      "S/H: $sh",
                                      style: TextStyle(
                                          fontSize: 12, color: globalColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              percentage,
                              style: TextStyle(
                                color: globalColor,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          Widget buildLongSummaryItems(String milli, String percentage,
              IconData iconData, String title, Color color) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.all(
                6,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        iconData,
                        color: color,
                        size: 34,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: TextStyle(
                                    color: color,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time_sharp,
                                      color: globalColor,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 4,
                                      ),
                                      child: Text(
                                        "$milli milliseconds",
                                        style: TextStyle(
                                            fontSize: 12, color: globalColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              percentage,
                              style: TextStyle(
                                color: globalColor,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text('Loom Details'),
              // title: Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       "Loom: ${loom.getLoomDataResult.personalInfo.loomName}",
              //     ),
              //     Text(
              //       "Mac Address: ${loom.getLoomDataResult.personalInfo.mAC}",
              //       style: TextStyle(fontSize: 11),
              //     ),
              //   ],
              // ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLoomInfo(
                    loom.getLoomDataResult.personalInfo.loomID.toString(),
                    loom.getLoomDataResult.personalInfo.loomName,
                    loom.getLoomDataResult.shiftParams.runningStatistics.rPM
                        .toString(),
                    loom.getLoomDataResult.shiftParams.runningStatistics
                        .efficiency
                        .toString(),
                    int.parse(loom.getLoomDataResult.currentParams.currentState
                        .toString()),
                  ),
                  Container(
                    height: 280,
                    child: buildPieChart(dataMap, colorList),
                  ),
                  buildTextTitles(
                    'Short Stop Summary',
                    22.0,
                  ),
                  buildShortSummaryItems(
                    shortStopStatistics.warpStops.toString(),
                    "${shortStopStatistics.warpLoss.toStringAsFixed(1)}%",
                    shortStopStatistics.warpperHour.toStringAsFixed(1),
                    Icons.add_road,
                    'Warp',
                    Utils.colorWarp,
                  ),
                  buildShortSummaryItems(
                    shortStopStatistics.weftStops.toString(),
                    "${shortStopStatistics.weftLoss.toStringAsFixed(1)}%",
                    shortStopStatistics.weftperHour.toStringAsFixed(1),
                    Icons.align_vertical_center,
                    'Weft',
                    Utils.colorWeft,
                  ),
                  buildShortSummaryItems(
                    shortStopStatistics.lenoStops.toString(),
                    "${shortStopStatistics.lenoLoss.toStringAsFixed(1)}%",
                    shortStopStatistics.lenoperHour.toStringAsFixed(1),
                    Icons.ac_unit,
                    'Leno',
                    Utils.colorLeno,
                  ),
                  buildShortSummaryItems(
                    shortStopStatistics.otherStops.toString(),
                    "${shortStopStatistics.otherLoss.toStringAsFixed(1)}%",
                    shortStopStatistics.otherperHour.toStringAsFixed(1),
                    Icons.auto_awesome_motion,
                    'Other',
                    Utils.colorOther,
                  ),
                  buildShortSummaryItems(
                    (shortStopStatistics.lenoStops +
                            shortStopStatistics.otherStops +
                            shortStopStatistics.weftStops +
                            shortStopStatistics.warpStops)
                        .toString(),
                    "${shortStopStatistics.totalLoss.toStringAsFixed(1)}%",
                    shortStopStatistics.totalperHour.toStringAsFixed(1),
                    Icons.blur_on,
                    'Total',
                    Utils.colorTotal,
                  ),
                  buildTextTitles(
                    'Long Stop Summary',
                    22.0,
                  ),
                  buildLongSummaryItems(
                      longStopDurations.mechanicalETime.toString(),
                      "${longStopDurations.mechanicalLoss.toStringAsFixed(1)}%",
                      Icons.settings,
                      "Mechanical",
                      Utils.colorMechanical),
                  buildLongSummaryItems(
                      longStopDurations.electricalETime.toString(),
                      "${longStopDurations.electricalLoss.toStringAsFixed(1)}%",
                      Icons.electrical_services,
                      "Electrical",
                      Utils.colorElectrical),
                  buildLongSummaryItems(
                      longStopDurations.knottingETime.toString(),
                      "${longStopDurations.knottingLoss.toStringAsFixed(1)}%",
                      Icons.radio_button_checked,
                      "Knotting",
                      Utils.colorKnotting),
                  buildLongSummaryItems(
                      longStopDurations.eArticleChangeETime.toString(),
                      "${longStopDurations.articleChangeLoss.toStringAsFixed(1)}%",
                      Icons.select_all,
                      "Article",
                      Utils.colorArticle),
                  buildLongSummaryItems(
                      longStopDurations.programNAETime.toString(),
                      "${longStopDurations.programNALoss.toStringAsFixed(1)}%",
                      Icons.report_problem,
                      "Program not available",
                      Utils.colorProgramNotAvailable),
                  buildLongSummaryItems(
                      longStopDurations.shutDownETime.toString(),
                      "${longStopDurations.shutDownLoss.toStringAsFixed(1)}%",
                      Icons.power_off,
                      "Shutdown",
                      Utils.colorElectrical),
                  buildLongSummaryItems(
                      longStopDurations.otherLongETime.toString(),
                      "${longStopDurations.otherLongLoss.toStringAsFixed(1)}%",
                      Icons.auto_awesome_motion,
                      "Others",
                      Utils.colorOthers),
                  buildLongSummaryItems(
                      longStopDurations.mechanicalETime.toString(),
                      "${longStopDurations.mechanicalLoss.toStringAsFixed(1)}%",
                      Icons.blur_on,
                      "Total",
                      Utils.colorTotal),
                ],
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
