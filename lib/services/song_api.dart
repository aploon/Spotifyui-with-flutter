import 'package:http/http.dart' as http;
import 'package:spotify_clone/models/song.dart';

getSongFromApi() async{
  
  final url = Uri.parse('https://api.deezer.com/playlist/10149128982/tracks');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var json = response.body;
    return songFromJson(json);
  } else {
    return [];
  }
}
