import 'package:first_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatelessWidget {
  final String _title;
  final String _body;
  final int _pageIndex;
  final int _pageCount;
  final String _svgImage;
  final VoidCallback _onNextPressed;
  final VoidCallback _onSkipPressed;

  const OnboardingScreen({
    super.key,
    required String title,
    required String body,
    required int pageIndex,
    required int pageCount,
    required String svgImage,
    required VoidCallback onNextPressed,
    required VoidCallback onSkipPressed,
  })  : _title = title,
        _body = body,
        _pageIndex = pageIndex,
        _pageCount = pageCount,
        _svgImage = svgImage,
        _onNextPressed = onNextPressed,
        _onSkipPressed = onSkipPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 64, left: 32, right: 32, bottom: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ContentBloc(
                title: _title,
                body: _body,
                pageIndex: _pageIndex,
                svgImage: _svgImage,
                pageCount: _pageCount,
              ),
              _ControlButtons(
                onNextPressed: _onNextPressed,
                onSkipPressed: _onSkipPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContentBloc extends StatelessWidget {
  final String _title;
  final String _body;
  final int _pageIndex;
  final int _pageCount;
  final String _svgImage;

  const _ContentBloc({
    required String title,
    required String body,
    required int pageIndex,
    required int pageCount,
    required String svgImage,
  })  : _title = title,
        _body = body,
        _pageIndex = pageIndex,
        _pageCount = pageCount,
        _svgImage = svgImage;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.string(_svgImage),
        const SizedBox(
          height: 32,
        ),
        _PageNumberPointer(
          pageIndex: _pageIndex,
          pagesCount: _pageCount,
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          _title,
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          _body,
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class _PageNumberPointer extends StatelessWidget {
  final int _pageIndex;
  final int _pagesCount;

  const _PageNumberPointer({
    required int pageIndex,
    required int pagesCount,
  })  : _pageIndex = pageIndex,
        _pagesCount = pagesCount;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 100,
      child: Row(
        children: List<Widget>.generate(
          _pagesCount,
          (index) => Expanded(
            flex: 4,
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                color: index == _pageIndex ? colorScheme.primary : colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ).insertBetween(
          const Spacer(
            flex: 1,
          ),
        ),
      ),
    );
  }
}

class _ControlButtons extends StatelessWidget {
  final VoidCallback _onNextPressed;
  final VoidCallback _onSkipPressed;

  const _ControlButtons({
    required VoidCallback onNextPressed,
    required VoidCallback onSkipPressed,
  })  : _onNextPressed = onNextPressed,
        _onSkipPressed = onSkipPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: _onSkipPressed,
          child: const Text('Пропустить'),
        ),
        FilledButton(
          onPressed: _onNextPressed,
          child: const Text('Продолжить'),
        ),
      ],
    );
  }
}