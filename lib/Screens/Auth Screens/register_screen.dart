import 'package:al_mehdi_online_school/Screens/Auth%20Screens/login_screen.dart';
import 'package:al_mehdi_online_school/Screens/Home_Screens/Home_screen.dart';
import 'package:al_mehdi_online_school/components/Custom_Textfield.dart';
import 'package:al_mehdi_online_school/components/Custom_button.dart';
import 'package:flutter/material.dart';



class MyDropdown extends StatefulWidget {
  const MyDropdown({super.key});

  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String? _selectedRole = "Role";  // Default value for the dropdown

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,  // Set fixed width for the dropdown
      padding: const EdgeInsets.symmetric(horizontal: 12.0),  // Horizontal padding
      decoration: BoxDecoration(
        color: Colors.white,  // Set background color to white (similar to textfields)
        borderRadius: BorderRadius.circular(12),  // Rounded corners
        border: Border.all(color: Colors.grey.shade300),  // Grey border for dropdown
      ),
      child: DropdownButton<String>(
        value: _selectedRole,
        onChanged: (String? newValue) {
          setState(() {
            _selectedRole = newValue;
          });
        },
        items: const [
          DropdownMenuItem<String>(
            value: "Role", 
            child: Text('Role'),
          ),
          DropdownMenuItem<String>(
            value: "Student", 
            child: Text('Student'),
          ),
          DropdownMenuItem<String>(
            value: "Teacher", 
            child: Text('Teacher'),
          ),
        ],
        isExpanded: true,  // Makes the dropdown take up full width
        dropdownColor: Colors.grey.shade200,  // Set background color for the dropdown
        style: const TextStyle(color: Colors.grey),  // Text color inside the dropdown
        borderRadius: BorderRadius.circular(12),  // Border radius for the dropdown button
      ),
    );
  }
}


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Registration logic can be added here if you want
  // Since no Firebase functionality, we will handle this part accordingly

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  void _goToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            const Text(
              'Create Account',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            CustomTextfield(labelText: 'Full Name'),
            const SizedBox(height: 20),
            CustomTextfield(labelText: 'Email'),
            const SizedBox(height: 20),
            CustomTextfield(labelText: 'Password'),
            const SizedBox(height: 20),
            CustomTextfield(labelText: 'Confirm Password'),
            const SizedBox(height: 30),
            MyDropdown(), // Add the dropdown here
            const SizedBox(height: 30),
            CustomButton(text: 'Register', onPressed: _goToHomeScreen),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                const SizedBox(width: 2),
                TextButton(
                  onPressed: _navigateToLogin,
                  child: const Text(
                    'Log In',
                    style: TextStyle(color: Color(0xff02D185), fontWeight: FontWeight.bold),
                  ),
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
