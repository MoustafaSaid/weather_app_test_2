//
// import 'package:flutter/material.dart';
//
//
// class Score{
//   double? value;
//   DateTime? time;
//
//   Score({
//     this.value,
//     this.time,
//   });
// }
//
//
// class ProgressChart extends StatelessWidget {
//   final List<Score> scores;
//
//   const ProgressChart({Key? key, required this.scores}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double? min,max;
//
//     return Container(
//       child: CustomPaint(
//         child: Container(),
//         painter: ChartOainter(),
//       ),
//
//     );
//   }
// }
//
// class ChartOainter extends CustomPainter{
//   @override
//   void paint(Canvas canvas, Size size) {
//     final c=Offset(size.width/2, size.height/2);
//     final r=50.0;
//     final paint=Paint()..color=Colors.black;
//     canvas.drawCircle(c, r, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     throw UnimplementedError();
//   }
// }
//
// /* home screen
// final rng=Randum(;
// const daycount=7;
// list<Scores=_score
// double min,max
//
// init state
// final cores=List<Score>.genetrate[daycount,{index}]{
// final y=rang.nextDouble(}%30;
// final d=DateTime.now.add(Duration(days:daycount/inedx;
// return Score(y,d
// setstate
// _Scores=Scores;
//  */