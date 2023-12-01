

class Region {
  String nameRegion;

  Region(this.nameRegion);
}

class Streets {
  String nameStreet;

  String regionId;

  Streets(this.nameStreet, this.regionId);
}

class Homes {
  String regionId;
  String streetId;
  String homeName;

  Homes(this.regionId, this.homeName, this.streetId);
}

class PersonInformation {
  String regionId;
  String streetId;
  String homeName;

  //---------------------------------
  String personName;

  String personID;

  String personPhone;

  String personAge;

  String personDateOfBarthday;

  int personGender;

  int personState;

  int personEducation;

  String personWork;
  String personRelation ;

  int personFather ;
  PersonInformation({
    required this.personAge,
    required this.streetId,
    required this.regionId,
    required this.homeName,
    required this.personDateOfBarthday,
    required this.personEducation,
    required this.personGender,
    required this.personID,
    required this.personName,
    required this.personPhone,
    required this.personState,
    required this.personWork,
    required this.personRelation,
    required this.personFather ,
  });
}

class PersonInformationToDelete {
  String regionId;
  String streetId;
  String homeName;
  String personName;



  PersonInformationToDelete({
    required this.streetId,
    required this.regionId,
    required this.homeName,
    required this.personName,

  });
}


