import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Geo extends Equatable{
  const Geo({
    this.lat,
    this.lng,
  });
  final String? lat;
  final String? lng;

  @override
  List<Object?> get props => [lat,lng];


}
