import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_notifier.freeezed.dart';

@freezed
class AuthState with _$AuthState {
    const AuthState._();
    const factory AuthState.initial() = _Initial;
    const factory AuthState.unauthenticated() = _Unauthenticated;
    const factory AuthState.failure(AuthFailure failure) = _Failure;
    
}

class AuthNotifier extends StateNotifier<AuthState> {
    final GithubAuthenticator _authenticator;

    AuthNotifier(this._authenticator) : super(const AuthState.initial());

    Future<void> checkAndUpdateAuthStatus() async {state = await _authenticator.isSignedIn())
        ? const AuthState.authenticated()
        : const AuthState.unauthenticated();
    }
}