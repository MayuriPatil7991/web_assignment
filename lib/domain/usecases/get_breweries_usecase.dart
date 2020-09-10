import 'package:assignment/domain/repositories/breweries_repository.dart';

class GetBreweriesUseCase {
  final BreweriesRepository _breweriesRepository;

  GetBreweriesUseCase(this._breweriesRepository);

  Future<void> buildUseCaseFuture(){
    return  _breweriesRepository.getBreweries();
  }
}