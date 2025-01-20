import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/logic/bloc/main_bloc/main_bloc.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/data/enums/product_data.dart';
import 'package:e_commerce/UI/extensions/get_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart' show Shimmer;

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
    required this.height,
    this.margin = EdgeInsets.zero,
    this.viewportFraction = 0.8,
  });

  final double viewportFraction;
  final double height;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final data = context.watch<MainBloc>().state.products;
    return FlutterCarousel.builder(
      itemCount: 3,
      options: FlutterCarouselOptions(
        enlargeCenterPage: true,
        viewportFraction: viewportFraction,
        floatingIndicator: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        enableInfiniteScroll: true,
        height: height,
        showIndicator: true,
        slideIndicator: CircularSlideIndicator(
          slideIndicatorOptions: SlideIndicatorOptions(
            currentIndicatorColor: Colors.black,
            indicatorBackgroundColor: Colors.grey,
          ),
        ),
      ),
      itemBuilder: (context, index, realIndex) {
        if (data != null) {
          return GestureDetector(
            onTap: () => context.pushNamed(
              Routes.detailsView,
              extra: data.elementAt(index),
            ),
            child: Card(
              margin: margin,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: CachedNetworkImage(
                  width: MediaQuery.of(context).size.width,
                  imageUrl: index.ofProduct(data, ProductData.image),
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        } else {
          return Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 189, 189, 189),
            highlightColor: const Color.fromARGB(255, 238, 238, 238),
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: margin,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 189, 189, 189),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          );
        }
      },
    );
  }
}
