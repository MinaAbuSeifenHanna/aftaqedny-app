import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valligeapp/shard/resources/styles_manager.dart';
import 'package:valligeapp/street/street%20cubit/street_cubit.dart';
import '../models/models.dart';
import '../shard/constant/constant.dart';
import '../shard/resources/strings_manager.dart';
class AddStreetScreen extends StatelessWidget {
  const AddStreetScreen({super.key , required this.regionName});
  final String regionName ;
  @override
  Widget build(BuildContext context) {
   return  BlocConsumer<StreetCubit, StreetState>
       (
       listener: (context, state) {},
      builder: (context, state)
    {
    return  Scaffold(
      appBar: AppBar(
        title:  Text(AppStrings.addNewStreet,
          style: whiteStyle(),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            addStreetInRegion(),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child:  Text(AppStrings.save,
              style: whiteStyle(),
              ),
              onPressed: () {
                StreetCubit.get(context).addStreet(
                  Streets(
                    streetNameController.text,
                    regionName,
                  ),

                );
                streetNameController.clear();
              //  controller_regionId.clear();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    ); });
    }
}

