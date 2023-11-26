import 'package:json_annotation/json_annotation.dart';
import 'package:test_the_k_square_group/features/profile/data/models/address_model.dart';
import 'package:test_the_k_square_group/features/profile/data/models/company_model.dart';
import 'package:test_the_k_square_group/features/profile/domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends User {
  @JsonKey(name: 'address')
  final AddressModel addressModel;

  @JsonKey(name: 'company')
  final CompanyModel companyModel;

  const UserModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required this.addressModel,
    required super.phone,
    required super.website,
    required this.companyModel,
  }) : super(
          address: addressModel,
          company: companyModel,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
