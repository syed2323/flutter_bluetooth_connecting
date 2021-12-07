// class LoomCardInfo {
//   DataSet dataSet;
//
//   LoomCardInfo({this.dataSet});
//
//   LoomCardInfo.fromJson(Map<String, dynamic> json) {
//     dataSet =
//     json['DataSet'] != null ? new DataSet.fromJson(json['DataSet']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.dataSet != null) {
//       data['DataSet'] = this.dataSet.toJson();
//     }
//     return data;
//   }
// }
//
// class DataSet {
//   Schema schema;
//   Diffgram diffgram;
//
//   DataSet({this.schema, this.diffgram});
//
//   DataSet.fromJson(Map<String, dynamic> json) {
//     schema =
//     json['schema'] != null ? new Schema.fromJson(json['schema']) : null;
//     diffgram = json['diffgram'] != null
//         ? new Diffgram.fromJson(json['diffgram'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.schema != null) {
//       data['schema'] = this.schema.toJson();
//     }
//     if (this.diffgram != null) {
//       data['diffgram'] = this.diffgram.toJson();
//     }
//     return data;
//   }
// }
//
// class Schema {
//   Element element;
//
//   Schema({this.element});
//
//   Schema.fromJson(Map<String, dynamic> json) {
//     element =
//     json['element'] != null ? new Element.fromJson(json['element']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.element != null) {
//       data['element'] = this.element.toJson();
//     }
//     return data;
//   }
// }
//
// class Element {
//   ComplexType complexType;
//
//   Element({this.complexType});
//
//   Element.fromJson(Map<String, dynamic> json) {
//     complexType = json['complexType'] != null
//         ? new ComplexType.fromJson(json['complexType'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.complexType != null) {
//       data['complexType'] = this.complexType.toJson();
//     }
//     return data;
//   }
// }
//
// class ComplexType {
//   Schema choice;
//
//   ComplexType({this.choice});
//
//   ComplexType.fromJson(Map<String, dynamic> json) {
//     choice =
//     json['choice'] != null ? new Schema.fromJson(json['choice']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.choice != null) {
//       data['choice'] = this.choice.toJson();
//     }
//     return data;
//   }
// }
//
// class ComplexType {
//   Sequence sequence;
//
//   ComplexType({this.sequence});
//
//   ComplexType.fromJson(Map<String, dynamic> json) {
//     sequence = json['sequence'] != null
//         ? new Sequence.fromJson(json['sequence'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.sequence != null) {
//       data['sequence'] = this.sequence.toJson();
//     }
//     return data;
//   }
// }
//
// class Sequence {
//   List<String> element;
//
//   Sequence({this.element});
//
//   Sequence.fromJson(Map<String, dynamic> json) {
//     element = json['element'].cast<String>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['element'] = this.element;
//     return data;
//   }
// }
//
// class Diffgram {
//   NewDataSet newDataSet;
//
//   Diffgram({this.newDataSet});
//
//   Diffgram.fromJson(Map<String, dynamic> json) {
//     newDataSet = json['NewDataSet'] != null
//         ? new NewDataSet.fromJson(json['NewDataSet'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.newDataSet != null) {
//       data['NewDataSet'] = this.newDataSet.toJson();
//     }
//     return data;
//   }
// }
//
// class NewDataSet {
//   Table table;
//
//   NewDataSet({this.table});
//
//   NewDataSet.fromJson(Map<String, dynamic> json) {
//     table = json['Table'] != null ? new Table.fromJson(json['Table']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.table != null) {
//       data['Table'] = this.table.toJson();
//     }
//     return data;
//   }
// }
//
// class Table {
//   int loomID;
//   String shedName;
//   int shedID;
//   int loomName;
//   int loomCardNo;
//   String loomCardDate;
//   int articleID;
//   String articleName;
//   String productName;
//   String model;
//   int loomCardActionID;
//   String loomCardActionName;
//   int setNo;
//   int beamNo;
//   int beamStatusID;
//   String beamStatus;
//
//   Table(
//       {this.loomID,
//         this.shedName,
//         this.shedID,
//         this.loomName,
//         this.loomCardNo,
//         this.loomCardDate,
//         this.articleID,
//         this.articleName,
//         this.productName,
//         this.model,
//         this.loomCardActionID,
//         this.loomCardActionName,
//         this.setNo,
//         this.beamNo,
//         this.beamStatusID,
//         this.beamStatus});
//
//   Table.fromJson(Map<String, dynamic> json) {
//     loomID = json['LoomID'];
//     shedName = json['ShedName'];
//     shedID = json['ShedID'];
//     loomName = json['LoomName'];
//     loomCardNo = json['LoomCardNo'];
//     loomCardDate = json['LoomCardDate'];
//     articleID = json['ArticleID'];
//     articleName = json['ArticleName'];
//     productName = json['ProductName'];
//     model = json['Model'];
//     loomCardActionID = json['LoomCardActionID'];
//     loomCardActionName = json['LoomCardActionName'];
//     setNo = json['SetNo'];
//     beamNo = json['BeamNo'];
//     beamStatusID = json['BeamStatusID'];
//     beamStatus = json['BeamStatus'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['LoomID'] = this.loomID;
//     data['ShedName'] = this.shedName;
//     data['ShedID'] = this.shedID;
//     data['LoomName'] = this.loomName;
//     data['LoomCardNo'] = this.loomCardNo;
//     data['LoomCardDate'] = this.loomCardDate;
//     data['ArticleID'] = this.articleID;
//     data['ArticleName'] = this.articleName;
//     data['ProductName'] = this.productName;
//     data['Model'] = this.model;
//     data['LoomCardActionID'] = this.loomCardActionID;
//     data['LoomCardActionName'] = this.loomCardActionName;
//     data['SetNo'] = this.setNo;
//     data['BeamNo'] = this.beamNo;
//     data['BeamStatusID'] = this.beamStatusID;
//     data['BeamStatus'] = this.beamStatus;
//     return data;
//   }
// }