import 'package:json_annotation/json_annotation.dart';
import 'package:test_the_k_square_group/features/profile/domain/entities/company.dart';

part 'company_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CompanyModel extends Company {

  const CompanyModel({
    required super.name,
    required super.catchPhrase,
    required super.bs,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}
