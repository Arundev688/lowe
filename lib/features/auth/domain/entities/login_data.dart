import 'package:equatable/equatable.dart';

class DomainLoginResponse extends Equatable {
  final DomainUser? user;
  final DomainTokens? tokens;

  DomainLoginResponse({this.user,this.tokens});

  @override
  List<Object?> get props => [user, tokens];
}

class DomainUser extends Equatable {
  final String? role;
  final bool? isEmailVerified;
  final String? name;
  final String? email;
  final String? id;

  DomainUser({
    required this.role,
    required this.isEmailVerified,
    required this.name,
    required this.email,
    required this.id,
  });

  @override
  List<Object?> get props => [role, isEmailVerified, name, email, id];
}

class DomainTokens extends Equatable {
  final DomainAccess? access;
  final DomainAccess? refresh;

  DomainTokens({required this.access, required this.refresh});

  @override
  List<Object?> get props => [access, refresh];
}

class DomainAccess extends Equatable {
  final String? token;
  final String? expires;

  DomainAccess({required this.token, required this.expires});

  @override
  List<Object?> get props => [token, expires];
}
