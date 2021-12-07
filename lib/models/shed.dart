class Shed {
  List<GetLoomsDataResult> getLoomsDataResult;

  Shed({this.getLoomsDataResult});

  Shed.fromJson(Map<String, dynamic> json) {
    if (json['Get_LoomsDataByShedIDResult'] != null) {
      getLoomsDataResult = [];
      json['Get_LoomsDataByShedIDResult'].forEach((v) {
        getLoomsDataResult.add(new GetLoomsDataResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getLoomsDataResult != null) {
      data['Get_LoomsDataByShedIDResult'] =
          this.getLoomsDataResult.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetLoomsDataResult {
  String key;
  Value value;

  GetLoomsDataResult({this.key, this.value});

  GetLoomsDataResult.fromJson(Map<String, dynamic> json) {
    key = json['Key'];
    value = json['Value'] != null ? new Value.fromJson(json['Value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Key'] = this.key;
    if (this.value != null) {
      data['Value'] = this.value.toJson();
    }
    return data;
  }
}

class Value {
  CurrentParams currentParams;
  FixedParameters fixedParameters;
  PastShiftParams pastShiftParams;
  PersonalInfo personalInfo;
  SessionParams sessionParams;
  PastShiftParams shiftParams;

  Value(
      {this.currentParams,
      this.fixedParameters,
      this.pastShiftParams,
      this.personalInfo,
      this.sessionParams,
      this.shiftParams});

  Value.fromJson(Map<String, dynamic> json) {
    currentParams = json['CurrentParams'] != null
        ? new CurrentParams.fromJson(json['CurrentParams'])
        : null;
    fixedParameters = json['FixedParameters'] != null
        ? new FixedParameters.fromJson(json['FixedParameters'])
        : null;
    pastShiftParams = json['PastShiftParams'] != null
        ? new PastShiftParams.fromJson(json['PastShiftParams'])
        : null;
    personalInfo = json['PersonalInfo'] != null
        ? new PersonalInfo.fromJson(json['PersonalInfo'])
        : null;
    sessionParams = json['SessionParams'] != null
        ? new SessionParams.fromJson(json['SessionParams'])
        : null;
    shiftParams = json['ShiftParams'] != null
        ? new PastShiftParams.fromJson(json['ShiftParams'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currentParams != null) {
      data['CurrentParams'] = this.currentParams.toJson();
    }
    if (this.fixedParameters != null) {
      data['FixedParameters'] = this.fixedParameters.toJson();
    }
    if (this.pastShiftParams != null) {
      data['PastShiftParams'] = this.pastShiftParams.toJson();
    }
    if (this.personalInfo != null) {
      data['PersonalInfo'] = this.personalInfo.toJson();
    }
    if (this.sessionParams != null) {
      data['SessionParams'] = this.sessionParams.toJson();
    }
    if (this.shiftParams != null) {
      data['ShiftParams'] = this.shiftParams.toJson();
    }
    return data;
  }
}

class CurrentParams {
  var continuesRunningSeconds;
  var counter;
  String counterTime;
  var currentCounterState;
  var currentPicks;
  var currentRPM;
  String currentSinkIP;
  String currentSinkTime;
  var currentState;
  var dataNumber;
  var longStopCause;
  String sessionActualStartTime;
  var shortStopCause;
  var sinkNumber;

  CurrentParams(
      {this.continuesRunningSeconds,
      this.counter,
      this.counterTime,
      this.currentCounterState,
      this.currentPicks,
      this.currentRPM,
      this.currentSinkIP,
      this.currentSinkTime,
      this.currentState,
      this.dataNumber,
      this.longStopCause,
      this.sessionActualStartTime,
      this.shortStopCause,
      this.sinkNumber});

  CurrentParams.fromJson(Map<String, dynamic> json) {
    continuesRunningSeconds = json['ContinuesRunningSeconds'];
    counter = json['Counter'];
    counterTime = json['CounterTime'];
    currentCounterState = json['CurrentCounterState'];
    currentPicks = json['Current_Picks'];
    currentRPM = json['Current_RPM'];
    currentSinkIP = json['Current_SinkIP'];
    currentSinkTime = json['Current_SinkTime'];
    currentState = json['Current_State'];
    dataNumber = json['DataNumber'];
    longStopCause = json['LongStopCause'];
    sessionActualStartTime = json['Session_ActualStartTime'];
    shortStopCause = json['ShortStopCause'];
    sinkNumber = json['SinkNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ContinuesRunningSeconds'] = this.continuesRunningSeconds;
    data['Counter'] = this.counter;
    data['CounterTime'] = this.counterTime;
    data['CurrentCounterState'] = this.currentCounterState;
    data['Current_Picks'] = this.currentPicks;
    data['Current_RPM'] = this.currentRPM;
    data['Current_SinkIP'] = this.currentSinkIP;
    data['Current_SinkTime'] = this.currentSinkTime;
    data['Current_State'] = this.currentState;
    data['DataNumber'] = this.dataNumber;
    data['LongStopCause'] = this.longStopCause;
    data['Session_ActualStartTime'] = this.sessionActualStartTime;
    data['ShortStopCause'] = this.shortStopCause;
    data['SinkNumber'] = this.sinkNumber;
    return data;
  }
}

class FixedParameters {
  var loomCardEntryTypeRequested;
  String loomCardNo;
  var loomCardParamsRequested;
  String specsCardNo;
  var specsParamsRequested;
  var weaverCardEntryTypeRequested;
  String weaverID;
  var weaverParamsRequested;

  FixedParameters(
      {this.loomCardEntryTypeRequested,
      this.loomCardNo,
      this.loomCardParamsRequested,
      this.specsCardNo,
      this.specsParamsRequested,
      this.weaverCardEntryTypeRequested,
      this.weaverID,
      this.weaverParamsRequested});

  FixedParameters.fromJson(Map<String, dynamic> json) {
    loomCardEntryTypeRequested = json['LoomCardEntryTypeRequested'];
    loomCardNo = json['LoomCardNo'];
    loomCardParamsRequested = json['LoomCardParamsRequested'];
    specsCardNo = json['SpecsCardNo'];
    specsParamsRequested = json['SpecsParamsRequested'];
    weaverCardEntryTypeRequested = json['WeaverCardEntryTypeRequested'];
    weaverID = json['WeaverID'];
    weaverParamsRequested = json['WeaverParamsRequested'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LoomCardEntryTypeRequested'] = this.loomCardEntryTypeRequested;
    data['LoomCardNo'] = this.loomCardNo;
    data['LoomCardParamsRequested'] = this.loomCardParamsRequested;
    data['SpecsCardNo'] = this.specsCardNo;
    data['SpecsParamsRequested'] = this.specsParamsRequested;
    data['WeaverCardEntryTypeRequested'] = this.weaverCardEntryTypeRequested;
    data['WeaverID'] = this.weaverID;
    data['WeaverParamsRequested'] = this.weaverParamsRequested;
    return data;
  }
}

class PastShiftParams {
  var totalDownTime;
  LongStopDurations longStopDurations;
  RunningStatistics runningStatistics;
  ShortStopStatistics shortStopStatistics;

  PastShiftParams(
      {this.totalDownTime,
      this.longStopDurations,
      this.runningStatistics,
      this.shortStopStatistics});

  PastShiftParams.fromJson(Map<String, dynamic> json) {
    totalDownTime = json['TotalDownTime'];
    longStopDurations = json['longStopDurations'] != null
        ? new LongStopDurations.fromJson(json['longStopDurations'])
        : null;
    runningStatistics = json['runningStatistics'] != null
        ? new RunningStatistics.fromJson(json['runningStatistics'])
        : null;
    shortStopStatistics = json['shortStopStatistics'] != null
        ? new ShortStopStatistics.fromJson(json['shortStopStatistics'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TotalDownTime'] = this.totalDownTime;
    if (this.longStopDurations != null) {
      data['longStopDurations'] = this.longStopDurations.toJson();
    }
    if (this.runningStatistics != null) {
      data['runningStatistics'] = this.runningStatistics.toJson();
    }
    if (this.shortStopStatistics != null) {
      data['shortStopStatistics'] = this.shortStopStatistics.toJson();
    }
    return data;
  }
}

class LongStopDurations {
  var articleChangeETime;
  var articleChangeLoss;
  var electricalETime;
  var electricalLoss;
  var knottingETime;
  var knottingLoss;
  var mechanicalETime;
  var mechanicalLoss;
  var otherLongETime;
  var otherLongLoss;
  var programNAETime;
  var programNALoss;
  var shutDownETime;
  var shutDownLoss;
  var totalETime;
  var totalLoss;
  var eArticleChangeETime;
  var eElectricalETime;
  var eKnottingETime;
  var eMechanicalETime;
  var eOtherLongETime;
  var eProgramNAETime;
  var eShutDownETime;
  var eTotalETime;

  LongStopDurations(
      {this.articleChangeETime,
      this.articleChangeLoss,
      this.electricalETime,
      this.electricalLoss,
      this.knottingETime,
      this.knottingLoss,
      this.mechanicalETime,
      this.mechanicalLoss,
      this.otherLongETime,
      this.otherLongLoss,
      this.programNAETime,
      this.programNALoss,
      this.shutDownETime,
      this.shutDownLoss,
      this.totalETime,
      this.totalLoss,
      this.eArticleChangeETime,
      this.eElectricalETime,
      this.eKnottingETime,
      this.eMechanicalETime,
      this.eOtherLongETime,
      this.eProgramNAETime,
      this.eShutDownETime,
      this.eTotalETime});

  LongStopDurations.fromJson(Map<String, dynamic> json) {
    articleChangeETime = json['ArticleChange_ETime'];
    articleChangeLoss = json['ArticleChange_Loss'];
    electricalETime = json['Electrical_ETime'];
    electricalLoss = json['Electrical_Loss'];
    knottingETime = json['Knotting_ETime'];
    knottingLoss = json['Knotting_Loss'];
    mechanicalETime = json['Mechanical_ETime'];
    mechanicalLoss = json['Mechanical_Loss'];
    otherLongETime = json['OtherLong_ETime'];
    otherLongLoss = json['OtherLong_Loss'];
    programNAETime = json['ProgramNA_ETime'];
    programNALoss = json['ProgramNA_Loss'];
    shutDownETime = json['ShutDown_ETime'];
    shutDownLoss = json['ShutDown_Loss'];
    totalETime = json['Total_ETime'];
    totalLoss = json['Total_Loss'];
    eArticleChangeETime = json['eArticleChange_ETime'];
    eElectricalETime = json['eElectrical_ETime'];
    eKnottingETime = json['eKnotting_ETime'];
    eMechanicalETime = json['eMechanical_ETime'];
    eOtherLongETime = json['eOtherLong_ETime'];
    eProgramNAETime = json['eProgramNA_ETime'];
    eShutDownETime = json['eShutDown_ETime'];
    eTotalETime = json['eTotal_ETime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ArticleChange_ETime'] = this.articleChangeETime;
    data['ArticleChange_Loss'] = this.articleChangeLoss;
    data['Electrical_ETime'] = this.electricalETime;
    data['Electrical_Loss'] = this.electricalLoss;
    data['Knotting_ETime'] = this.knottingETime;
    data['Knotting_Loss'] = this.knottingLoss;
    data['Mechanical_ETime'] = this.mechanicalETime;
    data['Mechanical_Loss'] = this.mechanicalLoss;
    data['OtherLong_ETime'] = this.otherLongETime;
    data['OtherLong_Loss'] = this.otherLongLoss;
    data['ProgramNA_ETime'] = this.programNAETime;
    data['ProgramNA_Loss'] = this.programNALoss;
    data['ShutDown_ETime'] = this.shutDownETime;
    data['ShutDown_Loss'] = this.shutDownLoss;
    data['Total_ETime'] = this.totalETime;
    data['Total_Loss'] = this.totalLoss;
    data['eArticleChange_ETime'] = this.eArticleChangeETime;
    data['eElectrical_ETime'] = this.eElectricalETime;
    data['eKnotting_ETime'] = this.eKnottingETime;
    data['eMechanical_ETime'] = this.eMechanicalETime;
    data['eOtherLong_ETime'] = this.eOtherLongETime;
    data['eProgramNA_ETime'] = this.eProgramNAETime;
    data['eShutDown_ETime'] = this.eShutDownETime;
    data['eTotal_ETime'] = this.eTotalETime;
    return data;
  }
}

class RunningStatistics {
  var efficiency;
  var picks;
  var picksShouldBe;
  var productionEfficiency;
  var rPM;

  RunningStatistics(
      {this.efficiency,
      this.picks,
      this.picksShouldBe,
      this.productionEfficiency,
      this.rPM});

  RunningStatistics.fromJson(Map<String, dynamic> json) {
    efficiency = json['Efficiency'];
    picks = json['Picks'];
    picksShouldBe = json['PicksShouldBe'];
    productionEfficiency = json['ProductionEfficiency'];
    rPM = json['RPM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Efficiency'] = this.efficiency;
    data['Picks'] = this.picks;
    data['PicksShouldBe'] = this.picksShouldBe;
    data['ProductionEfficiency'] = this.productionEfficiency;
    data['RPM'] = this.rPM;
    return data;
  }
}

class ShortStopStatistics {
  var lenoLoss;
  var lenoStops;
  var lenoETime;
  var lenoperHour;
  var otherLoss;
  var otherStops;
  var otherETime;
  var otherperHour;
  var totalLoss;
  var totalETime;
  var totalperHour;
  var warpAvgKnotTime;
  var warpLoss;
  var warpStops;
  var warpETime;
  var warpperHour;
  var weftAvgKnotTime;
  var weftLoss;
  var weftStops;
  var weftETime;
  var weftperHour;

  ShortStopStatistics(
      {this.lenoLoss,
      this.lenoStops,
      this.lenoETime,
      this.lenoperHour,
      this.otherLoss,
      this.otherStops,
      this.otherETime,
      this.otherperHour,
      this.totalLoss,
      this.totalETime,
      this.totalperHour,
      this.warpAvgKnotTime,
      this.warpLoss,
      this.warpStops,
      this.warpETime,
      this.warpperHour,
      this.weftAvgKnotTime,
      this.weftLoss,
      this.weftStops,
      this.weftETime,
      this.weftperHour});

  ShortStopStatistics.fromJson(Map<String, dynamic> json) {
    lenoLoss = json['LenoLoss'];
    lenoStops = json['LenoStops'];
    lenoETime = json['Leno_ETime'];
    lenoperHour = json['LenoperHour'];
    otherLoss = json['OtherLoss'];
    otherStops = json['OtherStops'];
    otherETime = json['Other_ETime'];
    otherperHour = json['OtherperHour'];
    totalLoss = json['TotalLoss'];
    totalETime = json['Total_ETime'];
    totalperHour = json['TotalperHour'];
    warpAvgKnotTime = json['WarpAvgKnotTime'];
    warpLoss = json['WarpLoss'];
    warpStops = json['WarpStops'];
    warpETime = json['Warp_ETime'];
    warpperHour = json['WarpperHour'];
    weftAvgKnotTime = json['WeftAvgKnotTime'];
    weftLoss = json['WeftLoss'];
    weftStops = json['WeftStops'];
    weftETime = json['Weft_ETime'];
    weftperHour = json['WeftperHour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LenoLoss'] = this.lenoLoss;
    data['LenoStops'] = this.lenoStops;
    data['Leno_ETime'] = this.lenoETime;
    data['LenoperHour'] = this.lenoperHour;
    data['OtherLoss'] = this.otherLoss;
    data['OtherStops'] = this.otherStops;
    data['Other_ETime'] = this.otherETime;
    data['OtherperHour'] = this.otherperHour;
    data['TotalLoss'] = this.totalLoss;
    data['Total_ETime'] = this.totalETime;
    data['TotalperHour'] = this.totalperHour;
    data['WarpAvgKnotTime'] = this.warpAvgKnotTime;
    data['WarpLoss'] = this.warpLoss;
    data['WarpStops'] = this.warpStops;
    data['Warp_ETime'] = this.warpETime;
    data['WarpperHour'] = this.warpperHour;
    data['WeftAvgKnotTime'] = this.weftAvgKnotTime;
    data['WeftLoss'] = this.weftLoss;
    data['WeftStops'] = this.weftStops;
    data['Weft_ETime'] = this.weftETime;
    data['WeftperHour'] = this.weftperHour;
    return data;
  }
}

class PersonalInfo {
  bool activated;
  var loomID;
  String loomName;
  String mAC;
  var shedID;
  var versionNumber;

  PersonalInfo(
      {this.activated,
      this.loomID,
      this.loomName,
      this.mAC,
      this.shedID,
      this.versionNumber});

  PersonalInfo.fromJson(Map<String, dynamic> json) {
    activated = json['Activated'];
    loomID = json['LoomID'];
    loomName = json['LoomName'];
    mAC = json['MAC'];
    shedID = json['ShedID'];
    versionNumber = json['VersionNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Activated'] = this.activated;
    data['LoomID'] = this.loomID;
    data['LoomName'] = this.loomName;
    data['MAC'] = this.mAC;
    data['ShedID'] = this.shedID;
    data['VersionNumber'] = this.versionNumber;
    return data;
  }
}

class SessionParams {
  String sessionEndTime;
  var sessionPicks;
  var sessionRPM;
  String sessionStartTime;

  SessionParams(
      {this.sessionEndTime,
      this.sessionPicks,
      this.sessionRPM,
      this.sessionStartTime});

  SessionParams.fromJson(Map<String, dynamic> json) {
    sessionEndTime = json['Session_EndTime'];
    sessionPicks = json['Session_Picks'];
    sessionRPM = json['Session_RPM'];
    sessionStartTime = json['Session_StartTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Session_EndTime'] = this.sessionEndTime;
    data['Session_Picks'] = this.sessionPicks;
    data['Session_RPM'] = this.sessionRPM;
    data['Session_StartTime'] = this.sessionStartTime;
    return data;
  }
}
