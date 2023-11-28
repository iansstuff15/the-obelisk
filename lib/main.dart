import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:the_obelisk/config/routes/routes.config.dart';
import 'package:the_obelisk/config/theme/theme.config.dart';
import 'package:the_obelisk/core/util/supabase.dart';
import 'package:the_obelisk/feature/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:the_obelisk/feature/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:the_obelisk/feature/presentation/bloc/source/remote/remote_source_bloc.dart';
import 'package:the_obelisk/feature/presentation/bloc/source/remote/remote_source_event.dart';
import 'package:the_obelisk/feature/presentation/page/auth/auth-login/auth-login.page.dart';
import 'package:the_obelisk/feature/presentation/page/auth/no-auth-login/no-auth-login.page.dart';
import 'package:the_obelisk/injection_container.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_KEY']!,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = supabase.auth.currentUser;
    return BlocProvider<RemoteArticlesBloc>(
        create: (context) => sl()..add(const GetArticles()),
        child: BlocProvider<RemoteSourceBloc>(
          create: (context) => sl()..add(const GetSources()),
          child: MaterialApp(
            title: 'The Obelisk',
            initialRoute: user != null ? AuthLoginPage.id : NoAuthLoginPage.id,
            theme: AppTheme.main,
            routes: AppRoutes,
          ),
        ));
  }
}
