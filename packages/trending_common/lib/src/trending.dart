
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:trending_common/trending_common.dart';

part 'trending.g.dart';

@immutable
@JsonSerializable()
class Trending extends Equatable {
  const Trending({
    required this.author,
    required this.name,
    required this.avatar,
    required this.url,
    this.description,
    this.language,
    this.languageColor,
    required this.stars,
    required this.forks,
    required this.currentPeriodStars,
    required this.builtBy,
  });

  final String author;
  final String name;
  final String avatar;
  final String url;
  final String? description;
  final String? language;
  final String? languageColor;
  final int stars;
  final int forks;
  final int currentPeriodStars;
  final List<BuiltBy> builtBy;

  /// Returns a copy of this trending with the given values updated.
  ///
  /// {@macro trending}
  Trending copyWith({
    String? author,
    String? name,
    String? avatar,
    String? url,
    String? description,
    String? language,
    String? languageColor,
    int? stars,
    int? forks,
    int? currentPeriodStars,
    List<BuiltBy>? builtBy,
  }) {
    return Trending(
      author: author ?? this.author,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      url: url ?? this.url,
      description: description ?? this.description,
      language: language ?? this.language,
      languageColor: languageColor ?? this.languageColor,
      stars: stars ?? this.stars,
      forks: forks ?? this.forks,
      currentPeriodStars: currentPeriodStars ?? this.currentPeriodStars,
      builtBy: builtBy ?? this.builtBy,
    );
  }

  /// Deserializes the given [JsonMap] into a [Trending].
  static Trending fromJson(JsonMap json) => _$TrendingFromJson(json);

  /// Converts this [Trending] into a [JsonMap].
  JsonMap toJson() => _$TrendingToJson(this);

  @override
  List<Object?> get props => [author, name, avatar, url, description, language, languageColor, stars, forks, currentPeriodStars, builtBy];
}

@immutable
@JsonSerializable()
class BuiltBy extends Equatable {
  const BuiltBy({
    required this.username,
    required this.href,
    required this.avatar,
  });

  final String username;
  final String href;
  final String avatar;

  /// Returns a copy of this buildBy with the given values updated.
  ///
  /// {@macro buildBy}
  BuiltBy copyWith({
    String? username,
    String? href,
    String? avatar,
  }) {
    return BuiltBy(
      username: username ?? this.username,
      href: href ?? this.href,
      avatar: avatar ?? this.avatar,
    );
  }

  /// Deserializes the given [JsonMap] into a [BuiltBy].
  static BuiltBy fromJson(JsonMap json) => _$BuiltByFromJson(json);

  /// Converts this [BuiltBy] into a [JsonMap].
  JsonMap toJson() => _$BuiltByToJson(this);

  @override
  List<Object?> get props => [username, href, avatar];
}
