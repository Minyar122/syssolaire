import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      appBar: AppBar(
        title: Text(
          'المذنبات',
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
                      'https://upload.wikimedia.org/wikipedia/commons/b/b7/Comet_Halley.jpg',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width *
                          0.9, // Scales the image to 90% of the screen width
                      height: 250, // Fixed height
                    ),
                  ),
                  SizedBox(height: 10),
                  // Title
                  Text(
                    'المذنبات',
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
                      'المذنبات هي أجسام صغيرة تشكلت من خليط من الجليد والغبار والمركبات العضوية، ولها شكل غير منتظم. تتميز المذنبات بمداراتها البيضاوية التي تأخذها بالقرب من الشمس، وتظهر بوضوح عندما تقترب الشمس منها. تتألف المذنبات من ثلاثة أجزاء رئيسية: النواة الصلبة، الغلاف الخارجي الذي يشبه السحابة الضبابية، والذيل الذي يمتد بعيدًا عن الشمس. يظهر الغلاف والذيل عندما يقترب المذنب من الشمس بسبب حرارة الشمس التي تسبب انبعاث الغازات والجزيئات.',
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
