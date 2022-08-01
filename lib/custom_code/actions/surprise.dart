// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'dart:math';

import 'package:confetti/confetti.dart';

Future<String> surprise(BuildContext context) async {
  await showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (context) {
      final controller = ConfettiController();
      final drawStar = (Size size) {
        //Method to convert degree to radians
        double degToRad(double deg) => deg * (pi / 180.0);

        const numberOfPoints = 5;
        final halfWidth = size.width / 2;
        final externalRadius = halfWidth;
        final internalRadius = halfWidth / 2.5;
        final degreesPerStep = degToRad(360 / numberOfPoints);
        final halfDegreesPerStep = degreesPerStep / 2;
        final path = Path();
        final fullAngle = degToRad(360);
        path.moveTo(size.width, halfWidth);

        for (double step = 0; step < fullAngle; step += degreesPerStep) {
          path.lineTo(halfWidth + externalRadius + cos(step),
              halfWidth + externalRadius + sin(step));
          path.lineTo(
              halfWidth + internalRadius + cos(step + halfDegreesPerStep),
              halfWidth + internalRadius + sin(step + halfDegreesPerStep));
        }
        path.close();
        return path;
      };
      Future.delayed(Duration(milliseconds: 0)).then((_) => controller.play());
      return AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Stack(
          children: <Widget>[
            //CENTER -- Blast
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: controller,
                blastDirectionality: BlastDirectionality
                    .explosive, // don't specify a direction, blast randomly
                shouldLoop:
                    false, // start again as soon as the animation is finished
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple
                ], //manually specify the colors to be used
                createParticlePath: drawStar, //define a custom shape/path.
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  controller.play();
                },
                child: Text(''),
              ),
            ),
          ],
        ),
      );
    },
  );
  return 'Congratulations!';
}
