import 'package:bottom_navigation_bar/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper_widgets/flutter_helper_widgets.dart';

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "A bare bone 'BottomNavigationBar'.\nIt simply changes current Index on 'onTap'. Then,\nbased on that makes changes to other part of tha app (BottomNavigationBar changes automatically).",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text('wrapping padding:'),
                            TextButton(
                              onPressed: () {
                                PaddingNotifier.singleton()
                                    .randomAll(min: 19.5, max: 20);
                              },
                              child: const Text('change padding'),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Text('wrapping container:'),
                            TextButton(
                              onPressed: () {
                                ColorNotifier.singleton().pickRandom();
                              },
                              child: const Text('change color'),
                            )
                          ],
                        ),
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
      bottomNavigationBar: WidgetWrapper(
        wrappers: const [
          ContainerWrapper(),
          PaddingWrapper(),
        ],
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
