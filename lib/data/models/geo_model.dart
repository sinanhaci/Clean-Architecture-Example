import 'package:equatable/equatable.dart';
import 'package:example/domain/entities/geo.dart';
import 'package:flutter/material.dart';

@immutable
class GeoModel extends Equatable{
  const GeoModel({
    this.lat,
    this.lng,
  });

  final String? lat;
  final String? lng;

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(
      lat: json["lat"],
      lng: json["lng"],
    );
  }
  
  @override
  List<Object?> get props => [lat,lng];

  Geo toEntity(){
    return Geo(
      lat: lat,
      lng: lng,
    );
  }
}
