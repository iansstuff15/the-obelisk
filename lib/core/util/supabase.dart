import 'package:flutter/material.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SupabaseUtil {
  static Future<String> createUser(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    try {
      var response = await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'firstName': firstName, 'lastName': lastName},
      );

      return "success";
    } catch (e) {
      AuthException error = e as AuthException;

      return error.message.toString();
    }
  }

  static Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      var response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return "success";
    } catch (e) {
      AuthException error = e as AuthException;

      return error.message.toString();
    }
  }

  static Future<String> logOut() async {
    try {
      await supabase.auth.signOut();
      return "success";
    } catch (e) {
      AuthException error = e as AuthException;
      return error.message.toString();
    }
  }

  static Future<String> sendResetPassword({required String email}) async {
    try {
      await supabase.auth.resetPasswordForEmail(email);
      return "success";
    } catch (e) {
      AuthException error = e as AuthException;
      return error.message.toString();
    }
  }
}
