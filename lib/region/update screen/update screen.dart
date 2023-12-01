import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valligeapp/models/models.dart';

import '../../shard/constant/constant.dart';
import '../../shard/resources/strings_manager.dart';
import '../../shard/resources/styles_manager.dart';
import '../region cubit/region cubit.dart';

class UpdateRegionScreen extends StatelessWidget {
  const UpdateRegionScreen({super.key , required this.regionName});
  final String regionName ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegionCubit, RegionState>(
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
                  child: Text('تحديث بيانات منطقه \n$regionName  ',
                  textAlign: TextAlign.center,

                  style: blackStyle(),),
                ),
                /*
                addRegion(),
                ElevatedButton(
                    onPressed: () {
                      RegionCubit.get(context).updateDocumentId
                        (
                          regionName,
                          regionNameController.text
                      );
                      regionNameController.clear();
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
                      RegionCubit.get(context).deleteRegion(regionName);
                      Navigator.pop(context);

                    },
                    child: Text(
                      "حذف المنطقة",
                      textAlign: TextAlign.right,
                      style: whiteStyle(),
                    )),
              ],
            ),
          );
        });
  }
}
