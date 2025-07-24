import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<BannerCarousel> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<String> images = [
    'images/hubbaner.png',
    'images/hubbaner.png',
    'images/hubbaner.png',
  ];

  void _goToPrevious() {
    if (currentPage > 0) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _goToNext() {
    if (currentPage < images.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 60, right: 60),
        child: SizedBox(
          height: 500,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: images.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                left: -2,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, size: 40),
                  onPressed: _goToPrevious,
                ),
              ),
              Positioned(
                right: -10,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, size: 40),
                  onPressed: _goToNext,
                ),
              ),
              Positioned(
                bottom: 20,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: images.length,
                  effect: const WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
