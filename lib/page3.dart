import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      appBar: AppBar(
        title: Text(
          'الشمس',
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
                      'https://upload.wikimedia.org/wikipedia/commons/c/c3/Solar_sys8.jpg',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width *
                          0.9, // Scales the image to 90% of the screen width
                      height: 250, // Fixed height
                    ),
                  ),
                  SizedBox(height: 10),
                  // Title
                  Text(
                    'الشمس',
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
                      'الكويكبات هي أجسام صخرية صغيرة تدور حول الشمس وتشبه إلى حد بعيد الكواكب الصغيرة، لكنها أصغر بكثير. معظم الكويكبات توجد في حزام الكويكبات بين كوكبي المريخ والمشتري، ولكن يمكن العثور عليها في أماكن أخرى من النظام الشمسي أيضًا. الكويكبات تتراوح في الحجم من عدة أمتار إلى مئات الكيلومترات، وبعضها يشكل تهديدًا محتملاً للأرض إذا ما اقترب منها.',
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
