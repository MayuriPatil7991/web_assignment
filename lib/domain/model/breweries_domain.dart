import 'package:assignment/presentation/model/breweries_item.dart';
import 'package:assignment/datasources/entity/maps_extensions.dart';


class BreweriesDomain {
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

  BreweriesDomain({this.breweryType, this.city, this.country, this.id, this.latitude, this.longitude, this.name, this.phone, this.postalCode, this.state, this.street, this.updatedAt, this.websiteUrl});

  factory BreweriesDomain.fromJson(Map<String, dynamic> json) {
    return BreweriesDomain(
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brewery_type'] = this.breweryType;
    data['city'] = this.city;
    data['country'] = this.country;
    data['id'] = this.id;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['postal_code'] = this.postalCode;
    data['state'] = this.state;
    data['street'] = this.street;
    data['updated_at'] = this.updatedAt;
    data['website_url'] = this.websiteUrl;
    return data;
  }

}
extension BreweriesDomainExt on BreweriesDomain {
  BreweriesItem mapToPresentation() => BreweriesItem(
    longitude: longitude,
    latitude: latitude,
    id: id,
    name: name,
    breweryType: breweryType,
    phone: phone,
    updatedAt: updatedAt,
    websiteUrl: websiteUrl,
    formatedAddress: _getFormatAddress()
  );

  String _getFormatAddress() {
    String address = '';
    if (street.isNotEmpty) {
      address = _appendAddress(address, street);
    }
    if (city.isNotEmpty) {
      address = _appendAddress(address, city);
    }
    if (postalCode.isNotEmpty) {
      address = _appendAddress(address, postalCode);
    }
    if (state.isNotEmpty) {
      address = _appendAddress(address, state);
    }
    if (country.isNotEmpty) {
      address = _appendAddress(address, country);
    }
    return address;
  }

  String _appendAddress(String address, String field) {
    if (address.isNotEmpty) {
      return address + ', ' + field;
    }
    return field;
  }

}
extension BreweriesDomainListExt on List<BreweriesDomain> {
  List<BreweriesItem> mapToPresentation() => map((e) => e.mapToPresentation()).toList();
}

