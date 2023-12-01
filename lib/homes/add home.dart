import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valligeapp/homes/homes%20cubit/homes_cubit.dart';
import 'package:valligeapp/shard/resources/styles_manager.dart';
import '../models/models.dart';
import '../shard/constant/constant.dart';
import '../shard/resources/strings_manager.dart';
class AddHomeScreen extends StatelessWidget {
  const AddHomeScreen({super.key , required this.regionName , required this.streetName});
  final String regionName ;
  final String streetName ;
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomesCubit, HomesState>
      (
        listener: (context, state) {},
        builder: (context, state)
        {
          return  Scaffold(
            appBar: AppBar(
              title:  Text(AppStrings.addNewHome,
                style: whiteStyle(),
              ),),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16.0),
                  addHomeStreetInRegion(),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    child: const Text(AppStrings.save),
                    onPressed: () {
                      HomesCubit.get(context).addhome(
                      Homes(regionName, homeNameController.text, streetName)

                      );
                      homeNameController.clear();
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

