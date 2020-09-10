import 'dart:async';
import 'package:assignment/domain/usecases/get_breweries_usecase.dart';
import 'package:assignment/presentation/model/breweries_item.dart';

class BreweriesViewModel {
  GetBreweriesUseCase _getBreweriesUseCase;

  BreweriesViewModel(this._getBreweriesUseCase);

  BreweriesItem breweriesItem;

  int selectedIndex = 0;

  /// function to get list of breweries
  Future<void> getBreweries() async{
    _getBreweriesUseCase.buildUseCaseFuture()
        .catchError((Object error) {
    }, test: (error) => error);
  }
}