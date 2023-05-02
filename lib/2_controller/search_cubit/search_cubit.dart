import 'package:amitproject/0_model/search_model.dart';
import 'package:amitproject/2_controller/database/shared/dio/dio_helper.dart';
import 'package:amitproject/utility/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../0_model/searchFilteringModel.dart';
import '../database/local/shared_preference.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  DioHelper dioHelper=DioHelper();
  bool isSearched=false;
  bool isFiltered=false;

  changeSearchItems(value){
    if(value!=""){
      isSearched=true;
      emit(ChangeSearchItemsSuccess());
    }else{
      isSearched=false;
      emit(ChangeSearchItemsFailed());
    }

  }

  void searchJobs(String searchItem) {
    emit(LoadingDataState());
    dioHelper.getData(
      queryParameters: {
        "name":searchItem
      },
      url:searchEndPoint,
      token: SharedPreference.get(key: "token") ,
    ).then((value) {
      if (value.statusCode ==200) {
        emit(GetSearchDataSuccessState(searchModel: SearchModel.fromJson(value.data)));
        print(SearchModel.data![0].name);
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(GetDataErrorState());
    });
  }





void changeFilter(){
  isFiltered=!isFiltered;
}

  void searchFilterJobs(String name,String location,String salary,
      {searchController}) {

    emit(LoadingFilteringDataState());
    dioHelper.getData(
      queryParameters: {
        "name":name,
        "location":location,
        "salary":salary,
      },
      url:searchFilterEndPoint,
      token: SharedPreference.get(key: "token") ,
    ).then((value) {
      if (value.statusCode ==200) {
        emit(GetSearchFilteringDataSuccessState(searchFilteringModel: SearchFilteringModel.fromJson(value.data)));
        searchController.text=SearchFilteringModel.data!.isEmpty?"":SearchFilteringModel.data![0].name.toString();
        print(SearchFilteringModel.data![0].name);
        print(SearchFilteringModel.data![0].location);
        print(SearchFilteringModel.data![0].salary);
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      emit(GetDataFilteringErrorState());
    });
  }

}
