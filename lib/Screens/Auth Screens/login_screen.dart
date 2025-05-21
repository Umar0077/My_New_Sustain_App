import 'package:al_mehdi_online_school/Screens/AdminDashboard/admin_home_screen.dart';
import 'package:al_mehdi_online_school/Screens/Auth%20Screens/admin_login_screen.dart';
import 'package:al_mehdi_online_school/Screens/Auth%20Screens/forgot_password.dart';
import 'package:al_mehdi_online_school/Screens/Auth%20Screens/register_screen.dart';
import 'package:al_mehdi_online_school/Screens/Home_Screens/Home_screen.dart';
import 'package:al_mehdi_online_school/components/Custom_Textfield.dart';
import 'package:al_mehdi_online_school/components/Custom_button.dart';
import 'package:al_mehdi_online_school/components/Social_Login_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _navigateToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }
  void _navigateToForgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgotPassword()),
    );
  }

  void _goToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
  void _goToAdminScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AdminLoginScreen()),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to adjust screen size dynamically
    double screenWidth = MediaQuery.of(context).size.width;
    double textScale = screenWidth > 600 ? 1.2 : 1.0;  // Larger text scale for bigger screens

    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),  // Dynamic padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            // Adjust text size for different screen widths
            Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 50 * textScale,  // Text size adjusts based on screen width
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            CustomTextfield(labelText: 'Email'),
            const SizedBox(height: 20),
            CustomTextfield(labelText: 'Password'),
            const SizedBox(height: 10),
            
            const SizedBox(height: 30),
            CustomButton(
              text: 'Login', 
              onPressed: _goToHomeScreen
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 600,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: _navigateToForgotPassword,
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color:Color(0xff02D185)),
                      ),
                    ),
                    
                    
                    const SizedBox(width: 2),
                    TextButton(
                      onPressed: _navigateToRegister,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color:Color(0xff02D185)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              '------------------------------------------OR------------------------------------------',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            // Google Login Container
            SocialLoginButton(
              imagePath: 'assets/logo/Google.png', 
              labelText: 'Continue with Google', 
              imagePadding: const EdgeInsets.only(left: 15), 
              onPressed: (){}),
            const SizedBox(height: 10),
            // Apple Login Container
            SocialLoginButton(
              imagePath: 'assets/logo/apple.png', 
              labelText: 'Continue with Apple', 
              imagePadding: const EdgeInsets.only(left: 10), 
              onPressed: (){}),
            const SizedBox(height: 10),
            // Facebook Login Container
            SocialLoginButton(
              imagePath: 'assets/logo/facebook.png', 
              labelText: 'Continue with Facebook', 
              imagePadding: const EdgeInsets.only(left: 35), 
              onPressed: (){}),
          TextButton(
                      onPressed: _goToAdminScreen,
                      child: const Text(
                        'Login as a Admin',
                        style: TextStyle(color:Color(0xff02D185)),
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}
