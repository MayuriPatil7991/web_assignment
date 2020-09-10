
import 'package:assignment/domain/model/breweries_domain.dart';

abstract class BreweriesLocalDataSource {
  Future<List<BreweriesDomain>> getLocalStoredBreweries();

  Future<void> setBreweries(List<BreweriesDomain> breweriesDomain);
}
