import 'package:equatable/equatable.dart';
import 'package:example/domain/entities/company.dart';
import 'package:flutter/material.dart';

@immutable
class CompanyModel extends Equatable{
  const CompanyModel({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  final String? name;
  final String? catchPhrase;
  final String? bs;

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json["name"],
      catchPhrase: json["catchPhrase"],
      bs: json["bs"],
    );
  }
  
  @override
  List<Object?> get props => [name,catchPhrase,bs];

  Company toEntity(){
    return Company(
      name: name,
      catchPhrase: catchPhrase,
      bs: bs,
    );
  }
}
