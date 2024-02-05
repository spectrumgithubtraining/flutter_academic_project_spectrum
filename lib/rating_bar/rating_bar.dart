import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarSample extends StatefulWidget {
  const RatingBarSample({super.key});

  @override
  State<RatingBarSample> createState() => _RatingBarSampleState();
}

class _RatingBarSampleState extends State<RatingBarSample> {
  double _userRating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RatingBar(
                initialRating: _userRating,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ratingWidget: RatingWidget(
                  full: Image.asset('assets/images/heart.png'),
                  half: Image.asset('assets/images/heart_half.png'),
                  empty: Image.asset('assets/images/heart_border.png'),
                ),
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                onRatingUpdate: (rating) {
                  setState(() {
                    _userRating = rating;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text("User rating : $_userRating")
            ]),
      ),
    );
  }
}
