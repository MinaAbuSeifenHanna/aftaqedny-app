import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valligeapp/homes/homes%20cubit/homes_cubit.dart';
import 'package:valligeapp/street/street%20cubit/street_cubit.dart';

import '../../shard/resources/styles_manager.dart';

class UpdateHomeScreen extends StatelessWidget {
  const UpdateHomeScreen({super.key , required this.regionName , required this.streetName, required this.homeName});
  final String regionName ;
  final String streetName ;
  final String homeName ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomesCubit, HomesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return  Scaffold(
            appBar: AppBar(
              title: Text(' تحديث البيانات ',
              style: whiteStyle(),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text('تحديث بيانات  \n$homeName  ',
                  textAlign: TextAlign.center,

                  style: blackStyle(),),
                ),
                /*
                addRegion(),
                ElevatedButton(
                    onPressed: () {


                      Navigator.pop(context);

                    },
                    child: Text(
                      AppStrings.updatePerson,
                      textAlign: TextAlign.right,
                      style: whiteStyle(),
                    )),

                 */


                ElevatedButton(
                    onPressed: () {
                      HomesCubit.get(context).deleteHome(
                        regionName,
                        streetName,
                        homeName,
                      );
                      Navigator.pop(context);

                    },
                    child: Text(
                      "حذف المنزل",
                      textAlign: TextAlign.right,
                      style: whiteStyle(),
                    )),
              ],
            ),
          );
        });
  }
}
