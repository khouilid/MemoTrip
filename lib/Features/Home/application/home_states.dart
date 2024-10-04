 
        
import 'package:freezed_annotation/freezed_annotation.dart';
part "home_states.freezed.dart" ;

@freezed
class HomeState with _$HomeState  
{
const HomeState._(); 
const factory HomeState.loading() = Loading;
const factory HomeState.initial() = Initial;
const factory HomeState.failure() = Failure;
}