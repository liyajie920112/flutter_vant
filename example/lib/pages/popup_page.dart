import 'package:flutter/material.dart';
import 'package:flutter_vant/flutter_vant.dart';

class PopupPage extends StatelessWidget {
  const PopupPage({Key? key}) : super(key: key);

  void _show(BuildContext ctx) {
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.amber,
        context: ctx,
        builder: (ctx) => Container(
              width: 300,
              height: 250,
              color: Colors.white54,
              alignment: Alignment.center,
              child: Text('Breathe in... Breathe out...'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Button(
              text: 'show bottom sheet',
              type: ButtonType.primary,
              onClick: () {
                showModalBottomSheet(
                    elevation: 10,
                    backgroundColor: Colors.amber,
                    context: context,
                    builder: (ctx) => Container(
                          width: 300,
                          height: 250,
                          color: Colors.white54,
                          alignment: Alignment.center,
                          child: Text('Breathe in... Breathe out...'),
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
