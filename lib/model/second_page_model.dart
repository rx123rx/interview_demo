import 'package:json_annotation/json_annotation.dart';

part 'second_page_model.g.dart';

@JsonSerializable()
class SecondPageModel {
  int? id;
  bool? isLike;
  num? likeNum;
  bool? isUpvote;
  num? upvote;
  String? title;
  String? description;

  SecondPageModel({
    this.id,
    this.isLike,
    this.likeNum,
    this.isUpvote,
    this.upvote,
    this.title,
    this.description,
  });

  factory SecondPageModel.fromJson(Map<String, dynamic> json) =>
      _$SecondPageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SecondPageModelToJson(this);
}
