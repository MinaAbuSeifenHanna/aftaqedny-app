import 'package:flutter/material.dart';
import 'package:valligeapp/shard/resources/styles_manager.dart';
import 'package:valligeapp/shard/resources/values_manager.dart';
import 'color_manager.dart';
import 'font_manager.dart';
ThemeData getApplicationTheme()
{
  return ThemeData(
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightGrey ,// edit
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grdint_one,
//

    appBarTheme: AppBarTheme(
      centerTitle: true ,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.grdint_one,


  ),
    // button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grdint_one,
      buttonColor: ColorManager.grdint_three,
    ),
    // elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: blackStyle(),
        primary: ColorManager.grdint_two,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12)
        ),
      ),
    ),
    // text theme

    // input decoration




  );
}