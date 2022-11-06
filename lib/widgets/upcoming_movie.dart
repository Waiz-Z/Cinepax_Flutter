import 'package:cinepax_flutter/constants/constants.dart';
import 'package:cinepax_flutter/models/movie_item.dart';
import 'package:cinepax_flutter/providers/movies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class UpcomingMovie extends StatelessWidget {
  List<MovieItem> _upcomingMovies = [];
  final index;

  UpcomingMovie({required this.index});

  @override
  Widget build(BuildContext context) {
    _upcomingMovies =
        Provider.of<Movies>(context, listen: false).getUpcomingMovies;
    return Container(
      width: 240,
      height: 190,
      margin: EdgeInsets.only(left: 20, bottom: 0.99.h),
      padding: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              _upcomingMovies[index].imagePath,
              width: 240,
              height: 135,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _upcomingMovies[index].title,
                  style: kHeadlineSmall.copyWith(
                    color: kPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  'Expected RD: ${_upcomingMovies[index].releaseDate}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
