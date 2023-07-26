import 'package:flutter/material.dart';
import 'package:movieapp/Services/Services.dart';
import 'package:movieapp/meethood.dart';

class TVScreen extends StatefulWidget {
  @override
  _TVScreenState createState() => _TVScreenState();
}

class _TVScreenState extends State<TVScreen> {
  // late Future<Tv> _tvData;

  // @override
  // void initState() {
  //   super.initState();
  //   _tvData = fetchTvData()
  //       as Future<Tv>; // Call the fetchTvData() method to get the data
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: fetchTvData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Data has been successfully fetched and parsed
              final List tv = snapshot.data as List;
              return Container(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            //color: Colors.black
                          ),
                          //margin: EdgeInsets.all(10),
                          height: 150,
                          width: 200,
                          child: Column(
                            children: [
                              // Container(
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(20),
                              //     image: DecorationImage(
                              //       fit: BoxFit.fill,
                              //       image: NetworkImage(
                              //           'https://image.tmdb.org/t/p/w500' +
                              //               movies![index]['poster_path']),
                              //     ),
                              //   ),
                              //   width: 200,
                              //   height: 200,
                              // ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              // Container(
                              //   height: 70,
                              //   child: text(
                              //       data: movies[index]['title'],
                              //       color: Colors.white,
                              //       size: 20),
                              // )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
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
