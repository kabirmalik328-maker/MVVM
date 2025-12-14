
// import 'package:counter_app/view/auth/login_screen.dart';
// import 'package:counter_app/view/home/counter_screen.dart';
// import 'package:counter_app/viewmodel/auth_viewmodel.dart';
// import 'package:counter_app/viewmodel/counter_viewmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => AuthViewModel()),
//         ChangeNotifierProvider(create: (_) => CounterViewModel()),
//       ],
//       child: Consumer<CounterViewModel>(
//         builder: (context, counterViewModel, _) {
//           return MaterialApp(
//             title: 'Counter MVVM',
//             debugShowCheckedModeBanner: false,
//             theme: AppTheme.lightTheme,
//             darkTheme: AppTheme.darkTheme,
//             themeMode: counterViewModel.isDarkMode 
//                 ? ThemeMode.dark 
//                 : ThemeMode.light,
//             home: const LoginScreen(),
//             routes: {
//               '/home': (context) => const CounterScreen(),
//               '/login': (context) => const LoginScreen(),
//               '/register': (context) => const RegisterScreen(), // اگر آپ کے پاس ہے
//             },
//           );
//         },
//       ),
//     );
//   }
// }