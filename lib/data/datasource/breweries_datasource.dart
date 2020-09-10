import 'package:assignment/domain/model/breweries_domain.dart';

abstract class BreweriesDataSource {
  Future<List<BreweriesDomain>> getBreweries();
}