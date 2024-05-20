// ignore_for_file: must_be_immutable

import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tmbd_movie_app/core/constant/api_const/api_urls.dart';
import 'package:tmbd_movie_app/core/constant/app_routes/app_routes.dart';
import 'package:tmbd_movie_app/core/constant/colors/app_palate.dart';
import 'package:tmbd_movie_app/features/movies/presentation/argumennt/movie_details_page_arg.dart';
import 'package:tmbd_movie_app/features/movies/presentation/blocs/now_movies_bloc/now_movies_bloc.dart';
import 'package:tmbd_movie_app/features/movies/presentation/widgets/providers/slider_provider.dart';

class MovieSlider extends StatefulWidget {
  const MovieSlider({
    super.key,
  });
  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final SwiperController sliderController = SwiperController();
  int sliderIndex = 0;
  final CarouselController _carouselController = CarouselController();
  @override
  void initState() {
    context.read<NowMoviesBloc>().add(FetchNowMoviesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowMoviesBloc, NowMoviesState>(
      builder: (context, state) {
        if (state is NowMoviesLoadingState) {
          return Column(
            children: [
              CarouselSlider.builder(
                  itemCount: 7,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      margin: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppPalate.grey,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {},
                  )),
              const SizedBox(height: 10),
              SizedBox(
                child: AnimatedSmoothIndicator(
                  activeIndex: 0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear,
                  axisDirection: Axis.horizontal,
                  effect: ExpandingDotsEffect(
                      dotColor: AppPalate.bluePrimary,
                      activeDotColor: AppPalate.grey),
                  count: 7,
                ),
              ),
              const SizedBox(height: 20)
            ],
          );
        } else if (state is NowMoviesFailureState) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is NowMoviesSuccessState) {
          return Column(
            children: [
              CarouselSlider.builder(
                  itemCount: 7,
                  carouselController: _carouselController,
                  itemBuilder: (context, index, realIndex) {
                    var movie = state.model.movies![index]!;
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.movieDetailsHome,
                            arguments: MovieDetailsPageArgument(
                                moviesEntities: movie));
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: AppPalate.grey,
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      '${ApiUrls.imageBaseUrl}${movie.posterPath}'),
                                  fit: BoxFit.fitWidth,
                                )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: AppPalate.black.withOpacity(0.2)),
                          )
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      context.read<SliderIndexProvider>().index = index;
                    },
                  )),
              const SizedBox(height: 10),
              SizedBox(
                child: AnimatedSmoothIndicator(
                  activeIndex: context.watch<SliderIndexProvider>().index,
                  onDotClicked: (index) {
                    _carouselController.animateToPage(index);
                  },
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear,
                  axisDirection: Axis.horizontal,
                  effect: ExpandingDotsEffect(
                      dotColor: AppPalate.bluePrimary,
                      activeDotColor: AppPalate.grey),
                  count: 7,
                ),
              ),
              const SizedBox(height: 20)
            ],
          );
        }
        return Container();
      },
    );
  }
}
/**/

/*
 late Gallery3DController sliderController;


    sliderController = Gallery3DController(
        itemCount: widget.movies.movies!.length,
        autoLoop: false,
        scrollTime: 5000,
        ellipseHeight: 0,
        minScale: 0.1);



Gallery3D(
      controller: sliderController,
      padding: const EdgeInsets.all(5),
      itemConfig: const GalleryItemConfig(width: 300, height: 300, radius: 12),
      width: MediaQuery.of(context).size.width,
      height: 350,

      // isClip: true,
      itemBuilder: (context, index) {
        return Image.network(
          '${ApiUrls.imageBaseUrl}${widget.movies.movies![index]!.posterPath}',
          fit: BoxFit.cover,
        );
      },
    ); */

/*
       Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 350,
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: AppPalate.bluePrimary.withOpacity(0.7),
                                spreadRadius: 100,
                                blurStyle: BlurStyle.normal,
                                blurRadius: 100)
                          ],
                          // borderRadius: BorderRadius.circular(10),
                        ),
                        // child: Image.network(
                        //   '${ApiUrls.imageBaseUrl}${state.model.movies![context.watch<SliderIndexProvider>().index]!.posterPath}',
                        //   fit: BoxFit.fill,
                        // ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    child: Swiper(
                      curve: Curves.linear,
                      scrollDirection: Axis.horizontal,
                      pagination: SwiperPagination.rect,
                      controller: sliderController,
                      itemCount: state.model.movies!.length,
                      viewportFraction: 0.8,
                      scale: 0.8,
                      axisDirection: AxisDirection.up,
                      // autoplay: true,
                      autoplayDelay: 4000,
                      duration: 1200,
                      fade: 0.97,
                      loop: true,
                      transformer: ScaleAndFadeTransformer(scale: 0.5),
                      onIndexChanged: (value) {
                        context.read<SliderIndexProvider>().index = value;
                      },
                      itemBuilder: (context, index) {
                        var movie = state.model.movies![index]!;
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            '${ApiUrls.imageBaseUrl}${movie.posterPath}',
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ).asGlass(
                      enabled: true,
                      blurX: 10,
                      blurY: 250,
                      frosted: true,
                      tintColor: Colors.transparent,
                      tileMode: TileMode.mirror,
                      clipBorderRadius: BorderRadius.circular(0)),*/
