// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:valligeapp/person%20information/person%20cubit/person_cubit.dart';
// import 'package:valligeapp/region/region%20cubit/region%20cubit.dart';
// import 'package:valligeapp/street/street%20cubit/street_cubit.dart';
// import 'firebase_options.dart';
// import 'homes/homes cubit/homes_cubit.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then((_) {
//     runApp(
//         MultiBlocProvider(
//             providers: [
//               BlocProvider<RegionCubit>(create: (_) => RegionCubit()),
//               BlocProvider<StreetCubit>(create: (_) => StreetCubit()),
//               BlocProvider<HomesCubit>(create: (_) => HomesCubit()),
//               BlocProvider<PersonCubit>(create: (_) => PersonCubit()),
//             ],
//         child: Home(),));
//   });
//
// }
//
// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.orange,),
//       home: BlocConsumer<PersonCubit, PersonState>(
//         listener: (context, state) {},
//     builder: (context, state) {
//       return Scaffold(
//           backgroundColor: Colors.brown.shade200,
//           appBar: AppBar(
//             backgroundColor: Colors.orange,
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                 bottomRight: Radius.circular(40),
//                 bottomLeft: Radius.circular(40),
//               ),
//             ),
//             elevation: 0,
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Contacts', maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(fontWeight: FontWeight.w900,
//                     fontSize: 25,
//                     color: Colors.brown.shade500,),
//                 ),
//               ],
//             ),
//           ),
//           body:
//
//
//       );
//     })
//     );
//   }
//
//
// }