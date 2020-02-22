import 'package:json_annotation/json_annotation.dart';

part 'campaignmodel.g.dart';

@JsonSerializable(explicitToJson: true)
class CampaignModel{
       String name;
       String start_date;
       String description;
       bool status;
       int id;

 CampaignModel({this.name, this.start_date, this.description, this.id});

    factory CampaignModel.fromJson(Map<String, dynamic> json) =>
      _$CampaignModelFromJson(json);
      
  Map<String, dynamic> toJson() => _$CampaignModelToJson(this);
 
}