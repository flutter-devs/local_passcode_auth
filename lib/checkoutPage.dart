import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:local_passcode_auth/baseView.dart';
import 'sharedPrefs.dart';
import 'homePage.dart';

// ignore: must_be_immutable
class CheckoutPage extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<SharedPrefs>(
      onModelReady: (model) {
        model.setPassCode(1234);
        model.getPassCode();
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (model.passCode.toString() ==
                              textEditingController.text) {
                            Navigator.pop(context);
                            Navigator.of(context).push(PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, anotherAnimation) {
                                  return HomePage();
                                },
                                transitionDuration: Duration(milliseconds: 600),
                                transitionsBuilder: (context, animation,
                                    anotherAnimation, child) {
                                  animation = CurvedAnimation(
                                      curve: Curves.easeIn, parent: animation);
                                  return SlideTransition(
                                    position: Tween(
                                            begin: Offset(-1.0, 0.0),
                                            end: Offset(0.0, 0.0))
                                        .animate(animation),
                                    child: ScaleTransition(
                                      scale: animation,
                                      child: child,
                                    ),
                                  );
                                }));
                          } else
                            print("failed");

                          print("************+++" + model.passCode.toString());
                        },
                        icon: Icon(Icons.forward),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelText: "Enter PIN",
                    ),
                    obscureText: true,
                    autofocus: true,
                    cursorColor: Colors.grey,
                    keyboardAppearance: Brightness.dark,
                    keyboardType: TextInputType.number,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
