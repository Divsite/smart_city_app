import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Notification
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // Favorite
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Profile
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Carousel
            CarouselSlider(
              items: [
                Container(
                  color: Colors.blue, 
                  child: const Center(child: Text("Carousel Item 1"))
                ),
                Container(
                  color: Colors.green, 
                  child: const Center(child: Text("Carousel Item 2"))
                ),
                Container(
                  color: Colors.red, 
                  child: const Center(child: Text("Carousel Item 3"))
                ),
              ],
              options: CarouselOptions(
                height: 150.0,
                autoPlay: true,
              ),
            ),
            const SizedBox(height: 20),

            // Shortcut Icons (2 rows, 2 items each)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildShortcutCard(FontAwesomeIcons.mosque, "Masjid"),
                      buildShortcutCard(FontAwesomeIcons.school, "Sekolah"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildShortcutCard(FontAwesomeIcons.store, "UMKM"),
                      buildShortcutCard(FontAwesomeIcons.hospital, "Rumah Sakit"),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Citizen Features (horizontal scroll)
            // ignore: sized_box_for_whitespace
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildFeatureIcon(FontAwesomeIcons.comment, "Kritik & Saran"),
                  buildFeatureIcon(FontAwesomeIcons.file, "Laporan"),
                  buildFeatureIcon(FontAwesomeIcons.moneyBill, "Iuran Warga"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Nearby Information Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Informasi Terdekat", style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 10),
                      const Text("Event di RT 04/RW 03, Kelurahan Jurang Mangu..."),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Training',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Transaction',
          ),
        ],
      ),
    );
  }

  // Helper method for shortcut cards
  Widget buildShortcutCard(IconData icon, String text) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: Icon(icon),
          title: Text(text),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            // 
          },
        ),
      ),
    );
  }

  // Helper method for feature icons
  Widget buildFeatureIcon(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
