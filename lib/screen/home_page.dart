import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.blue,),
      body: DraggableScrollableSheet(
    maxChildSize: 0.91,
    minChildSize: 0.36,
    initialChildSize: 0.36,
    snapSizes: const [0.4, 0.9],
   // expand: false,
   snap: true,
        builder: (BuildContext context, ScrollController scrollController) {
      return Container(padding: EdgeInsets.only(left: 50),
        color: Colors.amberAccent,
        child: ListView.builder(
         controller: scrollController,
          itemCount: 120,
          itemBuilder: (context, index) {

            return Text(
              "$index",
            );
          },
        ),
      );
    }));
  }
}
