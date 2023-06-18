import 'package:equatable/equatable.dart';
import 'package:example/domain/entities/address.dart';
import 'package:flutter/material.dart';
import 'geo_model.dart';

@immutable
class AddressModel extends Equatable{
  const AddressModel({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final GeoModel? geo;

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json["street"],
      suite: json["suite"],
      city: json["city"],
      zipcode: json["zipcode"],
      geo: json["geo"] == null ? null : GeoModel.fromJson(json["geo"]),
    );
  }
  
  @override
  List<Object?> get props => [street,suite,city,zipcode,geo];

  Address toEntity(){
    return Address(
      street: street,
      suite: suite,
      city: city,
      zipcode: zipcode,
      geo: geo?.toEntity(),
    );
  }
}
