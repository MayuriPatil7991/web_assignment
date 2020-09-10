
import 'package:assignment/datasources/entity/maps_extensions.dart';
import 'package:assignment/domain/model/breweries_domain.dart';

class BreweriesEntity {
    String breweryType;
    String city;
    String country;
    int id;
    String latitude;
    String longitude;
    String name;
    String phone;
    String postalCode;
    String state;
    String street;
    String updatedAt;
    String websiteUrl;

    BreweriesEntity({this.breweryType, this.city, this.country, this.id, this.latitude, this.longitude, this.name, this.phone, this.postalCode, this.state, this.street, this.updatedAt, this.websiteUrl});
    factory BreweriesEntity.fromJson(Map<String, dynamic> json) {
        return BreweriesEntity(
            breweryType: json.getOrElse('brewery_type', ''),
            city: json.getOrElse('city', ''),
            country: json.getOrElse('country', ''),
            id: json.getOrElse('id', 0),
            latitude: json.getOrElse('latitude', ''),
            longitude: json.getOrElse('longitude', ''),
            name: json.getOrElse('name', ''),
            phone: json.getOrElse('phone', ''),
            postalCode: json.getOrElse('postal_code', ''),
            state: json.getOrElse('state', ''),
            street: json.getOrElse('street', ''),
            updatedAt: json.getOrElse('updated_at', ''),
            websiteUrl: json.getOrElse('website_url', ''),
        );
    }
}
extension BreweriesEntityExt on BreweriesEntity {
  BreweriesDomain mapToDomain() => BreweriesDomain(
      longitude: longitude,
      latitude: latitude,
      country: country,
      city: city,
      id: id,
      state: state,
      postalCode: postalCode,
      name: name,
      breweryType: breweryType,
      phone: phone,
      street: street,
      updatedAt: updatedAt,
      websiteUrl: websiteUrl,
  );
}
extension BreweriesEntityListExt on List<BreweriesEntity> {
    List<BreweriesDomain> mapToDomain() => map((e) => e.mapToDomain()).toList();
}

