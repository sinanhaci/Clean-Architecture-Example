import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Company extends Equatable{
  const Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  final String? name;
  final String? catchPhrase;
  final String? bs;

  @override
  List<Object?> get props => [name,catchPhrase,bs];
}