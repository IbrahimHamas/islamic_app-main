import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/api/audio_api.dart';
import 'package:islamic_app/api/juz_api.dart';
import 'package:islamic_app/api/surah_api.dart';
import 'package:islamic_app/bloc/juz_bloc.dart';
import 'package:islamic_app/bloc/surah_bloc.dart';
import 'package:islamic_app/core/utils/color_manager.dart';
import 'package:islamic_app/surah_provider.dart';
import 'package:provider/provider.dart';
import 'bloc/audio_bloc.dart';
import 'core/utils/app_router.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SurahProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => JuzBloc(JuzApi())..add(FetchJuzDataEvent())),
          BlocProvider(
              create: (_) => SurahBloc(SurahApi())..add(FetchSurahDataEvent())),

          BlocProvider(create: (_) =>AudioBloc(AudioApi())..add(FetchAudiosEvents())),
        ],
        child: MaterialApp.router(
          theme: ThemeData(
            scaffoldBackgroundColor: ColorManager.extraLightGrey,
          ),
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
        ));
  }
}
