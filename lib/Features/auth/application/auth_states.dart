import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:template/core/domain/failure.dart';

part 'auth_states.freezed.dart';

@freezed
class AuthStates with _$AuthStates {
  const AuthStates._();
  const factory AuthStates.initial() = _Initial;
  const factory AuthStates.authenticated(User user) = _Authenticated;
  const factory AuthStates.unauthenticated() = _Unauthenticated;
  const factory AuthStates.loading() = _Loading;
  const factory AuthStates.failure(Failure failure) = _Failure;
}
