
class AuthFailure with _$AuthFailure {
  const AuthFailure._();
  const factory AuthFailure.server([String? messsage]) = _Server;
  const factory AuthFailure.storage() = _Storage;
}
