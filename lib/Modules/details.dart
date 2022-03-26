import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Extradetails
{
  Color primarycolor()
  {
    return const Color(0xFF0f0454);
  }
  Color secondarycolor()
  {
    return const Color(0xFFb53e02);
  }
  Color buttoncolor()
  {
    return const Color(0xFFD9D9D9);
  }
  double height(context)
  {
    MediaQueryData q=MediaQuery.of(context);
    return q.size.height;
  }
  double width(context)
  {
    MediaQueryData q=MediaQuery.of(context);
    return q.size.width;
  }
  TextStyle ptext(fsize)
  {
    return GoogleFonts.lora(fontSize: fsize);
  }
  TextStyle ptextcolor(fsize,color12)
  {
    return GoogleFonts.lora(fontSize: fsize,color: Color(color12));
  }
}