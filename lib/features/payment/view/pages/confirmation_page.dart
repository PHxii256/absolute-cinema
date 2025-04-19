import 'package:animated_checkmark/animated_checkmark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application/features/home/view/pages/my_home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentConfirmation extends ConsumerStatefulWidget {
  const PaymentConfirmation({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentConfirmationState();
}

class _PaymentConfirmationState extends ConsumerState<PaymentConfirmation> {
  bool checked = false;

  Future<void> startAnim() async {
    await Future.delayed(Duration(milliseconds: 250)).then(
      (_) => setState(() {
        checked = true;
      }),
    );
  }

  @override
  void initState() {
    startAnim();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text("Thank You!"),
        leading: BackButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil<void>(
              context,
              MaterialPageRoute<void>(builder: (BuildContext context) => const MyHomePage(title: 'Absolute Cinema')),
              ModalRoute.withName('/home'),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Animate(
                  autoPlay: true,
                  target: checked ? 1 : 0,
                  child: Container(
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(26, 215, 187, 222)),
                    child: Container(),
                  ),
                ).scale(
                  duration: Duration(milliseconds: 400),
                  begin: Offset(0, 0),
                  end: Offset(1.2, 1.2),
                  curve: Curves.elasticInOut,
                ),
                Animate(
                  autoPlay: true,
                  target: checked ? 1 : 0,
                  child: Container(
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(40, 215, 187, 222)),
                    child: Container(),
                  ),
                ).scale(duration: Duration(milliseconds: 400), begin: Offset(0.8, 0.8), curve: Curves.elasticInOut),
                Checkmark(
                  checked: checked,
                  duration: Duration(milliseconds: 300),
                  indeterminate: false,
                  weight: 20,
                  size: 122,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Animate(
                      autoPlay: true,
                      target: checked ? 1 : 0,
                      child: Container(
                        width: 190,
                        height: 190,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Color.fromARGB(97, 208, 0, 255)),
                        child: Container(),
                      ),
                    )
                    .scale(
                      duration: Duration(milliseconds: 1000),
                      begin: Offset(0.8, 0.8),
                      end: Offset(2, 2),
                      curve: Curves.elasticInOut,
                    )
                    .fadeIn(duration: Duration(milliseconds: 800))
                    .fadeOut(begin: 0.5, duration: Duration(milliseconds: 1000), curve: Curves.decelerate),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "Successfuly Booked Tickets! You can now find them in the tickets tab =)",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
