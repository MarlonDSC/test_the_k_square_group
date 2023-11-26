import 'package:flutter_test/flutter_test.dart';
import 'package:test_the_k_square_group/features/profile/data/models/user_model.dart';
import 'package:test_the_k_square_group/features/profile/domain/entities/user.dart';

import '../../../../fixture/fixture.dart';
import '../../../../fixture/json_reader.dart';

void main() {
  late UserModel jsonUserModel;
  setUp(() {
    jsonUserModel = UserModel.fromJson(decodeFixture(Fixture.user));
  });

  test('should be a subclass of User entity', () async {
    // assert
    expect(jsonUserModel, isA<User>());
  });
}
