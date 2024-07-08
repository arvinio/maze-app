// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleModelImpl _$$ArticleModelImplFromJson(Map<String, dynamic> json) =>
    _$ArticleModelImpl(
      id: json['_id'] as String,
      title: json['title'] as String?,
      content: json['content'] as String?,
      createdDate: json['createdDate'] as String?,
      editedDate: json['editedDate'] as String?,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      cover: json['cover'] as String?,
      required: json['required'],
    );

Map<String, dynamic> _$$ArticleModelImplToJson(_$ArticleModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'createdDate': instance.createdDate,
      'editedDate': instance.editedDate,
      'category': instance.category,
      'cover': instance.cover,
      'required': instance.required,
    };
