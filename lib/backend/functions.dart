import 'dart:convert';
import 'package:new_j/components/searchbar.dart';
import 'package:new_j/utils/key.dart';
import 'package:http/http.dart' as http;

Future<List> fetchnews() async
{

  final response = await http.get(
    Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey='+
    Key.key+
        '&q='+
        Searchbar.searchcontroller.text),
    );
  Map result = jsonDecode(response.body);
  print('Fetched');
  return (result['articles']);
}