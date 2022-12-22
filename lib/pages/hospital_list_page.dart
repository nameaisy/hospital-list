import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitallist/pages/widgets/hospital_list_shimmer_widget.dart';
import '../blocs/hospital_list_bloc.dart';
import '../models/hospital_list_model.dart';
import 'hospital_detail_page.dart';

class HospitalListPage extends StatefulWidget {
  @override
  _HospitalListPage createState() => _HospitalListPage();
}

class _HospitalListPage extends State<HospitalListPage> {
  final HospitalListBloc _hospitalListBloc = HospitalListBloc();
  int _shimmerLength = 4;

  @override
  void initState() {
    _hospitalListBloc.add(GetCovidList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
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
                  __letterRows.add(HospitalListShimmerWidget());
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
    return ListView.builder(
      itemCount: model.length,
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
              width: 380,
              height: 170,
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
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.only(
                            left: 8
                        ),
                        alignment: Alignment.topLeft,
                        child: Text("${model[index].title}", style: GoogleFonts.roboto(
                          textStyle: TextStyle(color: Colors.white, letterSpacing: .5, fontWeight: FontWeight.w600),
                        ),),),
                      SizedBox(height: 50,),
                      Container(
                        margin: EdgeInsets.only(
                            left: 8
                        ),
                        alignment: Alignment.bottomRight,
                        child:  Icon(Icons.arrow_right_rounded, color: Colors.white, size: 60,),)

                    ],
                  ),
                ),
              ),
            ),
          ),
        ]);

      },
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}