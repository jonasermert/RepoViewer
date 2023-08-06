import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_notifier.freeezed.dart';

@freezed
class AuthState with _$AuthState {
    const AuthState.:();
    const factory AuthState.initial() = _Initial;
    const factory AuthState.unauthenticated() = _Unauthenticated;
    const factory AuthState.failure(AuthFailure failure) = _Failure;
    
}