import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HospitalListShimmerWidget extends StatefulWidget {
  const HospitalListShimmerWidget({Key? key}) : super(key: key);

  @override
  _HospitalListShimmerWidget createState() => _HospitalListShimmerWidget();
}

class _HospitalListShimmerWidget extends State<HospitalListShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        top: 16,
        right: 22,
        bottom: 16,
        left: 22,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[200]!,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 110,
                      width: screen.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        color: Color(0xFFaaaaaa),
                      ),
                    ),

                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 11,
                      width: screen.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        color: Color(0xaaaaaaaa),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}