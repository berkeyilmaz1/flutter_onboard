import 'package:auth_with_onboarding/feature/onboard/model/onboard_model.dart';
import 'package:auth_with_onboarding/feature/onboard/tabIndicator.dart';
import 'package:auth_with_onboarding/feature/product/utility/padding/padding.dart';
import 'package:auth_with_onboarding/feature/product/widgets/onboard_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  final String _skipTitle = "Skip";
  final String _nextTitle = "NEXT";
  final String _goTitle = "GO!";
  int _selectedIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool get _isLastPage => OnBoardModels.onboardItems.length - 1 == _selectedIndex;

  bool get _isFirstPage => _selectedIndex == 0;

  void _incrementAndChange([int? value]) {
    if (_isLastPage && value == null) {
      return;
    }
    int newIndex = value ?? _selectedIndex + 1;
    if (newIndex < OnBoardModels.onboardItems.length) {
      _pageController.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const ProjectPadding.all(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: _pageViewItems(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabIndicator(
                  selectedIndex: _selectedIndex,
                ),
                _nextButton()
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [TextButton(onPressed: () {}, child: Text(_skipTitle))],
      leading: _isFirstPage
          ? null
          : IconButton(
              onPressed: () {
                if (_selectedIndex > 0) {
                  _pageController.animateToPage(
                    _selectedIndex - 1,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              },
              icon: const Icon(Icons.chevron_left),
              color: Colors.grey,
            ),
    );
  }

  Widget _pageViewItems() {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      itemCount: OnBoardModels.onboardItems.length,
      itemBuilder: (context, index) {
        return OnboardCard(model: OnBoardModels.onboardItems[index]);
      },
    );
  }

  FloatingActionButton _nextButton() {
    return FloatingActionButton(
      onPressed: () => _incrementAndChange(),
      child: Text(_isLastPage ? _goTitle : _nextTitle),
    );
  }
}