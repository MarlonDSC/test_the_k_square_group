import 'package:json_annotation/json_annotation.dart';
import 'package:test_the_k_square_group/features/profile/domain/entities/geo.dart';

part 'geo_model.g.dart';

@JsonSerializable()
class GeoModel extends Geo {

  const GeoModel({
    required super.lat,
    required super.lng,
  });

  factory GeoModel.fromEntity(Geo geo) {
    return GeoModel(
      lat: geo.lat,
      lng: geo.lng,
    );
  }

  factory GeoModel.fromJson(Map<String, dynamic> json) =>
      _$GeoModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeoModelToJson(this);
}
