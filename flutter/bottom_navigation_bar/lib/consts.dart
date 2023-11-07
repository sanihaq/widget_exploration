import 'package:flutter/material.dart';

class _TabsData {
  final String label;
  final IconData icon;

  const _TabsData({required this.label, required this.icon});
}

const tabsData = [
  _TabsData(
    label: 'Home',
    icon: Icons.home,
  ),
  _TabsData(
    label: 'Business',
    icon: Icons.business,
  ),
  _TabsData(
    label: 'School',
    icon: Icons.school,
  ),
];
