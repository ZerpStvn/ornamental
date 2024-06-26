import 'package:flutter/material.dart';
import 'package:ornamental/utils/functions.dart';

class PageViewPlant extends StatelessWidget {
  const PageViewPlant({
    super.key,
    required this.widthsize,
    required PageController pageController,
    required List? result,
  })  : _pageController = pageController,
        _result = result;

  final double widthsize;
  final PageController _pageController;
  final List? _result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: widthsize,
          height: 160,
          child: PageView.builder(
              scrollDirection: Axis.horizontal,
              padEnds: false,
              controller: _pageController,
              itemCount: _result!.length,
              itemBuilder: (context, index) {
                String label = _result[index]['label'].toString();

                String processedLabel =
                    label.replaceFirst(RegExp(r'^\d+\s*'), '');
                return plantdescriptions(processedLabel);
              })),
    );
  }
}
