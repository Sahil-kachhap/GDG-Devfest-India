import 'package:bloc/bloc.dart';
import 'package:event_app/ThemeBloc/export.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AppTheme.dart';

class ThemeBloc extends Bloc<ThemeEvent,ThemeState>{
  @override
  // TODO: implement initialState
  get initialState => ThemeState(theme: Themes.LightTheme);

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async*{
    // TODO: implement mapEventToState
    if(event is ThemeEvent){
      yield ThemeState(theme: event.theme);
    }
  }

  _persistTheme(Themes theme) async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    prefs.setString("SelectedThemeIndex", theme.toString());
  }

}