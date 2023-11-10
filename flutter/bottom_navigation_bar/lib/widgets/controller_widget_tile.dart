import 'package:flutter/material.dart';

class ControllerWidgetTile extends StatelessWidget {
  const ControllerWidgetTile(
      {super.key, required this.title, required this.children});
  final String title;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(title),
        children: children,
      ),
    );
  }
}
