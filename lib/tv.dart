import 'package:flutter/material.dart';
import 'package:movieapp/Services/Services.dart';
import 'package:movieapp/meethood.dart';

class TVScreen extends StatefulWidget {
  @override
  _TVScreenState createState() => _TVScreenState();
}

class _TVScreenState extends State<TVScreen> {
  late Future<Tv> _tvData;

  @override
  void initState() {
    super.initState();
    _tvData = fetchTvData(); // Call the fetchTvData() method to get the data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Tv>(
          future: _tvData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Data has been successfully fetched and parsed
              var tv = snapshot.data;
              return ListView(
                children: [
                  ListTile(
                    title: Text('Name: ${tv!.name}'),
                    subtitle: Text('Overview: ${tv.overview}'),
                  ),
                  // Add more ListTiles or other widgets to display other TV data
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: TVScreen(),
    ));
