
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valligeapp/region/region%20cubit/region%20cubit.dart';
import 'package:valligeapp/shard/resources/styles_manager.dart';
import 'package:valligeapp/shard/resources/values_manager.dart';
import '../../shard/constant/constant.dart';
import '../../shard/resources/strings_manager.dart';
import '../models/models.dart';
class AddRegionScreen extends StatelessWidget {
  const AddRegionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegionCubit, RegionState>(
            listener: (context, state) {},
            builder: (context, state)
            {
              return  Scaffold(
                appBar: AppBar(
                  title:  Text(
                    AppStrings.addNewRegion,
                    style: whiteStyle(),
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(AppSize.s16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      addRegion(),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        child:   Text( AppStrings.save,
                        style: whiteStyle(),
                        ),
                        onPressed: () {
                          RegionCubit.get(context).addRegion(
                              Region(
                            regionNameController.text,
                          ));
                           regionNameController.clear();
                           Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
        );


  }
}
