 


import "package:template/Features/Home/infrastructure/home_remote_datasource.dart";
import "package:template/core/infrastructure/helpers/repository_helper.dart";


class HomeRepository with RepositoryHelper {

final HomeRemoteDataSource _homeRemoteDataSource;

HomeRepository(this._homeRemoteDataSource);
  
         
}