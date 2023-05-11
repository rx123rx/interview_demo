// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'second_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecondPageModel _$SecondPageModelFromJson(Map<String, dynamic> json) =>
    SecondPageModel(
      id: json['id'] as int?,
      isLike: json['isLike'] as bool?,
      likeNum: json['likeNum'] as num?,
      isUpvote: json['isUpvote'] as bool?,
      upvote: json['upvote'] as num?,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SecondPageModelToJson(SecondPageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isLike': instance.isLike,
      'likeNum': instance.likeNum,
      'isUpvote': instance.isUpvote,
      'upvote': instance.upvote,
      'title': instance.title,
      'description': instance.description,
    };
