import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page1.dart';
import 'page0.dart';
import 'page2.dart';
import 'page3.dart';
import 'page4.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  int _tabs = 0;
  final TextEditingController _searchController =
      TextEditingController(); // Controller for search

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 900,
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  // Header with Profile & Title and Drawer icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                      ),
                      Text(
                        "النظام الشمسي",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 35,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Scaffold.of(context)
                              .openDrawer(); // Open drawer when clicked
                        },
                        icon: Icon(Icons.menu, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 1),
                  // Tabs for content categories
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        _buildTab("الجميع", 0),
                        SizedBox(width: 10),
                        _buildTab("الكواكب", 1),
                        SizedBox(width: 10),
                        _buildTab("المذنبات", 2),
                        SizedBox(width: 10),
                        _buildTab("الشمس", 3),
                        SizedBox(width: 10),
                        _buildTab("الكويكبات", 4),
                      ],
                    ),
                  ),
                  SizedBox(height: 1),
                  // Content Rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildContentItem(
                        "مارس",
                        "https://space-facts.com/wp-content/uploads/mars.jpg",
                        "270 مشاهدة",
                      ),
                      _buildContentItem(
                        " المشتري",
                        "https://upload.wikimedia.org/wikipedia/commons/e/e2/Jupiter.jpg",
                        "200 مشاهدة",
                      ),
                    ],
                  ),
                  SizedBox(height: 1),
                  // Solar System Image Section
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/c/c3/Solar_sys8.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 10),
                            Text(
                              "NASA \nOUT in space",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25),
                            ),
                            SizedBox(width: 100),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.visibility,
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "6746 مشاهدة",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white.withOpacity(0.6)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                  SizedBox(height: 1),
                  // Additional Row with Mars and Jupiter
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildContentItem(
                        "الزئبق",
                        "https://upload.wikimedia.org/wikipedia/commons/4/4a/Mercury_in_true_color.jpg",
                        "270 مشاهدة",
                      ),
                      _buildContentItem(
                        "زحل",
                        "https://upload.wikimedia.org/wikipedia/commons/9/9a/Saturn_Earth_Comparison.png",
                        "200 مشاهدة",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // Search Page
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Search",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 35,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _searchController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.black,
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Menu',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text('Home',
                  style: GoogleFonts.montserrat(color: Colors.white)),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.search, color: Colors.white),
              title: Text('Search',
                  style: GoogleFonts.montserrat(color: Colors.white)),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            // Add more options if needed
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey.shade400.withOpacity(0.5),
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Search",
          ),
        ],
      ),
      body: pages.elementAt(_currentIndex),
    );
  }

  // Function to build tabs for categories
  Widget _buildTab(String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _tabs = index;
        });

        // Navigate to page1.dart if the "Planets" tab is selected (index 1)
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Page0()),
          );
        }
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Page1()),
          );
        }
        if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Page2()),
          );
        }
        if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Page3()),
          );
        }
        if (index == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Page4()),
          );
        }
      },
      child: Container(
        height: 40,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(50),
          color: _tabs == index ? Colors.white : Colors.black,
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.montserrat(
              color: _tabs == index ? Colors.black : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  // Function to build content items with image, title, and views
  Widget _buildContentItem(String title, String imageUrl, String views) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.2,
      height: 200,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 100,
              height: 100,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(child: Text("Image not found"));
                },
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.2,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1.5,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.visibility,
                          color: Colors.white.withOpacity(0.3),
                        ),
                        SizedBox(width: 5),
                        Text(
                          views,
                          style: GoogleFonts.montserrat(
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
