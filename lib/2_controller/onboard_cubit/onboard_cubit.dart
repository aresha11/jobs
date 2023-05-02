import 'package:amitproject/2_controller/database/local/shared_preference.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit() : super(OnboardInitial());


  int currentIndex = 0;
  storeOnboardInfo()  {
    int isViewed = 0;
    SharedPreference.put(key: 'onBoard', value: isViewed);
    emit(OnboardSaveInfo());
  }
  changeIndex(index){
    currentIndex = index;
    emit(OnboardChangeIndex());
  }





}
