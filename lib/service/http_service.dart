import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machine_eyes_flutter/models/loom_data_result.dart';

import 'package:machine_eyes_flutter/models/shed_resullt.dart';
import 'package:machine_eyes_flutter/models/shed.dart';

class HttpService {
  final baseUrl = "http://110.38.73.19:3128";
  // final baseUrl = "http://128.0.9.182:3128";

  Future<Shed> getLoomData() async {
    String url =
        "$baseUrl/MachineEyesService.svc/RestFulWCFMachineEyes/Get_LoomsData/?SessionKey=343433";

    var uri = Uri.parse(url);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      // print(
      //     "response.body----------------------------------------------------" +
      //         response.body);
      var getLoomDataResultJson = jsonDecode(response.body);
      var shed = Shed.fromJson(getLoomDataResultJson);
      return shed;
    } else {
      throw "Unable to retrieve data";
    }
  }

  Future<Shed> getLoomDataById(String id) async {
    String url =
        "$baseUrl/MachineEyesService.svc/RestFulWCFMachineEyes/Get_LoomsDataByShedID/?SessionKey=343433&ShedID=$id";
    // print(
    //     "GET LOOM DATA BY ID::::::::::::::::::::::::::::::::::::::::::::::::::::::::::" +
    //         url);
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      // print(
      //     "get loom data by id ::::::::::::::::::::::::::::::::::::::::::::::::" +
      //         response.body);
      var getLoomDataResultJson = jsonDecode(response.body);
      var shed = Shed.fromJson(getLoomDataResultJson);
      return shed;
    } else {
      throw "Unable to retrieve data";
    }
  }

  Future<LoomDataResult> getLoomByMacId(String mac) async {
    String url =
        "$baseUrl/MachineEyesService.svc/RestFulWCFMachineEyes/Get_LoomData/?SessionKey=343433&mac=$mac";

    // print("GET LOOM DATA BY MAC ID:::::::::::::::::::::::::::::::::::::" + url);

    var uri = Uri.parse(url);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      print("get loom data by mac id::::::::::::::::::::::::::::::::::::" +
          response.body);
      var getLoomDataResultJson = jsonDecode(response.body);
      var loom = LoomDataResult.fromJson(getLoomDataResultJson);
      return loom;
    } else {
      throw "Unable to retrieve data";
    }
  }

  Future<ShedResult> getShedOverAllSummary() async {
    String url =
        "$baseUrl/MachineEyesService.svc/RestFulWCFMachineEyes/Get_Sheds/?SessionKey=343433";

    var uri = Uri.parse(url);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      // print("shed summary ::::::::::::::::::: " + response.body);
      var shedJson = jsonDecode(response.body);
      var shed = ShedResult.fromJson(shedJson);
      return shed;
    } else {
      throw "Unable to retrieve data";
    }
  }
}
