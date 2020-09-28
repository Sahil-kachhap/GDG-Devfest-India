
import 'package:event_app/Models/Speaker_Model.dart';
import 'package:event_app/network/ApiProvider.dart';

class SpeakerRepository{
  ApiProvider _provider=ApiProvider();

  Future<Speaker_models>  fetchSpeakersData() async{
    final response= await _provider.get("jokes/categories");
    return Speaker_models.fromJson(response);
  }
}