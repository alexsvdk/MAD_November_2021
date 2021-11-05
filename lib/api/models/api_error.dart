import 'package:flutter/foundation.dart';

@immutable
class ApiError {
  final String? title;
  final String? message;
  final String? resolution;

  const ApiError({this.title, this.message, this.resolution});

  @override
  String toString() {
    return 'ApiError(title: $title, message: $message, resolution: $resolution)';
  }

  factory ApiError.fromTitleNoDefinitionsFoundMessageSorryPalWeCouldnTFindDefinitionsForTheWordYouWereLookingForResolutionYouCanTryTheSearchAgainAtLaterTimeOrHeadToTheWebInstead(
      Map<String, dynamic> json) {
    return ApiError(
      title: json['title'] as String?,
      message: json['message'] as String?,
      resolution: json['resolution'] as String?,
    );
  }

  Map<String, dynamic>
      toTitleNoDefinitionsFoundMessageSorryPalWeCouldnTFindDefinitionsForTheWordYouWereLookingForResolutionYouCanTryTheSearchAgainAtLaterTimeOrHeadToTheWebInstead() {
    return {
      'title': title,
      'message': message,
      'resolution': resolution,
    };
  }

  ApiError copyWith({
    String? title,
    String? message,
    String? resolution,
  }) {
    return ApiError(
      title: title ?? this.title,
      message: message ?? this.message,
      resolution: resolution ?? this.resolution,
    );
  }
}
