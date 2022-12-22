import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'hospital_grid_page.dart';
import 'hospital_list_page.dart';

class HospitalMainPage extends StatefulWidget {
  @override
  _HospitalMainPage createState() => _HospitalMainPage();
}

class _HospitalMainPage extends State<HospitalMainPage> {

  @override
  Widget build(BuildContext context) {
    int _index = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Image.asset('assets/squares.png', height: 20,
          width: 20),
        onPressed: ()
        => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HospitalGridPage()))
      ),
      title: Text(
        "TERAMEDIK",
        style: GoogleFonts.roboto(
          textStyle: TextStyle(color: Colors.black, letterSpacing: .5, fontWeight: FontWeight.w700,),
        ),
      ),
    ),
      body: CupertinoPageScaffold(
          child: HospitalListPage()),
    );
  }
}