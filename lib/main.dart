import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/di/di.dart';
import 'package:test_app/features/product_list/ui/bloc/bloc.dart';

import 'features/product_list/ui/page/product_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intiGetIt();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AllProductsCubit>(
          create: (context) => di.get<AllProductsCubit>(),
        ),
      ],
      child: const MaterialApp(
        home: ProductListPage(),
      ),
    );
  }
}
