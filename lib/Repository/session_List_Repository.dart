import 'package:event_app/Models/Agenda_model.dart';
import 'package:event_app/network/ApiProvider.dart';
import 'package:event_app/network/ApiResponse.dart';

class sessionRepository{
  ApiProvider _provider=ApiProvider();

  Future<Agenda_Model> fetchSessionData() async{
    final response=await _provider.get("write your agenda url here");
    return Agenda_Model.fromJson(response);
  }
}