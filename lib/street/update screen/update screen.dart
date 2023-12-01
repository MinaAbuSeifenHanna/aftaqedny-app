import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valligeapp/street/street%20cubit/street_cubit.dart';
import '../../shard/constant/constant.dart';
import '../../shard/resources/strings_manager.dart';
import '../../shard/resources/styles_manager.dart';

class UpdateStreetScreen extends StatelessWidget {
  const UpdateStreetScreen({super.key , required this.regionName , required this.streetName});
  final String regionName ;
  final String streetName ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StreetCubit, StreetState>(
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
                  child: Text('تحديث بيانات  \n$streetName  ',
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
                      StreetCubit.get(context).deleteStreet(
                        regionName,
                        streetName,
                      );
                      Navigator.pop(context);

                    },
                    child: Text(
                      "حذف الشارع",
                      textAlign: TextAlign.right,
                      style: whiteStyle(),
                    )),
              ],
            ),
          );
        });
  }
}
