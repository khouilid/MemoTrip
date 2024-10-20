 
        
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/core/domain/failure.dart';


part "home_states.freezed.dart" ;

@freezed
class HomeState with _$HomeState  
{
const HomeState._(); 
const factory HomeState.loading() = _Loading;
const factory HomeState.initial() = _Initial;
const factory HomeState.failure(
  Failure failure,
) = _Failure;


// update collection state
const factory HomeState.updateCollectionLoading() = _UpdateCollectionLoading;
const factory HomeState.updatedCollection() = _UpdatedCollection;

}