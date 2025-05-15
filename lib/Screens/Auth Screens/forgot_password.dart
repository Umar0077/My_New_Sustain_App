import 'package:al_mehdi_online_school/Screens/Auth%20Screens/Otp_verfication_Screen.dart';
import 'package:al_mehdi_online_school/Screens/Auth%20Screens/login_screen.dart';
import 'package:al_mehdi_online_school/components/Custom_Textfield.dart';
import 'package:al_mehdi_online_school/components/Custom_button.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();

}
  

class _ForgotPasswordState extends State<ForgotPassword> {

   void _goToOtpScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OtpVerficationScreen()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Text(
                'Forgot Password',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              const CustomTextfield(labelText: 'Email'),
              const SizedBox(height: 20),
              CustomButton(text: 'Send OTP Code',onPressed: _goToOtpScreen,),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Back to Login',
                  style: TextStyle(
                    color: Color(0xff02D185),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}