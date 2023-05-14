import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'main.dart'
import 'models.dart';
import 'dart:convert';

Future<String> makeHttpRequest(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // Request successful, parse the response data
    final responseData = response.body;
    // Handle the response data
    return responseData;
  } else {
    // Request failed, handle the error
    throw Exception();
  }
}

class RankingPage extends StatelessWidget {
  RankingPage({Key? key}) : super(key: key);

  //final List<Player> players = getRanking();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: makeHttpRequest("http://127.0.0.1:3000/getRanking"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Display a loading indicator while data is being fetched
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          String jsonString = snapshot.data ?? '';
          List<dynamic> jsonArray = jsonDecode(jsonString);
          return Scaffold(
              body: ListView.builder(
                  itemCount: jsonArray.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(jsonArray[index]["nombre"]),
                      subtitle: Text(jsonArray[index]["puntos"].toString()),
                    );
                  }));
        }
      },
    );
  }
}
