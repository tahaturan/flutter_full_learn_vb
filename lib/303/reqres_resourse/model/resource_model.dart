import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part "resource_model.g.dart";

@JsonSerializable()
class ResouceModel {
  List<Data>? data;

  ResouceModel({this.data});

  factory ResouceModel.fromJson(Map<String, dynamic> json) {
    return _$ResouceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResouceModelToJson(this);
  }
}

@JsonSerializable()
class Data extends Equatable {
  final int? id;
  final String? name;
  final int? year;
  final String? color;
  final String? pantoneValue;
  final String? price;

  const Data({this.id, this.name, this.year, this.color, this.pantoneValue, this.price});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }

  @override
  List<Object?> get props => [id, name, year, price];
}
