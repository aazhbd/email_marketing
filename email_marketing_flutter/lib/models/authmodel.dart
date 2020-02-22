import 'package:json_annotation/json_annotation.dart';

part 'authmodel.g.dart';

@JsonSerializable()
class AuthModel {
  String username;
  String password;

  AuthModel(
    {this.username,
    this.password,
    }
  );

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);


}