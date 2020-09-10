

import 'dart:async';

import 'package:assignment/data/repositories/breweries_repository_impl.dart';
import 'package:assignment/datasources/local/breweries_local_datasource_impl.dart';
import 'package:assignment/datasources/remote/breweries_datasource_impl.dart';
import 'package:assignment/domain/usecases/get_breweries_usecase.dart';
import 'package:assignment/presentation/model/breweries_item.dart';

GetBreweriesUseCase provideUseCase(){
  return GetBreweriesUseCase(provideRepositories());
}

BreweriesRepositoryImpl provideRepositories(){
  return BreweriesRepositoryImpl(provideRemoteDataSource(),provideLocalDataSource());
}

BreweriesDataSourceImpl provideRemoteDataSource(){
  return BreweriesDataSourceImpl();
}

BreweriesLocalDataSourceImpl provideLocalDataSource(){
  return BreweriesLocalDataSourceImpl();
}

StreamController<List<BreweriesItem>> streamController = StreamController<List<BreweriesItem>>();

Stream<List<BreweriesItem>> get breweriesStream => streamController.stream;

