// import 'package:flutter/cupertino.dart';
// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tmbd_movie_app/core/constant/colors/app_palate.dart';

class MyShimmerContainer extends StatelessWidget {
  const MyShimmerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppPalate.grey,
        highlightColor: AppPalate.greyS400,
        child: Container(
          decoration: BoxDecoration(
              color: AppPalate.grey,
              borderRadius: BorderRadius.circular(8)),
        ));
  }
}
