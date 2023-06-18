import 'package:equatable/equatable.dart';
import 'package:example/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'address_model.dart';
import 'company_model.dart';

@immutable
class UserModel extends Equatable{
  const UserModel({
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
  final AddressModel? address;
  final String? phone;
  final String? website;
  final CompanyModel? company;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      address: json["address"] == null ? null : AddressModel.fromJson(json["address"]),
      phone: json["phone"],
      website: json["website"],
      company: json["company"] == null ? null : CompanyModel.fromJson(json["company"]),
    );
  }
  
  @override
  List<Object?> get props => [id,name,username,email,address,phone,website,company];

  User toEntity(){
    return User(
      id: id,
      name: name,
      username: username,
      email: email,
      address: address?.toEntity(),
      phone: phone,
      website: website,
      company: company?.toEntity(),
    );
  }
}
