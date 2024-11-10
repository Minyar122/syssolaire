import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      appBar: AppBar(
        title: Text(
          'الكواكب',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image, Title, and Description Section
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Single Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/6/60/ESO_-_Planetary_System_Around_HD_69830_II_%28by%29.jpg',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width *
                          0.9, // Scales the image to 90% of the screen width
                      height: 250, // Fixed height
                    ),
                  ),
                  SizedBox(height: 10),
                  // Title
                  Text(
                    'الكواكب',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Description
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'إنّ عدد الكواكب في النظام الشمسيّ هي ثمانية كواكب، هي: عطارد، والزهرة، والأرض، والمريخ، والمشتري، وزحل، وأورانوس، ونبتون، وقد تمّ اكتشاف بلوتو في العام 1930م على أنّه كوكب، إلّا أنّه وفي أواخر التسعينات صُنّف أنّه (كوكب قزم)، وما زال العلماء يبحثون عن كوكب تاسع حقيقي حتّى عثروا في العشرين من يناير عام 2016م على ما يسمّى بـ(الكوكب التاسع)، وهو يساوي عشرة أضعاف كتلة الأرض و5000 ضعف كتلة بلوتو\n*',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.7),
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
