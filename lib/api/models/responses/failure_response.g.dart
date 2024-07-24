// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FailureResponse _$FailureResponseFromJson(Map<String, dynamic> json) =>
    FailureResponse(
      message: json['message'] as String,
      error: json['error'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FailureResponseToJson(FailureResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'error': instance.error,
      'statusCode': instance.statusCode,
    };
