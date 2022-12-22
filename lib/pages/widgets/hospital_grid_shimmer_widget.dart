import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HospitalGridShimmerWidget extends StatefulWidget {
  const HospitalGridShimmerWidget({Key? key}) : super(key: key);

  @override
  _HospitalGridShimmerWidget createState() => _HospitalGridShimmerWidget();
}

class _HospitalGridShimmerWidget extends State<HospitalGridShimmerWidget> {
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 140,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        color: Color(0xFFaaaaaa),
                      ),
                    ),

                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 140,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        color: Color(0xFFaaaaaa),
                      ),
                    ),

                    SizedBox(
                      height: 8,
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