// // Flutter example using http package:
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
//
// Future<void> fetchRecipes() async {
//   final apiKey = '558a9282290548c59508f3db16d78e29';
//   final response = await http.get(Uri.parse('https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey&query=pasta'));
//
//   if (response.statusCode == 200) {
//     var data = json.decode(response.body);
//     print(data);
//   } else {
//     throw Exception('Failed to load recipes');
//   }
// }