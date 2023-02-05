// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trending _$TrendingFromJson(Map<String, dynamic> json) => Trending(
      author: json['author'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      url: json['url'] as String,
      description: json['description'] as String?,
      language: json['language'] as String?,
      languageColor: json['languageColor'] as String?,
      stars: json['stars'] as int,
      forks: json['forks'] as int,
      currentPeriodStars: json['currentPeriodStars'] as int,
      builtBy: (json['builtBy'] as List<dynamic>)
          .map((e) => BuiltBy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrendingToJson(Trending instance) => <String, dynamic>{
      'author': instance.author,
      'name': instance.name,
      'avatar': instance.avatar,
      'url': instance.url,
      'description': instance.description,
      'language': instance.language,
      'languageColor': instance.languageColor,
      'stars': instance.stars,
      'forks': instance.forks,
      'currentPeriodStars': instance.currentPeriodStars,
      'builtBy': instance.builtBy,
    };

BuiltBy _$BuiltByFromJson(Map<String, dynamic> json) => BuiltBy(
      username: json['username'] as String,
      href: json['href'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$BuiltByToJson(BuiltBy instance) => <String, dynamic>{
      'username': instance.username,
      'href': instance.href,
      'avatar': instance.avatar,
    };
