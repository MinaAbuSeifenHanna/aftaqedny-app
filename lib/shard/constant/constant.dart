
import 'package:flutter/material.dart';

import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

/// Text Form Of add new Region
///-------------------------------------------------------------------------------
var   regionNameController = TextEditingController();
var   keyboardTypeRegionField = TextInputType.name ;
var   regionFieldInputDecoration =  InputDecoration(
  border:OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  )
)
    .copyWith(
    hintText: AppStrings.enterRegionName,
    label: const Text(AppStrings.enterRegionName,) );
Widget addRegion()=> Padding(
  padding: const EdgeInsets.all(AppPadding.p16),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38.0)
    ),
    child: Column(
      children: [
        defaultTextfield(
          keyboard_type: keyboardTypeRegionField,
          controller_name: regionNameController,
          Decoration: regionFieldInputDecoration,
        ),
      ],
    ),
  ),
);

///-------------------------------------------------------------------------------
/// Text Form Of add new Street
///-------------------------------------------------------------------------------
var    streetNameController = TextEditingController();
var    keyboardTypeStreetField = TextInputType.multiline ;
var    streetFieldInputDecoration =  InputDecoration(
    border:OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    )
).copyWith(
  hintText: AppStrings.enterStreetName,
  label: const Text(AppStrings.enterStreetName),
) ;
Widget addStreetInRegion()=> Padding(
  padding: const EdgeInsets.all(AppPadding.p16),
  child: Container(
    // color: ColorManager.primary,
    width: double.infinity,

    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38.0)
    ),
    child: Column(
      children: [
        defaultTextfield(
          keyboard_type: keyboardTypeStreetField,
          controller_name: streetNameController,
          Decoration: streetFieldInputDecoration,
        ),
      ],
    ),
  ),
);
///----------------------------------------------------------------------------------
  /// Text Form Of add new home
var   homeNameController = TextEditingController();
var   keyboardTypeHomeField = TextInputType.multiline ;
var   homeFieldInputDecoration =  InputDecoration(
    border:OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    )
).copyWith(
  hintText: AppStrings.enterHomeName,
  label: const  Text( AppStrings.enterHomeName,),
) ;
Widget addHomeStreetInRegion()=> Padding(
  padding: const EdgeInsets.all(12.0),
  child: Container(
    // color: ColorManager.primary,
    width: double.infinity,

    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38.0)
    ),
    child: Column(
      children: [
        defaultTextfield(
          keyboard_type: keyboardTypeHomeField,
          controller_name: homeNameController,
          Decoration: homeFieldInputDecoration,
        ),
      ],
    ),
  ),
);

///----------------------------------------------------------------------------------
/// Text Form Of add  person  family

var  personNameController = TextEditingController();
var   keyboardTypePersonName = TextInputType.text ;
var   personNameFieldInputDecoration =  InputDecoration(
    border:OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    )
).copyWith(
  hintText: AppStrings.personName,
  label: const  Text( AppStrings.personName,),
) ;
Widget personNameField()=> Padding(
  padding: const EdgeInsets.all(12.0),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38.0)
    ),
    child: Column(
      children: [
        defaultTextfield(
          keyboard_type: keyboardTypePersonName,
          controller_name: personNameController,
          Decoration: personNameFieldInputDecoration,
        ),
      ],
    ),
  ),
);
//----------------------------------------------------------------------------------------------

var   personIDController = TextEditingController();
var   keyboardTypePersonID = TextInputType.number ;
var   personIDFieldInputDecoration =  InputDecoration(
    border:OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    )
).copyWith(
  hintText: AppStrings.personID,
  label: const  Text( AppStrings.personID,),
) ;
Widget personIDField()=> Padding(
  padding: const EdgeInsets.all(12.0),
  child: Container(
    // color: ColorManager.primary,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38.0)
    ),
    child: Column(
      children: [
        defaultTextfield(
          keyboard_type: keyboardTypePersonID,
          controller_name: personIDController,
          Decoration: personIDFieldInputDecoration,
        ),
      ],
    ),
  ),
);

//------------------------------------------------------------------------------------------------

var   personPhoneController = TextEditingController();
var   keyboardTypePersonPhone = TextInputType.number ;
var    personPhoneFieldInputDecoration =  InputDecoration(
    border:OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    )
).copyWith(
  hintText: AppStrings.personPhone,
  label: const  Text( AppStrings.personPhone,),
) ;
Widget personPhoneField()=> Padding(
  padding: const EdgeInsets.all(12.0),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38.0)
    ),
    child: Column(
      children: [
        defaultTextfield(
          keyboard_type: keyboardTypePersonPhone,
          controller_name: personPhoneController,
          Decoration: personPhoneFieldInputDecoration,
        ),
      ],
    ),
  ),
);


//----------------------------------------------------------------------------------------------

var   personAgeController = TextEditingController();
var   keyboardTypePersonAge = TextInputType.number ;
var   personAgeFieldInputDecoration =  InputDecoration(
    border:OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    )
).copyWith(
  hintText: AppStrings.personAge,
  label: const  Text( AppStrings.personAge,),
) ;
Widget personAgeField()=> Padding(
  padding: const EdgeInsets.all(12.0),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38.0)
    ),
    child: Column(
      children: [
        defaultTextfield(
          keyboard_type: keyboardTypePersonAge,
          controller_name: personAgeController,
          Decoration: personAgeFieldInputDecoration,
        ),
      ],
    ),
  ),
);
//----------------------------------------------------------------------------------------------
var   personBarthDayController = TextEditingController();
var   keyboardTypePersonBarthDay = TextInputType.datetime ;
var   personBarthDayFieldInputDecoration =  InputDecoration(
    border:OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    )
).copyWith(
  hintText: AppStrings.personAge,
  label: const  Text( AppStrings.personAge,),
) ;
Widget personBarthDayField()=> Padding(
  padding: const EdgeInsets.all(12.0),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38.0)
    ),
    child: Column(
      children: [
        defaultTextfield(
          keyboard_type: keyboardTypePersonBarthDay,
          controller_name: personBarthDayController,
          Decoration: personBarthDayFieldInputDecoration,
        ),
      ],
    ),
  ),
);


//----------------------------------------------------------------------------------------------
var   personWorkController = TextEditingController();
var   keyboardTypePersonWork = TextInputType.text ;
var   personWorkFieldInputDecoration =  InputDecoration(
    border:OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    )
).copyWith(
  hintText: AppStrings.personwork,
  label: const  Text( AppStrings.personwork,),
) ;
Widget personWorkField()=> Padding(
  padding: const EdgeInsets.all(12.0),
  child: Container(
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38.0)
    ),
    child: Column(
      children: [
        defaultTextfield(
          keyboard_type: keyboardTypePersonWork,
          controller_name: personWorkController,
          Decoration: personWorkFieldInputDecoration,
        ),
      ],
    ),
  ),
);



//--------------------------------------------------------------------------------------------------
var   personRelationController = TextEditingController();
var   keyboardTypePersonRelation = TextInputType.text ;
var   personRelationFieldInputDecoration =  InputDecoration(
    border:OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    )
).copyWith(
  hintText: AppStrings.personRelation,
  label: const  Text( AppStrings.personRelation,),
) ;
Widget personRelationField()=> Padding(
  padding: const EdgeInsets.all(12.0),
  child: Container(
    width: double.infinity,

    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38.0)
    ),
    child: Column(
      children: [
        defaultTextfield(
          keyboard_type: keyboardTypePersonRelation,
          controller_name: personRelationController,
          Decoration: personRelationFieldInputDecoration,
        ),
      ],
    ),
  ),
);

//----------------------------------------------------------------------------------------------
var   searchPersonController = TextEditingController();
var   keyboardTypeSearchPerson = TextInputType.text ;
var   searchPersonFieldInputDecoration =  InputDecoration(
    border:OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    )
).copyWith(
  hintText: AppStrings.searchPerson,
  label: const  Text( AppStrings.searchPerson,),
) ;
Widget searchPersonField()=> Padding(
  padding: const EdgeInsets.all(12.0),
  child: Container(
    width: double.infinity,

    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38.0)
    ),
    child: Column(
      children: [
        defaultTextfield(
          keyboard_type: keyboardTypeSearchPerson,
          controller_name: searchPersonController,
          Decoration: searchPersonFieldInputDecoration,
        ),
      ],
    ),
  ),
);
//----------------------------------------------------------------------------------------------




//-----------------------------------------------------------------------------------------------
Widget defaultTextfield (
{
  required  TextInputType keyboard_type ,
  required TextEditingController controller_name,
  required InputDecoration Decoration ,
//  required var validator
}
    ) => Padding(padding: const EdgeInsets.only(left: AppPadding.p28, right:  AppPadding.p28),
  child:  TextFormField(

    keyboardType: keyboard_type,
    controller: controller_name,
    decoration: Decoration,
//validator: validator,

  ) ,
);







