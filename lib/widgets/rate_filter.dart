import 'package:einstien_academy_flutter/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RateFilter extends StatefulWidget {
  final String id;
  final String name;
  final String type;
  final String apiType;
  const RateFilter({Key? key,required this.id,required this.name,required this.type,required this.apiType}) : super(key: key);

  @override
  _RateFilterState createState() => _RateFilterState();
}

class _RateFilterState extends State<RateFilter> {
  // List<Map<String, dynamic>> rateList = [
  //   {"id": "1", "title": "David Richardson"},
  //   {"id": "2", "title": "Jhon Cena"},
  //   {"id": "3", "title": "Brock Lanzner"},
  // ];
  double rate=0.0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      content: Container(
        margin: EdgeInsets.only(top: 15.r),
        height: 160.h,
        width: 470.w,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Rate",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "${widget.name}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      height: 1.h),
                )
              ],
            ),
            Text(
              ' ${widget.type}',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
            ),
            SizedBox(
              height: 15.h,
            ),
            RatingBar.builder(
              itemSize: 30.h,
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding:
                  EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 5.0.h),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                size: 10,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                rate=rating;
                print(rating);
              },
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              width: 400.w,
              height: 40.h,
              child: ElevatedButton(
                onPressed: () {

                  Provider.of<AuthProvider>(context,listen: false).callRating("${widget.apiType}",rate.toString() , widget.id);
                  Navigator.pop(context);
                },
                child: Text(
                  "Done",
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
