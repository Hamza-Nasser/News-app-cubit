import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/cubit/states.dart';
import 'package:news/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = CacheHelper.getPrefsBoolean('isDark');

  void changeAppMode({bool? fromShared}){
    if(fromShared != null){
      isDark = fromShared;
      emit(AppChangeModeState());
    }else {
      isDark = !isDark;
      CacheHelper.setPrefsBoolean(key: 'isDark', value: isDark).then((value) =>
       emit(AppChangeModeState()));
    }
    
    
    
  }

}