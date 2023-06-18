import 'package:equatable/equatable.dart';
import 'package:example/domain/entities/address.dart';
import 'package:example/domain/entities/company.dart';
import 'package:flutter/material.dart';

@immutable
class User extends Equatable{
  const User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  
  @override
  List<Object?> get props => [id,name,username,email,address,phone,website,company];

}
