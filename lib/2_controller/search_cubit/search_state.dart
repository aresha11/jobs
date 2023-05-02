part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class ChangeSearchItemsSuccess extends SearchState {}
class ChangeSearchItemsFailed extends SearchState {}
class LoadingDataState extends SearchState {}
class GetDataErrorState extends SearchState {}
class GetSearchDataSuccessState extends SearchState {
  SearchModel searchModel;
  GetSearchDataSuccessState( {required this.searchModel});
}

class LoadingFilteringDataState extends SearchState {}
class GetDataFilteringErrorState extends SearchState {}
class GetSearchFilteringDataSuccessState extends SearchState {
  SearchFilteringModel searchFilteringModel;
  GetSearchFilteringDataSuccessState( {required this.searchFilteringModel});
}
