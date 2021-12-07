class ShedResult {
  List<GetShedsResult> getShedsResult;

  ShedResult({this.getShedsResult});

  ShedResult.fromJson(Map<String, dynamic> json) {
    if (json['Get_ShedsResult'] != null) {
      getShedsResult = new List<GetShedsResult>();
      json['Get_ShedsResult'].forEach((v) {
        getShedsResult.add(new GetShedsResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getShedsResult != null) {
      data['Get_ShedsResult'] =
          this.getShedsResult.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetShedsResult {
  CurrentShift currentShift;
  String shedID;
  String shedName;
  ShedSummary shedSummary;

  GetShedsResult(
      {this.currentShift, this.shedID, this.shedName, this.shedSummary});

  GetShedsResult.fromJson(Map<String, dynamic> json) {
    currentShift = json['CurrentShift'] != null
        ? new CurrentShift.fromJson(json['CurrentShift'])
        : null;
    shedID = json['ShedID'];
    shedName = json['ShedName'];
    shedSummary = json['shedSummary'] != null
        ? new ShedSummary.fromJson(json['shedSummary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currentShift != null) {
      data['CurrentShift'] = this.currentShift.toJson();
    }
    data['ShedID'] = this.shedID;
    data['ShedName'] = this.shedName;
    if (this.shedSummary != null) {
      data['shedSummary'] = this.shedSummary.toJson();
    }
    return data;
  }
}

class CurrentShift {
  var noOfShifts;
  String shiftName;
  String shiftStartDate;
  String wShift;

  CurrentShift(
      {this.noOfShifts, this.shiftName, this.shiftStartDate, this.wShift});

  CurrentShift.fromJson(Map<String, dynamic> json) {
    noOfShifts = json['NoOfShifts'];
    shiftName = json['ShiftName'];
    shiftStartDate = json['ShiftStartDate'];
    wShift = json['WShift'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NoOfShifts'] = this.noOfShifts;
    data['ShiftName'] = this.shiftName;
    data['ShiftStartDate'] = this.shiftStartDate;
    data['WShift'] = this.wShift;
    return data;
  }
}

class ShedSummary {
  CollectiveSummary collectiveSummary;
  LongSummary longSummary;
  ShortSummary shortSummary;

  ShedSummary({this.collectiveSummary, this.longSummary, this.shortSummary});

  ShedSummary.fromJson(Map<String, dynamic> json) {
    collectiveSummary = json['collectiveSummary'] != null
        ? new CollectiveSummary.fromJson(json['collectiveSummary'])
        : null;
    longSummary = json['longSummary'] != null
        ? new LongSummary.fromJson(json['longSummary'])
        : null;
    shortSummary = json['shortSummary'] != null
        ? new ShortSummary.fromJson(json['shortSummary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.collectiveSummary != null) {
      data['collectiveSummary'] = this.collectiveSummary.toJson();
    }
    if (this.longSummary != null) {
      data['longSummary'] = this.longSummary.toJson();
    }
    if (this.shortSummary != null) {
      data['shortSummary'] = this.shortSummary.toJson();
    }
    return data;
  }
}

class CollectiveSummary {
  var efficiency;
  var longStopped;
  var productionEfficiency;
  var rPM;
  var runningLooms;
  var shortStopped;
  var totalLooms;

  CollectiveSummary(
      {this.efficiency,
        this.longStopped,
        this.productionEfficiency,
        this.rPM,
        this.runningLooms,
        this.shortStopped,
        this.totalLooms});

  CollectiveSummary.fromJson(Map<String, dynamic> json) {
    efficiency = json['Efficiency'];
    longStopped = json['LongStopped'];
    productionEfficiency = json['ProductionEfficiency'];
    rPM = json['RPM'];
    runningLooms = json['RunningLooms'];
    shortStopped = json['ShortStopped'];
    totalLooms = json['TotalLooms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Efficiency'] = this.efficiency;
    data['LongStopped'] = this.longStopped;
    data['ProductionEfficiency'] = this.productionEfficiency;
    data['RPM'] = this.rPM;
    data['RunningLooms'] = this.runningLooms;
    data['ShortStopped'] = this.shortStopped;
    data['TotalLooms'] = this.totalLooms;
    return data;
  }
}

class LongSummary {
  var articleChangeLoss;
  var articleChangeStopped;
  var electricalLoss;
  var electricalStopped;
  var knottingLoss;
  var knottingStopped;
  var mechanicalLoss;
  var mechanicalStopped;
  var otherLongLoss;
  var otherLongStopped;
  var programNALoss;
  var programNAStopped;
  var shutDownLoss;
  var shutDownStopped;
  var totalLoss;
  var totalStopped;

  LongSummary(
      {this.articleChangeLoss,
        this.articleChangeStopped,
        this.electricalLoss,
        this.electricalStopped,
        this.knottingLoss,
        this.knottingStopped,
        this.mechanicalLoss,
        this.mechanicalStopped,
        this.otherLongLoss,
        this.otherLongStopped,
        this.programNALoss,
        this.programNAStopped,
        this.shutDownLoss,
        this.shutDownStopped,
        this.totalLoss,
        this.totalStopped});

  LongSummary.fromJson(Map<String, dynamic> json) {
    articleChangeLoss = json['ArticleChange_Loss'];
    articleChangeStopped = json['ArticleChange_Stopped'];
    electricalLoss = json['Electrical_Loss'];
    electricalStopped = json['Electrical_Stopped'];
    knottingLoss = json['Knotting_Loss'];
    knottingStopped = json['Knotting_Stopped'];
    mechanicalLoss = json['Mechanical_Loss'];
    mechanicalStopped = json['Mechanical_Stopped'];
    otherLongLoss = json['OtherLong_Loss'];
    otherLongStopped = json['OtherLong_Stopped'];
    programNALoss = json['ProgramNA_Loss'];
    programNAStopped = json['ProgramNA_Stopped'];
    shutDownLoss = json['ShutDown_Loss'];
    shutDownStopped = json['ShutDown_Stopped'];
    totalLoss = json['Total_Loss'];
    totalStopped = json['Total_Stopped'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ArticleChange_Loss'] = this.articleChangeLoss;
    data['ArticleChange_Stopped'] = this.articleChangeStopped;
    data['Electrical_Loss'] = this.electricalLoss;
    data['Electrical_Stopped'] = this.electricalStopped;
    data['Knotting_Loss'] = this.knottingLoss;
    data['Knotting_Stopped'] = this.knottingStopped;
    data['Mechanical_Loss'] = this.mechanicalLoss;
    data['Mechanical_Stopped'] = this.mechanicalStopped;
    data['OtherLong_Loss'] = this.otherLongLoss;
    data['OtherLong_Stopped'] = this.otherLongStopped;
    data['ProgramNA_Loss'] = this.programNALoss;
    data['ProgramNA_Stopped'] = this.programNAStopped;
    data['ShutDown_Loss'] = this.shutDownLoss;
    data['ShutDown_Stopped'] = this.shutDownStopped;
    data['Total_Loss'] = this.totalLoss;
    data['Total_Stopped'] = this.totalStopped;
    return data;
  }
}

class ShortSummary {
  var lenoLoss;
  var lenoStops;
  var lenoperHour;
  var otherLoss;
  var otherStops;
  var otherperHour;
  var totalLoss;
  var totalStops;
  var totalperHour;
  var warpAvgKnotTime;
  var warpLoss;
  var warpStops;
  var warpperHour;
  var weftAvgKnotTime;
  var weftLoss;
  var weftStops;
  var weftperHour;

  ShortSummary(
      {this.lenoLoss,
        this.lenoStops,
        this.lenoperHour,
        this.otherLoss,
        this.otherStops,
        this.otherperHour,
        this.totalLoss,
        this.totalStops,
        this.totalperHour,
        this.warpAvgKnotTime,
        this.warpLoss,
        this.warpStops,
        this.warpperHour,
        this.weftAvgKnotTime,
        this.weftLoss,
        this.weftStops,
        this.weftperHour});

  ShortSummary.fromJson(Map<String, dynamic> json) {
    lenoLoss = json['LenoLoss'];
    lenoStops = json['LenoStops'];
    lenoperHour = json['LenoperHour'];
    otherLoss = json['OtherLoss'];
    otherStops = json['OtherStops'];
    otherperHour = json['OtherperHour'];
    totalLoss = json['TotalLoss'];
    totalStops = json['TotalStops'];
    totalperHour = json['TotalperHour'];
    warpAvgKnotTime = json['WarpAvgKnotTime'];
    warpLoss = json['WarpLoss'];
    warpStops = json['WarpStops'];
    warpperHour = json['WarpperHour'];
    weftAvgKnotTime = json['WeftAvgKnotTime'];
    weftLoss = json['WeftLoss'];
    weftStops = json['WeftStops'];
    weftperHour = json['WeftperHour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LenoLoss'] = this.lenoLoss;
    data['LenoStops'] = this.lenoStops;
    data['LenoperHour'] = this.lenoperHour;
    data['OtherLoss'] = this.otherLoss;
    data['OtherStops'] = this.otherStops;
    data['OtherperHour'] = this.otherperHour;
    data['TotalLoss'] = this.totalLoss;
    data['TotalStops'] = this.totalStops;
    data['TotalperHour'] = this.totalperHour;
    data['WarpAvgKnotTime'] = this.warpAvgKnotTime;
    data['WarpLoss'] = this.warpLoss;
    data['WarpStops'] = this.warpStops;
    data['WarpperHour'] = this.warpperHour;
    data['WeftAvgKnotTime'] = this.weftAvgKnotTime;
    data['WeftLoss'] = this.weftLoss;
    data['WeftStops'] = this.weftStops;
    data['WeftperHour'] = this.weftperHour;
    return data;
  }
}