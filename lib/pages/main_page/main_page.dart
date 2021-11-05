import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:worlds_factory/common.dart';
import 'package:worlds_factory/pages/dictionary_screen/discionary_screen.dart';
import 'package:worlds_factory/pages/video_screen/video_screen.dart';

class MainPage extends HookWidget {
  const MainPage({Key? key}) : super(key: key);

  static const _bodyes = [
    DictionaryScreen(),
    SizedBox.shrink(),
    VideoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(border: Border.all(color: KColors.grey)),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: BottomNavigationBar(
            onTap: (i) => selectedIndex.value = i,
            currentIndex: selectedIndex.value,
            selectedItemColor: KColors.primary,
            items: [
              BottomNavigationBarItem(
                icon: _buildIcon(
                    'assets/images/courses', selectedIndex.value == 0),
                label: 'Dictionary',
              ),
              BottomNavigationBarItem(
                icon:
                    _buildIcon('assets/images/train', selectedIndex.value == 1),
                label: 'Training',
              ),
              BottomNavigationBarItem(
                icon:
                    _buildIcon('assets/images/video', selectedIndex.value == 2),
                label: 'Video',
              ),
            ],
          ),
        ),
      ),
      body: _bodyes[selectedIndex.value],
    );
  }

  Widget _buildIcon(String name, bool active) {
    return Image.asset(
      name + (active ? '_active.png' : '.png'),
      width: 22,
      height: 22,
      fit: BoxFit.contain,
    );
  }
}
