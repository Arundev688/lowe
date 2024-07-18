import 'package:lowes/features/onboarding/domain/entities/domain_onboard.dart';

class OnboardResponse extends DomainOnboard{
  bool? isPackage;
  bool? isSensor;
  bool? isOnBoarded;
  bool? isAssociated;
  String? barcode;
  String? id;

  OnboardResponse(
      {this.isPackage,
      this.isSensor,
      this.isOnBoarded,
      this.isAssociated,
      this.barcode,
      this.id}):super(
    isPackage:isPackage,
    isSensor: isSensor,
    isOnBoarded: isOnBoarded,
    isAssociated: isAssociated,
    barcode: barcode,
    id: id
  );

  OnboardResponse.fromJson(Map<String, dynamic> json) {
    isPackage = json['isPackage'];
    isSensor = json['isSensor'];
    isOnBoarded = json['isOnBoarded'];
    isAssociated = json['isAssociated'];
    barcode = json['barcode'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isPackage'] = this.isPackage;
    data['isSensor'] = this.isSensor;
    data['isOnBoarded'] = this.isOnBoarded;
    data['isAssociated'] = this.isAssociated;
    data['barcode'] = this.barcode;
    data['id'] = this.id;
    return data;
  }
}
