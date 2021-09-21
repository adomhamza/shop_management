// import 'dart:ui' as ui;

// import 'dart:ui';

// //Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(WIDTH, (WIDTH*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter: RPSCustomPainter(),
// )

// //Copy this CustomPainter code to the Bottom of the File
// class RPSCustomPainter extends CustomPainter {
//     @override
//     void paint(Canvas canvas, Size size) {
            
// Path path_0 = Path();
//     path_0.moveTo(size.width*0.4666658,0);
//     path_0.cubicTo(size.width*0.2093363,0,0,size.height*0.2093363,0,size.height*0.4666658);
//     path_0.cubicTo(0,size.height*0.7239974,size.width*0.2093363,size.height*0.9333342,size.width*0.4666658,size.height*0.9333342);
//     path_0.cubicTo(size.width*0.7239974,size.height*0.9333342,size.width*0.9333342,size.height*0.7239974,size.width*0.9333342,size.height*0.4666658);
//     path_0.cubicTo(size.width*0.9333342,size.height*0.2093363,size.width*0.7239974,0,size.width*0.4666658,0);
//     path_0.close();

// Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
// paint_0_fill.color = Color(0xff2196F3).withOpacity(1.0);
// canvas.drawPath(path_0,paint_0_fill);

// Path path_1 = Path();
//     path_1.moveTo(size.width*0.6791632,size.height*0.5020763);
//     path_1.lineTo(size.width*0.5020763,size.height*0.5020763);
//     path_1.lineTo(size.width*0.5020763,size.height*0.6791632);
//     path_1.cubicTo(size.width*0.5020763,size.height*0.7021658,size.width*0.4834158,size.height*0.7208263,size.width*0.4604132,size.height*0.7208263);
//     path_1.cubicTo(size.width*0.4374105,size.height*0.7208263,size.width*0.4187500,size.height*0.7021658,size.width*0.4187500,size.height*0.6791632);
//     path_1.lineTo(size.width*0.4187500,size.height*0.5020763);
//     path_1.lineTo(size.width*0.2416634,size.height*0.5020763);
//     path_1.cubicTo(size.width*0.2186608,size.height*0.5020763,size.width*0.1999995,size.height*0.4834158,size.width*0.1999995,size.height*0.4604132);
//     path_1.cubicTo(size.width*0.1999995,size.height*0.4374105,size.width*0.2186608,size.height*0.4187500,size.width*0.2416634,size.height*0.4187500);
//     path_1.lineTo(size.width*0.4187500,size.height*0.4187500);
//     path_1.lineTo(size.width*0.4187500,size.height*0.2416634);
//     path_1.cubicTo(size.width*0.4187500,size.height*0.2186608,size.width*0.4374105,size.height*0.1999995,size.width*0.4604132,size.height*0.1999995);
//     path_1.cubicTo(size.width*0.4834158,size.height*0.1999995,size.width*0.5020763,size.height*0.2186608,size.width*0.5020763,size.height*0.2416634);
//     path_1.lineTo(size.width*0.5020763,size.height*0.4187500);
//     path_1.lineTo(size.width*0.6791632,size.height*0.4187500);
//     path_1.cubicTo(size.width*0.7021658,size.height*0.4187500,size.width*0.7208263,size.height*0.4374105,size.width*0.7208263,size.height*0.4604132);
//     path_1.cubicTo(size.width*0.7208263,size.height*0.4834158,size.width*0.7021658,size.height*0.5020763,size.width*0.6791632,size.height*0.5020763);
//     path_1.close();

// Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
// paint_1_fill.color = Colors.white.withOpacity(1.0);
// canvas.drawPath(path_1,paint_1_fill);

// }

// @override
// bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
// }
// }