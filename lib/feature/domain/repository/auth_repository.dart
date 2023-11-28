abstract class AuthenticationRepository {
  Future<String?> signUpWithEmailAndPassword(String email, String password);
}
