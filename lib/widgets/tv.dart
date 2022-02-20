import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../description.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({Key? key, required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'Popular Tv Shows', size: 26),
          SizedBox(height: 10),
          Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Description(
                                      name: tv[index]['original_name'],
                                      description: tv[index]['overview'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500${tv[index]['backdrop_path']}',
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500${tv[index]['poster_path']}',
                                      vote:
                                          tv[index]['vote_average'].toString(),
                                      lauch_on: tv[index]['first_air_date'])));
                        },
                        child: tv[index]['original_name'] == null
                            ? Container()
                            : Container(
                                padding: EdgeInsets.all(5),
                                width: 250,
                                child: Column(children: [
                                  Container(
                                    width: 250,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500${tv[index]['backdrop_path']}'),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                      child: modified_text(
                                    text: tv[index]['original_name'] != null
                                        ? tv[index]['original_name']
                                        : 'Loading',
                                  ))
                                ]),
                              ));
                  }))
        ],
      ),
    );
  }
}
