import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passageiro/design_system/colors.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({
    Key? key,
    required this.onRead,
    required this.text,
    this.borderColor = colorAccent,
    this.cameraKey,
  }) : super(key: key);

  final void Function(String? qr) onRead;
  final String text;
  final Color borderColor;
  final QrCameraState? cameraKey;

  @override
  _QrScannerScreenState createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  bool captured = false;
  @override
  Widget build(BuildContext context) {
    final Color opacityColor = Colors.black;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomSheet: Container(
        height: 68,
        color: widget.borderColor,
        child: Center(
          child: Text(
            widget.text,
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: QrCamera(
              qrCodeCallback: (value) {
                if (captured) return;
                captured = true;
                widget.onRead(value);
              },
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
            child: ClipPath(
              clipper: CustomClipperQr(),
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  color: opacityColor,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.32,
            left: size.width * 0.175,
            child: CustomPaint(
              painter: CustomPainterQr(),
              child: SizedBox(
                width: size.width - 2 * size.width * 0.175,
                height: size.width - 2 * size.width * 0.175,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.32 - 74,
            right: 0,
            left: 0,
            child: Text(
              widget.text,
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPainterQr extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()
      ..color = colorAccent
      ..strokeWidth = 14;
    double lenght = size.width * 0.21;
    //left top
    canvas.drawLine(const Offset(-7, 0), Offset(lenght + 7, 0), _paint);
    canvas.drawLine(const Offset(0, 0), Offset(0, lenght), _paint);

    //right top
    canvas.drawLine(
        Offset(size.width + 7, 0), Offset(size.width - lenght - 7, 0), _paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, lenght), _paint);

//right bottowm
    canvas.drawLine(Offset(size.width + 7, size.width),
        Offset(size.width - lenght - 7, size.width), _paint);
    canvas.drawLine(Offset(size.width, size.width),
        Offset(size.width, size.width - lenght), _paint);

    //right bottowm
    canvas.drawLine(
        Offset(-7, size.width), Offset(lenght + 7, size.width), _paint);
    canvas.drawLine(
        Offset(0, size.width), Offset(0, size.width - lenght), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CustomClipperQr extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double lenght = size.width - 2 * size.width * 0.175;
    double initialX = size.width * 0.175;
    double initialY = size.height * 0.32;
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..moveTo(initialX, initialY)
      ..lineTo(initialX + lenght, initialY)
      ..lineTo(initialX + lenght, initialY + lenght)
      ..lineTo(initialX, initialY + lenght);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
