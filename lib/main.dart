import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planet/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  double _progress = 0.35;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Planet images
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PageView(
                  controller: _pageController,
                  children: [
                    // Earth image
                    Container(
                      height: 500,
                      width: 300,
                      child: Image.network(
                        "https://infoworldmaps.com/wp-content/uploads/3d-earth-Basic-_1_-1.webp",
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Mars image
                    Container(
                      height: 500,
                      width: 300,
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/0/02/OSIRIS_Mars_true_color.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Mercury image
                    Container(
                      height: 500,
                      width: 300,
                      child: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/6/60/ESO_-_Milky_Way.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Title text
            Text(
              "النظام \nالشمسي",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700,
                fontSize: 45,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            // Subtitle text
            Text(
              "النظام الشمسي هو مجموعة من الأجرام السماوية التي تدور حول الشمس بفعل جاذبيتها.\n\n"
              "يتكون من ثمانية كواكب رئيسية، وهي: عطارد، الزهرة، الأرض، المريخ، المشتري، زحل، أورانوس، ونبتون.\n\n"
              "بالإضافة إلى الكواكب، يضم النظام الشمسي مجموعة من الأجرام الصغيرة مثل الكويكبات، والمذنبات، والنيازك، والأقمار التي تدور حول الكواكب.",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            // Button with progress indicator
            Container(
              width: 100,
              height: 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 6,
                    color: Colors.blue,
                    value: _progress >= 1 ? 1 : _progress,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _progress += 0.33;
                        if (_progress >= 1) _progress = 0; // Reset at 1
                      });

                      if (_pageController.hasClients) {
                        int nextPage = _pageController.page!.toInt() + 1;
                        if (nextPage < 3) {
                          _pageController.animateToPage(
                            nextPage,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInCubic,
                          );
                        } else {
                          // Navigate to the next screen on the last page
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => HomePage()),
                            (route) => false,
                          );
                        }
                      }
                    },
                    child: Container(
                      width: 75,
                      height: 75,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// NextScreen widget to navigate to

    