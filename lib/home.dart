// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmbd_movie_app/core/constant/colors/app_palate.dart';
import 'package:tmbd_movie_app/features/home_provider.dart';
import 'package:tmbd_movie_app/features/movies/presentation/pages/movie_home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    print("Home Screen Builld called!!! ");
    return Scaffold(

      
      body: Consumer<HomeProvider>(builder: (context, provider, child) {
        return IndexedStack(
          alignment: Alignment.centerLeft,
          index: provider.currentIndex,
          children: [
            const MovieHome(),
            PendingScreen(title: 'Tv'),
            PendingScreen(title: 'Search'),
            PendingScreen(title: 'Bookmarks'),
            PendingScreen(title: 'Profile'),
          ],
        );
      }),
      bottomNavigationBar:
          Consumer<HomeProvider>(builder: (context, provider, child) {
        return BottomNavigationBar(
            onTap: (value) {
              provider.currentIndex = value;
            },
            enableFeedback: true,
            backgroundColor: AppPalate.transparent,
            useLegacyColorScheme: true,
            currentIndex: provider.currentIndex,
            showSelectedLabels: true,
            selectedItemColor: AppPalate.white,
            unselectedItemColor: AppPalate.grey,
            unselectedLabelStyle: const TextStyle(),
            items: [
              BottomNavigationBarItem(
                  backgroundColor: AppPalate.bluePrimary,
                  icon: const Icon(Icons.movie_outlined),
                  label: 'Movie'),
              BottomNavigationBarItem(
                  backgroundColor: AppPalate.bluePrimary,
                  icon: const Icon(Icons.tv_rounded),
                  label: 'Tv'),
              BottomNavigationBarItem(
                  backgroundColor: AppPalate.bluePrimary,
                  icon: const Icon(CupertinoIcons.search),
                  label: 'Search'),
              BottomNavigationBarItem(
                  backgroundColor: AppPalate.bluePrimary,
                  icon: const Icon(CupertinoIcons.bookmark),
                  label: 'Bookmark'),
              BottomNavigationBarItem(
                  backgroundColor: AppPalate.bluePrimary,
                  icon: const Icon(CupertinoIcons.person),
                  label: 'Profile'),
            ]);
      }),
    );
  }
}

class PendingScreen extends StatelessWidget {
  PendingScreen({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: AppPalate.white),
        ),
      ),
    );
  }
}
