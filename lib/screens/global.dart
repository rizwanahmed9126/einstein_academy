import 'package:flutter/material.dart';

// study-notes
// study-material
// past-paper



Future<void> showLoadingAnimation(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    barrierColor: Colors.transparent,
    builder: (context) {
      return Center(child: CircularProgressIndicator());
    },
  );
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}


