import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User extends Object {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "email")
  final String email;

  User({this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable()
class SeatLayoutData extends Object{
  final int Row;
  final int Column;

  @JsonKey(name: "SeatTypes")
  final List<SeatTypes> seatTypes;
  @JsonKey(name: "SeatLayouts")
  final List<SeatLayouts> seatLayouts;


  SeatLayoutData({this.Row, this.Column, this.seatTypes, this.seatLayouts});

  factory SeatLayoutData.fromJson(Map<String, dynamic> json) => _$SeatLayoutDataFromJson(json);
}

@JsonSerializable()
class SeatTypes extends Object{
  final int SeatClassID;
  final String Type;
  final int Price;
  final String Label;
  final int SeatClassPriceID;

  SeatTypes({this.SeatClassID, this.Type, this.Price, this.Label,this.SeatClassPriceID});

  factory SeatTypes.fromJson(Map<String, dynamic> json) => _$SeatTypesFromJson(json);
}

@JsonSerializable()
class SeatLayouts extends Object{

  @JsonKey(name: "Seats")
  List<Seats> seats;

  SeatLayouts({this.seats});

  factory SeatLayouts.fromJson(Map<String, dynamic> json) => _$SeatLayoutsFromJson(json);

}

@JsonSerializable()
class Seats extends Object{

  final int Column;
  final int Price;
  final String SeatName;
  final int Status;
  final int SeatlayoutID;
  final int SeatClassID;


  Seats({this.Column, this.Price, this.SeatName, this.Status,this.SeatlayoutID,this.SeatClassID});

  factory Seats.fromJson(Map<String, dynamic> json) => _$SeatsFromJson(json);


}
