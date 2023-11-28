import 'package:supabase/supabase.dart';
import 'package:the_obelisk/feature/domain/repository/auth_repository.dart';

class SupabaseAuthenticationRepository implements AuthenticationRepository {
  final SupabaseClient _supabaseClient;

  SupabaseAuthenticationRepository(this._supabaseClient);

  @override
  Future<String?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final response =
          await _supabaseClient.auth.signUp(email: email, password: password);
      if (response != null) {
        throw Exception(response);
      }
      return response.user.toString();
    } catch (e) {
      throw Exception("Failed to sign up: $e");
    }
  }
}
