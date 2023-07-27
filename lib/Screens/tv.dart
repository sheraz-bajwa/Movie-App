import 'package:flutter/material.dart';
import 'package:movieapp/Services/Services.dart';
//import 'api_service.dart';

class EpisodeListScreen extends StatelessWidget {
  //final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Episode List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchEpisodeList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching data'),
            );
          } else {
            final episodeList = snapshot.data;

            return ListView.builder(
              itemCount: episodeList!.length,
              itemBuilder: (context, index) {
                final episode = episodeList[index];
                return ListTile(
                  title: Text(episode['name'] ?? ''),
                  subtitle: Text(episode['overview'] ?? ''),
                  // Add more widgets to display other episode details if needed.
                );
              },
            );
          }
        },
      ),
    );
  }
}
