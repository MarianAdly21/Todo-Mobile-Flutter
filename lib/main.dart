import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';
import 'package:todo_mobile/features/splash/splash_screen.dart';
import 'package:todo_mobile/generated/l10n.dart';
import 'package:todo_mobile/localization/bloc/localization_bloc.dart';
import 'package:todo_mobile/simple_bloc_observer.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>("taskBox");
  RenderingFlutterBinding.ensureInitialized();

  runApp(const TodoApp());
}

String language = "en";

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalizationBloc(),
      child: BlocConsumer<LocalizationBloc, LocalizationState>(
        listener: (context, state) {
          if (state is ChangeLanguagestate) {
            language = state.language;
          }
        },
        builder: (context, state) {
          return MaterialApp(
            locale: Locale(language),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
