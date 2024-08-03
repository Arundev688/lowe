class PackageOnboardModel {
  String? status;
  String? health;
  String? pID;
  String? barcode;
  String? createdBy;
  String? updatedBy;
  String? id;

  PackageOnboardModel(
      {this.status,
      this.health,
      this.pID,
      this.barcode,
      this.createdBy,
      this.updatedBy,
      this.id});

  PackageOnboardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    health = json['health'];
    pID = json['PID'];
    barcode = json['barcode'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['health'] = this.health;
    data['PID'] = this.pID;
    data['barcode'] = this.barcode;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['id'] = this.id;
    return data;
  }
}
