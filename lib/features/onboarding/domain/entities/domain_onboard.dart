import 'package:equatable/equatable.dart';

class DomainOnboard extends Equatable {
  final bool? isPackage;
  final bool? isSensor;
  final bool? isOnBoarded;
  final bool? isAssociated;
  final String? barcode;
  final String? id;

  DomainOnboard({this.isPackage, this.isSensor, this.isOnBoarded,
      this.isAssociated, this.barcode, this.id});

  @override
  List<Object?> get props => [isPackage, isSensor, isSensor, isAssociated,barcode, id];
}
