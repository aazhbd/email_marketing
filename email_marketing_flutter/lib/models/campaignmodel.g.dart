// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaignmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignModel _$CampaignModelFromJson(Map<String, dynamic> json) {
  return CampaignModel(
    name: json['name'] as String,
    start_date: json['start_date'] as String,
    description: json['description'] as String,
    id: json['id'] as int,
  )..status = json['status'] as bool;
}

Map<String, dynamic> _$CampaignModelToJson(CampaignModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'start_date': instance.start_date,
      'description': instance.description,
      'status': instance.status,
      'id': instance.id,
    };
