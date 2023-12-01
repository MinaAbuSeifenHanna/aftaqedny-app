import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:valligeapp/homes/homes%20cubit/homes_cubit.dart';
import 'package:valligeapp/person%20information/person%20cubit/person_cubit.dart';

import 'package:valligeapp/region/region%20cubit/region%20cubit.dart';
import 'package:valligeapp/shard/resources/Theme_manager.dart';
import 'package:valligeapp/splash%20page.dart';
import 'package:valligeapp/street/street%20cubit/street_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider<RegionCubit>(create: (_) => RegionCubit()),
            BlocProvider<StreetCubit>(create: (_) => StreetCubit()),
            BlocProvider<HomesCubit>(create: (_) => HomesCubit()),
            BlocProvider<PersonCubit>(create: (_) => PersonCubit()),

          ],
       child: const MyApp(),
  ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'أفتقدني',
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        home: const SplashPage()

    );
  }
}
