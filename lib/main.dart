import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FactoryTeamScreen(),
    );
  }
}

class FactoryTeamScreen extends StatelessWidget {
  final List<Map<String, String>> teamMembers = [
    {'name': 'Rafael', 'role': 'Aluno'},
    {'name': 'Gabriel', 'role': 'Aluno'},
    {'name': 'Lukas', 'role': 'Aluno'},
    {'name': 'Wallace', 'role': 'CEO'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fábrica de Software')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(),
          columnWidths: {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(2),
          },
          children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Nome', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Cargo', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ]),
            ...teamMembers.map((member) => TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(member['name']!),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(member['role']!),
              ),
            ])).toList(),
          ],
        ),
      ),
    );
  }
}
