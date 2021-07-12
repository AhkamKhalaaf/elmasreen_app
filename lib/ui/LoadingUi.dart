import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: SpinKitFadingCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            );
          },

      ),
    );
  }
}
