import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Pour la gestion de JSON

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String message = 'Fetching data...';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // Fonction pour récupérer des données depuis le serveur
  Future<void> fetchData() async {
    final url = Uri.parse('http://localhost:3002/api/message');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          message = data['message'];
        });
      } else {
        setState(() {
          message = 'Failed to fetch data';
        });
      }
    } catch (e) {
      setState(() {
        message = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter & Node.js Example')),
      body: Center(child: Text(message)),
    );
  }
}
