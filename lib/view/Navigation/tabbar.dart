import 'package:eaglone/view/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';

class TabBarMaterialWidget extends StatefulWidget {
  final int inddex;
  final ValueChanged<int> onChangedTab;
  const TabBarMaterialWidget(
      {super.key, required this.inddex, required this.onChangedTab});

  @override
  State<TabBarMaterialWidget> createState() => _TabBarMaterialWidgetState();
}

class _TabBarMaterialWidgetState extends State<TabBarMaterialWidget> {
  @override
  Widget build(BuildContext context) {
    final placeholder = Opacity(
        opacity: 0,
        child: IconButton(onPressed: null, icon: Icon(Icons.no_cell)));
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildtabitem(index: 0, icon: Icon(Iconsax.home)),
          buildtabitem(index: 1, icon: Icon(Iconsax.book)),
          placeholder,
          buildtabitem(index: 2, icon: Icon(Iconsax.money)),
          buildtabitem(index: 3, icon: Icon(Iconsax.setting))
        ],
      ),
    );
  }

  Widget buildtabitem({required int index, required Icon icon}) {
    final isSelected = index == widget.inddex;
    return IconTheme(
        data: IconThemeData(color: isSelected ? themeGreen : kblack),
        child: IconButton(
            onPressed: () => widget.onChangedTab(index), icon: icon));
  }
}
