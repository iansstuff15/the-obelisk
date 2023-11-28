import 'package:flutter/material.dart';
import 'package:the_obelisk/feature/presentation/page/application/categories/categories.page.dart';
import 'package:the_obelisk/feature/presentation/page/application/home/home.page.dart';
import 'package:the_obelisk/feature/presentation/page/application/profile/profile.page.dart';
import 'package:the_obelisk/feature/presentation/page/application/read-news/read-news.page.dart';
import 'package:the_obelisk/feature/presentation/page/application/search/search.page.dart';
import 'package:the_obelisk/feature/presentation/page/auth/auth-login/auth-login.page.dart';
import 'package:the_obelisk/feature/presentation/page/auth/forgot-password/forgot-pasword.page.dart';
import 'package:the_obelisk/feature/presentation/page/auth/no-auth-login/no-auth-login.page.dart';
import 'package:the_obelisk/feature/presentation/page/auth/register/register.page.dart';

Map<String, Widget Function(BuildContext)> AppRoutes = {
  HomePage.id: (context) => const HomePage(),
  ReadNews.id: (context) => const ReadNews(),
  CategoriesPage.id: (context) => const CategoriesPage(),
  ProfilePage.id: (context) => const ProfilePage(),
  NoAuthLoginPage.id: (context) => const NoAuthLoginPage(),
  AuthLoginPage.id: (context) => const AuthLoginPage(),
  RegisterPage.id: (context) => const RegisterPage(),
  ForgotPasswordPage.id: (context) => const ForgotPasswordPage(),
  SearchPage.id: (context) => const SearchPage()
};
