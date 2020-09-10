
import 'package:assignment/domain/model/breweries_domain.dart';

abstract class BreweriesRepository {
  Future<void> getBreweries();

  Future<void> setBreweries(List<BreweriesDomain> breweriesList);

}
