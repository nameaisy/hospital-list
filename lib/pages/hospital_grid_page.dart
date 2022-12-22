import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitallist/pages/widgets/hospital_grid_shimmer_widget.dart';

import '../blocs/hospital_list_bloc.dart';
import '../models/hospital_list_model.dart';
import 'hospital_detail_page.dart';
import 'hospital_main_page.dart';

class HospitalGridPage extends StatefulWidget {
  @override
  _HospitalGridPage createState() => _HospitalGridPage();
}

class _HospitalGridPage extends State<HospitalGridPage> {
  final HospitalListBloc _hospitalListBloc = HospitalListBloc();

  @override
  void initState() {
    _hospitalListBloc.add(GetCovidList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Image.asset('assets/list.png', height: 20,
                width: 20),
            onPressed: ()
            => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => HospitalMainPage()))
        ),
        title: Text(
          "TERAMEDIK",
          style: TextStyle(
            fontFamily: 'Gilroy', fontSize: 20, color: Colors.black,
          ),
        ),
      ),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    int _shimmerLength = 4;
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _hospitalListBloc,
        child: BlocListener<HospitalListBloc, HospitalListState>(
          listener: (context, state) {
            if (state is HospitalListError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<HospitalListBloc, HospitalListState>(
            builder: (context, state) {
              if (state is HospitalListInitial) {
                return _buildLoading();
              } else if (state is HospitalListLoading) {
                List<Widget> __letterRows = [];
                for (var i = 0; i < _shimmerLength; ++i) {
                  __letterRows.add(HospitalGridShimmerWidget());
                }
                return Column(
                  children: __letterRows,
                );
              } else if (state is HospitalListLoaded) {
                return _buildCard(context, state.hospitalListModel);
              } else if (state is HospitalListError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context,List<HospitalListModel> model) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Column(children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  HospitalDetailPage(
                    title: model[index].title,
                    content: model[index].content,
                    image: model[index].image,
                    phone: model[index].phone,
                    coordinates: model[index].coordinates,
                    website: model[index].website)
                ),
              );

            },
            child: Container(
              width: 340,
              height: 174,
              child: Card(
                margin: EdgeInsets.all(10),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff000000),
                    image: DecorationImage(
                      colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                      image: NetworkImage(model[index].image,),
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Column(children:[
                        Container(
                          margin: EdgeInsets.only(
                            left: 8
                          ),
                            alignment: Alignment.topLeft,
                            child: Text("${model[index].title}", style: GoogleFonts.roboto(
                              textStyle: TextStyle(color: Colors.white, letterSpacing: .5, fontWeight: FontWeight.w600),
                            ),),),

                      ])
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]);

      },
      itemCount: model.length,
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}