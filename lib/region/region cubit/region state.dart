part of 'region cubit.dart';

@immutable
abstract class RegionState {}

class HomeInitial extends RegionState {}
class DataArriveSuccess extends RegionState {}
class DataArriveError extends RegionState {}
class RegionAddedSuccessfully extends RegionState {}
class ErrorAddedRegion extends RegionState {}
class RegionNameUpdatedSuccessfully extends RegionState {}
class ErrorUpdatingRegionName extends RegionState {}
class DocumentIdUpdatedSuccessfully extends RegionState {}
class ErrorUpdatingDocumentId extends RegionState {}
class RegionDeletedSuccessfully extends RegionState {}
class ErrorDeletingRegion extends RegionState {}

