part of 'person_cubit.dart';

@immutable
abstract class PersonState {}

class PersonInitial extends PersonState {}
class AddPersonInformationSuccess extends PersonState {}

class AddPersonInformationError extends PersonState {}
class ChoseGenderSuccs extends PersonState {}
class ChoseStateSuccs extends PersonState {}
class ChoseEducSuccs extends PersonState {}

class UpdatePersonInformationSuccess extends PersonState {}
class UpdatePersonInformationError extends PersonState {}

class DeletePersonInformationSuccess extends PersonState {}
class DeletePersonInformationError extends PersonState {}
class SearchPersonInformationSuccess extends PersonState {}
class SearchPersonInformationError extends PersonState {}
class StringSearchChange extends PersonState {}
class ChanageExpandedSuccess extends PersonState {}

class ChoseFatherrSuccs extends PersonState {}

class SearchSelectedFaildSuccess extends PersonState {}

class GetRgionInfoSuccess extends PersonState {}
class GetRgionInfoError extends PersonState {}







