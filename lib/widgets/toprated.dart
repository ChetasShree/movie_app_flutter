import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../description.dart';

class TopRated extends StatelessWidget {
  final List toprated;
  const TopRated({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(text: 'Top Rated Movies', size: 26),
          SizedBox(height: 10),
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: toprated.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Description(
                                name: toprated[index]['title'],
                                description: toprated[index]['overview'],
                                bannerurl:
                                    'https://image.tmdb.org/t/p/w500${toprated[index]['backdrop_path']}',
                                posterurl:
                                    'https://image.tmdb.org/t/p/w500${toprated[index]['poster_path']}',
                                vote:
                                    toprated[index]['vote_average'].toString(),
                                lauch_on: toprated[index]['release_date'])));
                  },
                  child: toprated[index]['title'] == null
                      ? Container()
                      : Container(
                          width: 140,
                          child: Column(children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500${toprated[index]['poster_path']}')),
                              ),
                            ),
                            Container(
                                child: modified_text(
                              text: toprated[index]['title'] != null
                                  ? toprated[index]['title']
                                  : 'Loading',
                            ))
                          ]),
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
