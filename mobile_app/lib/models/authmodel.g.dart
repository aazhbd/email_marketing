// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) {
  return AuthModel(
    username: json['username'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
