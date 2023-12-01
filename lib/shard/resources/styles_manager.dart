import 'package:flutter/material.dart';
import 'package:valligeapp/shard/resources/color_manager.dart';
import 'package:valligeapp/shard/resources/values_manager.dart';

 TextStyle whiteStyle ()=> TextStyle(
     fontWeight: FontWeight.bold,
     fontSize: AppSize.s28,
     color: ColorManager.white
 );
 TextStyle  blackStyle ()=> const  TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: AppSize.s28,
    color: Colors.black
);

TextStyle  dataInfoStyle ()=> const  TextStyle(
    fontSize: 20,
    color: Colors.black
);
TextStyle  dataStyle ()=> const  TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.blue
);