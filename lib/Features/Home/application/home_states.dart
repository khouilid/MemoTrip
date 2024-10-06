 
        
import 'package:freezed_annotation/freezed_annotation.dart';


part "home_states.freezed.dart" ;

@freezed
class HomeState with _$HomeState  
{
const HomeState._(); 
const factory HomeState.loading() = _Loading;
const factory HomeState.initial() = _Initial;
const factory HomeState.failure() = _Failure;
}