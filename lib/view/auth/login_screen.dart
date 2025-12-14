import 'package:counter_app/component/loading_overlay.dart';
import 'package:counter_app/viewmodel/auth_viewmodel.dart';
import 'package:counter_app/widgets/shared/custom_button.dart';
import 'package:counter_app/widgets/shared/custom_textfield.dart';
import 'package:counter_app/widgets/shared/error_banner.dart'; // ✅ یہ import شامل کریں
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Test credentials (remove in production)
    _emailController.text = "devsinntechnologies@gmail.com";
    _passwordController.text = "Devsinn@123";
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: LoadingOverlay(
        isLoading: authViewModel.isLoading,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1,
              vertical: size.height * 0.1,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.1),
                  Text(
                    'Welcome Back',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Login to your account',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: size.height * 0.05),
                  
                  // Error Banner - اب error نہیں آئے گا
                  if (authViewModel.error != null)
                    ErrorBanner(
                      message: authViewModel.error!,
                      onClose: () => authViewModel.clearError(),
                    ),
                  
                  // Email Field
                  CustomTextField(
                    controller: _emailController,
                    label: 'Email',
                    hint: 'Enter your email',
                    prefixIcon: Icons.email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      if (!value.contains('@')) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  
                  // Password Field
                  CustomTextField(
                    controller: _passwordController,
                    label: 'Password',
                    hint: 'Enter your password',
                    prefixIcon: Icons.lock,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  
                  // Login Button
                  CustomButton(
                    text: 'Login',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final success = await authViewModel.login(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                        );
                        
                        if (success && context.mounted) {
                          // Navigate to home screen
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      }
                    },
                  ),
                  
                  SizedBox(height: size.height * 0.02),
                  
                  // Register Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text('Register'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}