import 'package:example/data/models/address_model.dart';
import 'package:example/data/models/company_model.dart';
import 'package:example/data/models/geo_model.dart';
import 'package:example/data/models/user_model.dart';
import 'package:example/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Models', () {
    test('to Entity', () {

      const GeoModel geoModel =  GeoModel(
        lat: "40.555",
        lng: "20.000"
      );
      
      const AddressModel addressModel = AddressModel(
        city: "Bursa",
        street: "Demirci",
        suite: "Apt. 123",
        zipcode: "16000",
        geo: geoModel

      );

      const CompanyModel companyModel = CompanyModel(
        name: "Test Company",
        catchPhrase: null,
        bs: null,
      );

      const userModel = UserModel(
        id: 1,
        name: 'Sinan',
        username: 'sinanhacia',
        email: 'sinan@test.com',
        address: addressModel,
        phone: '1234567890',
        website: 'example.com',
        company: companyModel,
      );

      final userEntity = userModel.toEntity();

      expect(userEntity, isA<User>());
      expect(userEntity.id, userModel.id);
      expect(userEntity.name, userModel.name);
      expect(userEntity.username, userModel.username);
      expect(userEntity.email, userModel.email);
      expect(userEntity.address?.city, userModel.address?.city);
      expect(userEntity.address?.street, userModel.address?.street);
      expect(userEntity.address?.suite, userModel.address?.suite);
      expect(userEntity.address?.zipcode, userModel.address?.zipcode);
      expect(userEntity.address?.geo?.lat, userModel.address?.geo?.lat);
      expect(userEntity.address?.geo?.lng, userModel.address?.geo?.lng);
      expect(userEntity.phone, userModel.phone);
      expect(userEntity.website, userModel.website);
      expect(userEntity.company?.name, userModel.company?.name);
      expect(userEntity.company?.catchPhrase, userModel.company?.catchPhrase);
      expect(userEntity.company?.bs, userModel.company?.bs);
      expect(userEntity, equals(userModel.toEntity()));
    });

  });
}
