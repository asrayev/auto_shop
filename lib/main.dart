import 'package:auto_shop/data/api_service/api_service.dart';
import 'package:auto_shop/data/local_db/local_db.dart';
import 'package:auto_shop/data/repositories/my_repository.dart';
import 'package:auto_shop/ui/TestScreen.dart';
import 'package:auto_shop/view_model/Car_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
void main() {
  MyRepository myRepository = MyRepository(apiService: ApiService(), localDatabase: LocalDataBase());
  CarViewModel carViewModel  = CarViewModel(myRepository: myRepository);
  runApp(
   MultiProvider(

       providers: [
         ChangeNotifierProvider(create: (_)=> carViewModel)
   ],
   child: MyApp(),
   ),


  );
}
class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return ScreenUtilInit(
      designSize: const Size(423.5294,843.13727),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext contex, Widget? child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TestScreen(),
        );
      },
    );
  }
}