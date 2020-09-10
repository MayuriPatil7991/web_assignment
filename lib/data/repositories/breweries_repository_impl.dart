import 'package:assignment/data/datasource/breweries_datasource.dart';
import 'package:assignment/data/datasource/breweries_local_datasource.dart';
import 'package:assignment/domain/model/breweries_domain.dart';
import 'package:assignment/domain/repositories/breweries_repository.dart';
import 'package:assignment/providers/providers.dart';

class BreweriesRepositoryImpl extends BreweriesRepository {
  BreweriesDataSource _breweriesRemoteDataSource;

  BreweriesRepositoryImpl(this._breweriesRemoteDataSource, this._localDataSource);

  BreweriesLocalDataSource _localDataSource;

  @override
  Future<void> getBreweries() async {
    List<BreweriesDomain> localStoredBreweriesList = await _localDataSource.getLocalStoredBreweries();
    if(localStoredBreweriesList != null && localStoredBreweriesList.isNotEmpty){
      streamController.sink.add(localStoredBreweriesList.mapToPresentation());
      List<BreweriesDomain> breweriesList = await _breweriesRemoteDataSource.getBreweries();
      await setBreweries(breweriesList);
    }else{
      List<BreweriesDomain> breweriesList = await _breweriesRemoteDataSource.getBreweries();
      await setBreweries(breweriesList);
      streamController.sink.add(breweriesList.mapToPresentation());
    }
  }

  @override
  Future<void> setBreweries(List<BreweriesDomain> breweriesList) {
    return _localDataSource.setBreweries(breweriesList);
  }
}