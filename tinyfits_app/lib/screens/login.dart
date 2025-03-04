// import 'package:flutter/material.dart';
// //import 'package:form_field_validator/form_field_validator.dart';
// import 'package:tinyfits_app/screens/signup.dart';
// import 'package:tinyfits_app/screens/home_page.dart';
// import 'package:tinyfits_app/theme/colors.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   // final _formKey = GlobalKey<FormState>();
//   bool keepMeLoggedIn = false;

//   void _handleLogin() {
//     // Add your login logic here
//     // After successful login:
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const HomePage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Image.asset(
//               'assets/logo.png',
//               height: 60,
//             ),
//             const SizedBox(height: 32),
//             const Text(
//               'Welcome back!',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const Text(
//               'Login to your account',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 32),
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Enter your name',
//                 hintStyle: TextStyle(color: Colors.grey[400]),
//                 filled: true,
//                 fillColor: Colors.grey[50],
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide.none,
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 14,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               obscureText: true,
//               decoration: InputDecoration(
//                 hintText: 'Password',
//                 hintStyle: TextStyle(color: Colors.grey[400]),
//                 filled: true,
//                 fillColor: Colors.grey[50],
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide.none,
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 14,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Checkbox(
//                       value: keepMeLoggedIn,
//                       onChanged: (value) {
//                         setState(() {
//                           keepMeLoggedIn = value ?? false;
//                         });
//                       },
//                       activeColor: AppColors.themeBlue,
//                     ),
//                     const Text(
//                       'Keep me logged in',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ],
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     // Add forgot password functionality
//                   },
//                   child: Text(
//                     'Forgot password?',
//                     style: TextStyle(color: AppColors.themeBlue),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: _handleLogin,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.themeBlue,
//                 minimumSize: const Size(double.infinity, 45), // Reduced height
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: const Text(
//                 "Log in",
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ),
//             const Spacer(),
//             const Divider(),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Don't have an account? ",
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const SignUp()),
//                       );
//                     },
//                     child: Text(
//                       'Sign Up',
//                       style: TextStyle(color: AppColors.themeBlue),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tinyfits_app/screens/home_page.dart';
import 'package:tinyfits_app/screens/signup.dart';
import 'package:tinyfits_app/theme/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool keepMeLoggedIn = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    setState(() {
      _isLoading = true;
    });

    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final Uri url = Uri.parse("http://192.168.8.155:5000/login");
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      final responseData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Store user token if needed
        String token = responseData['token'];

        // Navigate to HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['error'] ?? 'Login failed')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 60,
            ),
            const SizedBox(height: 32),
            const Text(
              'Welcome back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Text(
              'Login to your account',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Colors.grey[400]),
                filled: true,
                fillColor: Colors.grey[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey[400]),
                filled: true,
                fillColor: Colors.grey[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: keepMeLoggedIn,
                      onChanged: (value) {
                        setState(() {
                          keepMeLoggedIn = value ?? false;
                        });
                      },
                      activeColor: AppColors.themeBlue,
                    ),
                    const Text('Keep me logged in',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Add forgot password functionality here
                  },
                  child: Text('Forgot password?',
                      style: TextStyle(color: AppColors.themeBlue)),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _isLoading
                ? const Center(
                    child:
                        CircularProgressIndicator()) // Show loading indicator
                : ElevatedButton(
                    onPressed: _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themeBlue,
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Log in",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
            const Spacer(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? ",
                      style: TextStyle(color: Colors.grey)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: Text('Sign Up',
                        style: TextStyle(color: AppColors.themeBlue)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
