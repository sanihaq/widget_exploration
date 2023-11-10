import 'package:bottom_navigation_bar/components/wrap_with_container.dart';
import 'package:bottom_navigation_bar/consts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BottomNavigationBar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar'),
      ),
      body: Column(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "A bare bone 'BottomNavigationBar'.\nIt simply changes current Index on 'onTap'. Then,\nbased on that makes changes to other part of tha app (BottomNavigationBar changes automatically).",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        WrapContainerControllerWidget(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(tabsData[_selectedIndex].icon),
                const SizedBox(width: 10),
                Text(tabsData[_selectedIndex].label),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: WrapContainer(
        child: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          items: tabsData
              .map(
                (tabData) => BottomNavigationBarItem(
                  label: tabData.label,
                  icon: Icon(tabData.icon),
                ),
              )
              .toList(),
          // elevation: 20,
        ),
      ),
    );
  }
}
