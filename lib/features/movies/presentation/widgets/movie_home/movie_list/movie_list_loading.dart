// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tmbd_movie_app/core/constant/colors/app_palate.dart';

class MovieListLoading extends StatelessWidget {
  String title;
  MovieListLoading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppPalate.white,
                fontSize: 18),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 25 : 8),
                  child: Container(
                    width: 150,
                    height: 220,
                    decoration: BoxDecoration(
                        color: AppPalate.grey,
                        borderRadius: BorderRadius.circular(12)),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
