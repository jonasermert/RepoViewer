import 'package:riverpod/riverpod.dart';
import 'package:repoviewer/auth/infrastracture/credentials_storage/secure_credentials_storage.dart';

final flutterSecureStorageProvider = Provider((ref) => const FlutterSecureStorage());
final dioProvider = Provider((ref) => Dio());
final credentialsStorageProvider = Provider<CredentialsStorage>((ref) => SecureCredentialsStorage(ref.watch(flutterSecureStorageProvider)),);
final GithubAuthenticatorProvider = Provider((ref) => GithubAuthenticator(
    ref.watch(credentialsStorageProvider),
    ref.watch(dioProvider),
));

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier(ref.watch(githubAuthenticatorProvider)),);