import 'package:http/http.dart' as http;
import 'package:music_app/constant.dart';
import 'package:music_app/model/audio.dart';
class AudioRepository {
  static var client = http.Client();
  Future<ListAudio?> fetchData() async {
    var response = await client.get(
        Uri.parse(DeezerOptions.baseUrl),
        headers: DeezerOptions.headers
    );
    if(response.statusCode == 200){
      return listAudioFromJson(response.body);
    } else {
      return null;
    }
  }
}