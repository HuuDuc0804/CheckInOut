class CheckInOutModel {
  int? userEnrollNumber;
  String? timeDate;
  String? timeStr;
  String? originType;
  String? newType;
  String? source;
  int? machineNo;
  int? workCode;

  CheckInOutModel(
      {this.userEnrollNumber,
      this.timeDate,
      this.timeStr,
      this.originType,
      this.newType,
      this.source,
      this.machineNo,
      this.workCode});

  CheckInOutModel.fromJson(Map<String, dynamic> json) {
    userEnrollNumber = json['userEnrollNumber'];
    timeDate = json['timeDate'];
    timeStr = json['timeStr'];
    originType = json['originType'];
    newType = json['newType'];
    source = json['source'];
    machineNo = json['machineNo'];
    workCode = json['workCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['userEnrollNumber'] = userEnrollNumber;
    data['timeDate'] = timeDate;
    data['timeStr'] = timeStr;
    data['originType'] = originType;
    data['newType'] = newType;
    data['source'] = source;
    data['machineNo'] = machineNo;
    data['workCode'] = workCode;
    return data;
  }
}