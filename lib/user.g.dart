// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(name: json['name'] as String, email: json['email'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) =>
    <String, dynamic>{'name': instance.name, 'email': instance.email};

SeatLayoutData _$SeatLayoutDataFromJson(Map<String, dynamic> json) {
  return SeatLayoutData(
      Row: json['Row'] as int,
      Column: json['Column'] as int,
      seatTypes: (json['SeatTypes'] as List)
          ?.map((e) =>
              e == null ? null : SeatTypes.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      seatLayouts: (json['SeatLayouts'] as List)
          ?.map((e) => e == null
              ? null
              : SeatLayouts.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SeatLayoutDataToJson(SeatLayoutData instance) =>
    <String, dynamic>{
      'Row': instance.Row,
      'Column': instance.Column,
      'SeatTypes': instance.seatTypes,
      'SeatLayouts': instance.seatLayouts
    };

SeatTypes _$SeatTypesFromJson(Map<String, dynamic> json) {
  return SeatTypes(
      SeatClassID: json['SeatClassID'] as int,
      Type: json['Type'] as String,
      Price: json['Price'] as int,
      Label: json['Label'] as String,
      SeatClassPriceID: json['SeatClassPriceID'] as int);
}

Map<String, dynamic> _$SeatTypesToJson(SeatTypes instance) => <String, dynamic>{
      'SeatClassID': instance.SeatClassID,
      'Type': instance.Type,
      'Price': instance.Price,
      'Label': instance.Label,
      'SeatClassPriceID': instance.SeatClassPriceID
    };

SeatLayouts _$SeatLayoutsFromJson(Map<String, dynamic> json) {
  return SeatLayouts(
      seats: (json['Seats'] as List)
          ?.map((e) =>
              e == null ? null : Seats.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SeatLayoutsToJson(SeatLayouts instance) =>
    <String, dynamic>{'Seats': instance.seats};

Seats _$SeatsFromJson(Map<String, dynamic> json) {
  return Seats(
      Column: json['Column'] as int,
      Price: json['Price'] as int,
      SeatName: json['SeatName'] as String,
      Status: json['Status'] as int,
      SeatlayoutID: json['SeatlayoutID'] as int,
      SeatClassID: json['SeatClassID'] as int);
}

Map<String, dynamic> _$SeatsToJson(Seats instance) => <String, dynamic>{
      'Column': instance.Column,
      'Price': instance.Price,
      'SeatName': instance.SeatName,
      'Status': instance.Status,
      'SeatlayoutID': instance.SeatlayoutID,
      'SeatClassID': instance.SeatClassID
    };
