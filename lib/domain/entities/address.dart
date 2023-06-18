import 'package:equatable/equatable.dart';
import 'package:example/domain/entities/geo.dart';
import 'package:flutter/material.dart';

@immutable
class Address extends Equatable{
  const Address({
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
  final Geo? geo;

  @override
  List<Object?> get props => [street,suite,city,zipcode,geo];
}