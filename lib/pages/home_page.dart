import 'package:flutter/material.dart';
import 'package:spotify/theme/font_theme.dart';
import 'package:spotify/widgets/home_big_tile.dart';
import 'package:spotify/widgets/home_page_recent_tile.dart';
import 'package:spotify/search/search_page.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentNavItem = 0;

  // List of pages for bottom navigation
  final List<Widget> _pages = [
    const HomePageContent(),
    const SearchPage(), // Add the SearchPage here
    const Center(child: Text('Library')), // Placeholder for Library tab
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentNavItem,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music_outlined),
            activeIcon: Icon(Icons.library_music_rounded),
            label: 'Library',
          ),
        ],
        selectedItemColor: Colors.white,
        iconSize: 30,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (index) {
          setState(() {
            _currentNavItem = index;
          });
        },
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: _pages[_currentNavItem], // Display content based on selected tab
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Account'),
              onTap: () {
                // Navigate to account settings
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                // Navigate to notification settings
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help & Support'),
              onTap: () {
                // Navigate to help/support
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Salutations and top navbar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'What\'s up Bintang ',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.notifications_outlined, size: 30),
                  const SizedBox(width: 15),
                  const Icon(Icons.history_outlined, size: 30),
                  const SizedBox(width: 15),
                  IconButton(
                    icon: const Icon(Icons.settings_outlined, size: 30),
                    onPressed: () {
                      Scaffold.of(context)
                          .openEndDrawer(); // Open the end drawer
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Capsules
          const Row(
            children: [
              Capsule(text: 'Music'),
              SizedBox(width: 10),
              Capsule(text: 'Podcasts & Shows'),
            ],
          ),
          const SizedBox(height: 20),

          // Tiles
          Column(
            children: const [
              TileRow(
                tiles: [
                  HomePageRecentTile(
                    imagePath: 'assets/images/emlBB.jpeg',
                    title: 'East Mpaka London',
                  ),
                  HomePageRecentTile(
                    imagePath: 'assets/images/wakadinaliVom.jpeg',
                    title: 'Victims of Madness',
                  ),
                ],
              ),
              SizedBox(height: 10),
              TileRow(
                tiles: [
                  HomePageRecentTile(
                    imagePath: 'assets/images/lilmama.jpg',
                    title: 'Lil Mama',
                  ),
                  HomePageRecentTile(
                    imagePath: 'assets/images/khalidFs.png',
                    title: 'Free Spirit',
                  ),
                ],
              ),
              SizedBox(height: 10),
              TileRow(
                tiles: [
                  HomePageRecentTile(
                    imagePath: 'assets/images/protojeSLT.jpg',
                    title: 'Search of Lost Time',
                  ),
                  HomePageRecentTile(
                    imagePath: 'assets/images/zoza.jpg',
                    title: 'Zoza',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Jump Back In Section
          const SectionTitle(text: 'Jump back in'),
          const SizedBox(height: 20),
          HorizontalScrollSection(
            items: const [
              HomeBigTile(
                imagePath: 'assets/images/kendrickMBS.jpeg',
                title: 'Mr. Morale and the Big Steppers',
              ),
              HomeBigTile(
                imagePath: 'assets/images/protojeSLT.jpg',
                title: 'Search of Lost Time',
              ),
              HomeBigTile(
                imagePath: 'assets/images/savagelevel.jpg',
                title: 'Savage Level',
              ),
              HomeBigTile(
                imagePath: 'assets/images/kendrickDamn.jpeg',
                title: 'Damn',
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Made for You Section
          const SectionTitle(text: 'Made for you'),
          const SizedBox(height: 20),
          HorizontalScrollSection(
            items: const [
              HomeBigTile(
                imagePath: 'assets/images/khalidFs.png',
                title: 'Free Spirit',
              ),
              HomeBigTile(
                imagePath: 'assets/images/kendrickDamn.jpeg',
                title: 'Damn',
              ),
              HomeBigTile(
                imagePath: 'assets/images/jcoleFHD.jpg',
                title: 'Forest Hill Drive',
              ),
              HomeBigTile(
                imagePath: 'assets/images/wakadinaliVom.jpeg',
                title: 'Wakadinali\'s Victims of Madness',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Capsule extends StatelessWidget {
  final String text;

  const Capsule({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[800],
      ),
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: mediumTitle,
    );
  }
}

class HorizontalScrollSection extends StatelessWidget {
  final List<Widget> items;

  const HorizontalScrollSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items
            .map((item) => Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: item,
                ))
            .toList(),
      ),
    );
  }
}

class TileRow extends StatelessWidget {
  final List<Widget> tiles;

  const TileRow({super.key, required this.tiles});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: tiles,
    );
  }
}
