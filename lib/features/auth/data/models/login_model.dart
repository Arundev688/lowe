import 'package:lowes/features/auth/domain/entities/login_data.dart';

class LoginResponse extends DomainLoginResponse {
  User? user;
  Tokens? tokens;

  LoginResponse({this.user, this.tokens}):super(user: user,tokens: tokens);

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      tokens: json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (tokens != null) {
      data['tokens'] = tokens!.toJson();
    }
    return data;
  }

}

class User extends DomainUser {
  String? role;
  bool? isEmailVerified;
  String? name;
  String? email;
  String? id;

  User({this.role, this.isEmailVerified, this.name, this.email, this.id}) : super(
    role: role,
    isEmailVerified: isEmailVerified,
    name: name,
    email: email,
    id: id
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      role: json['role'],
      isEmailVerified: json['isEmailVerified'],
      name: json['name'],
      email: json['email'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role'] = role;
    data['isEmailVerified'] = isEmailVerified;
    data['name'] = name;
    data['email'] = email;
    data['id'] = id;
    return data;
  }

}

class Tokens extends DomainTokens {
  Access? access;
  Access? refresh;

  Tokens({this.access, this.refresh}):super(access: access,refresh: refresh);

  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(
      access: json['access'] != null ? Access.fromJson(json['access']) : null,
      refresh:
          json['refresh'] != null ? Access.fromJson(json['refresh']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (access != null) {
      data['access'] = access!.toJson();
    }
    if (refresh != null) {
      data['refresh'] = refresh!.toJson();
    }
    return data;
  }

}

class Access  extends DomainAccess {
  String? token;
  String? expires;

  Access({this.token, this.expires}):super(token: token,expires: expires);

  factory Access.fromJson(Map<String, dynamic> json) {
    return Access(
      token: json['token'],
      expires: json['expires'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['expires'] = expires;
    return data;
  }

  DomainAccess toDomain() {
    return DomainAccess(
      token: token!,
      expires: expires!,
    );
  }

  @override
  List<Object?> get props => [token,expires];
}
