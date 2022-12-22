import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:iconsax/iconsax.dart';

import '../blocs/hospital_list_bloc.dart';
import '../models/hospital_list_model.dart';

class HospitalDetailPage extends StatefulWidget {
  final String title;
  final String content;
  final String image;
  final String phone;
  final String coordinates;
  final String website;
  HospitalDetailPage({
    Key? key,
    required this.title,
    required this.content,
    required this.image,
    required this.phone,
    required this.coordinates,
    required this.website,
  }) : super(key: key);
  @override
  _HospitalDetailPage createState() => _HospitalDetailPage();
}

class _HospitalDetailPage extends State<HospitalDetailPage> {
  final HospitalListBloc _hospitalListBloc = HospitalListBloc();

  @override
  void initState() {
    _hospitalListBloc.add(GetCovidList());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCard(),
    );
  }

  Widget _buildCard() {
    return Scaffold(
        body: DefaultTabController(
          length: 2,
          child:

          NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.black,
                  expandedHeight: 300.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title:Text("${widget.title}", style: GoogleFonts.roboto(
                        textStyle: TextStyle(color: Colors.white, fontSize: 16, letterSpacing: .5, fontWeight: FontWeight.w500),
                      ),),
                      background: Image.network(
                        widget.image,
                        fit: BoxFit.fill,
                      ),),
                ),
              ];
            },
            body:Column(
              children: [
                SizedBox(height: 7,),
                Column(children:[
                  Center(

                      child: Container(
                        margin: EdgeInsets.only(
                          left: 10,
                          bottom: 5,
                          top: 5,
                        ),
                        child: Row(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox.fromSize(
                              size: Size(56, 56), // button width and height
                              child: ClipOval(
                                child: Material(
                                  color: Colors.white, // button color
                                  child: InkWell(
                                    splashColor: Colors.green, // splash color
                                    onTap: _launchMap, // button pressed
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Iconsax.map), // icon
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox.fromSize(
                              size: Size(56, 56), // button width and height
                              child: ClipOval(
                                child: Material(
                                  color: Colors.white, // button color
                                  child: InkWell(
                                    splashColor: Colors.green, // splash color
                                    onTap: _launchPhoneDialer, // button pressed
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Iconsax.call), // icon
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox.fromSize(
                              size: Size(56, 56), // button width and height
                              child: ClipOval(
                                child: Material(
                                  color: Colors.white, // button color
                                  child: InkWell(
                                    splashColor: Colors.green, // splash color
                                    onTap: _launchWebsite, // button pressed
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Iconsax.book),  // icon
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )

                  ),
                  Container(
                    //height: 300,
                    margin: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text("${widget.content}", style: GoogleFonts.roboto(
                        textStyle: TextStyle(color: Colors.black, letterSpacing: .2, fontWeight: FontWeight.w400),
                      ),),
                    ),
                  )
                ])
              ],
            ),
              ),
            ));


  }
  Future<void> _launchMap() async {
    final url = widget.coordinates;
    var uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch';
    }
  }
  Future<void> _launchWebsite() async {
    final url = widget.website;
    var uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch';
    }
  }
  Future<void> _launchPhoneDialer() async {
    final url = widget.phone;
    var uri = Uri.parse('tel:${url}');
    if (!await launchUrl(uri)) {
      throw 'Could not launch';
    }
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}