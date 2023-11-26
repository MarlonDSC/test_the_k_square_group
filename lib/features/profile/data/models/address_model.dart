import 'package:test_the_k_square_group/features/profile/data/models/geo_model.dart';
import 'package:test_the_k_square_group/features/profile/domain/entities/address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressModel extends Address {
  @JsonKey(name: 'geo')
  final GeoModel geoModel;

  const AddressModel({
    required super.street,
    required super.suite,
    required super.city,
    required super.zipcode,
    required this.geoModel,
  }) : super(
          geo: geoModel,
        );

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
