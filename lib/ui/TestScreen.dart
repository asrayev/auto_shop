import 'package:auto_shop/view_model/Car_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Container(
           child: Column(
             children: [
               Container(width: double.infinity,
               height: 100,
               color: Colors.yellow,),
               Consumer<CarViewModel>(
                 builder: (context, carViewModel, child) {
                   return Center(
                     child: carViewModel.isLoading
                         ? const CircularProgressIndicator()
                         : (carViewModel.carData == null
                         ? const Text("Hozircha data juq")
                         : Column(
                       children: [
                         Text(carViewModel.carData!.data![0].carModel.toString()),
                       ],
                     )),
                   );
                 },
               )
             ],
           ),
         ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CarViewModel>().fetchAllCarInfo(0);
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}
