import 'package:flutter_test/flutter_test.dart';
import 'package:test_the_k_square_group/features/profile/data/models/address_model.dart';
import 'package:test_the_k_square_group/features/profile/data/models/company_model.dart';
import 'package:test_the_k_square_group/features/profile/data/models/geo_model.dart';
import 'package:test_the_k_square_group/features/profile/data/models/user_model.dart';

import '../../../../fixture/fixture.dart';
import '../../../../fixture/json_reader.dart';

void main() {
  late UserModel userModel;
  late UserModel jsonUserModel;

  setUp(() {
    userModel = const UserModel(
      id: 10,
      name: 'Clementina DuBuque',
      username: 'Moriah.Stanton',
      email: 'Rey.Padberg@karina.biz',
      phone: '024-648-3804',
      website: 'ambrose.net',
      addressModel: AddressModel(
        street: 'Kattie Turnpike',
        suite: 'Suite 198',
        city: 'Lebsackbury',
        zipcode: '31428-2261',
        geoModel: GeoModel(
          lat: '-38.2386',
          lng: '57.2232',
        )
      ),
      companyModel: CompanyModel(
        name: 'Hoeger LLC',
        catchPhrase: 'Centralized empowering task-force',
        bs: 'target end-to-end models',
      ),
    );

    jsonUserModel = UserModel.fromJson(decodeFixture(Fixture.user));
  });

  test('fromJson', () => expect(userModel, jsonUserModel));

  test('toJson', () => expect(userModel.toJson(), jsonUserModel.toJson()));
}