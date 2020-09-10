import 'dart:convert';
import 'package:assignment/data/datasource/breweries_datasource.dart';
import 'package:assignment/datasources/entity/breweries_entity.dart';
import 'package:assignment/datasources/remote/endpoints/endpoints.dart';
import 'package:assignment/domain/model/breweries_domain.dart';
import 'package:assignment/utils/constants.dart';
import 'package:http/http.dart' as http;


class BreweriesDataSourceImpl extends BreweriesDataSource {

  @override
  Future<List<BreweriesDomain>> getBreweries() async{
    final response = await http.get(Endpoint.GET_BREWERIES);
    if (response.statusCode == 200) {
      try{
        final list = json.decode(response.body) as List<dynamic>;
        List<BreweriesEntity> breweriesEntity = list.map((json) {
          return BreweriesEntity.fromJson(json);
        }).toList(growable: false);
       return breweriesEntity.mapToDomain();
      }
       catch(exception){
       throw Exception(Constants.INVALID_RESPONSE);
      }
    } else {
      throw Exception(Constants.SERVER_MESSAGE);
    }
  }
}

