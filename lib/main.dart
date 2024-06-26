import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_shop/firebase_options.dart';
import 'package:plant_shop/utils/routes/routes.dart';
import 'package:plant_shop/utils/routes/routes_name.dart';
import 'package:plant_shop/view_model/bloc/cart_items_bloc/cart_items_bloc/cart_items_bloc.dart';
import 'package:plant_shop/view_model/bloc/loadin_bloc/loading_bloc/loading_bloc.dart';

import 'utils/constant/image_picker_utils/image_picker_utils.dart';
import 'view_model/bloc/image_bloc/image_bloc/image_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LoadingBloc()),
          BlocProvider(create: (_) => ImageBloc(ImagePickerUtils())),
          BlocProvider(create: (_) => CartItemsBloc()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // home: SplashView(),
          initialRoute: RoutesName.splashView,
          onGenerateRoute: Routes.generateRoute,
        )
    );
  }
}

