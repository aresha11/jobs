import 'dart:io';

import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';

import '../../0_model/portfolio_model.dart';
import '../../utility/constants.dart';
import '../database/shared/dio/dio_helper.dart';

part 'protofolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit() : super(AddPortfolioInitial());

  DioHelper dioHelper = DioHelper();
  PortfolioModel portfolioModel=PortfolioModel();


  addPortfolio() async {
    emit(AddPortfolioLoadingState());
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom,allowedExtensions: ["pdf"]);
    File? file;
    if (result != null) {
      file = File(result.files.single.path!);
      FormData data = FormData.fromMap(
          {'cv_file': await MultipartFile.fromFile(file.path), 'name': file.hashCode});
      dioHelper
          .postData(
          url: addPortfolioEndPoint +
              SharedPreference.get(key: "id").toString(),
          token: SharedPreference.get(key: 'token'),
          data: data)
          .then((value) {
        emit(AddPortfolioSuccessState());
        print(value.data);
      }).catchError((onError) {
        emit(AddPortfolioFailedInitial());
        throw onError;
      });
    }
  }


  getPortfolios(){

    emit(GetPortfolioLoadingState());
      dioHelper
          .getData(
          url: addPortfolioEndPoint +
              SharedPreference.get(key: "id").toString(),
          token: SharedPreference.get(key: 'token'),
      )
          .then((value) {
        emit(GetPortfolioSuccessState());
        portfolioModel=PortfolioModel.fromJson(value.data);
        print(value.data);
      }).catchError((onError) {
        emit(GetPortfolioFailedInitial());
        throw onError;
      });
    }






  }













