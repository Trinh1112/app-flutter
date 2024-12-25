import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/manhinh/Tour.dart';
import 'dart:convert';

class Manhinh1 extends StatefulWidget {
  const Manhinh1({super.key});

  @override
  State<Manhinh1> createState() => _Manhinh1State();
}

class _Manhinh1State extends State<Manhinh1> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final url =
        Uri.parse('https://cloud-server-5ifq.onrender.com/api/users/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': _emailController.text,
        'password': _passwordController.text,
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Manhinh3()),
      );
    } else {
      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        _errorMessage = data['message'] ?? 'Login failed';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    height: 200,
                    color: const Color(0xFF00C1A4),
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 30),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Text("Sign In",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const SizedBox(height: 15),
                  const Text("Email",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  const Text("Password",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  if (_errorMessage != null)
                    Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(height: 15),
                  const Text("Forgot Password"),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : login,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: const Color(0xFF00C1A4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "SIGN IN",
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Center(child: Text('Or sign in with')),
                  const SizedBox(height: 15),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/iconFacebook.png', height: 40),
                        const SizedBox(width: 20),
                        Image.asset('images/iconKakao.png', height: 40),
                        const SizedBox(width: 20),
                        Image.asset('images/iconLine.png', height: 40),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        Text("Sign Up",
                            style: TextStyle(color: Color(0xFF00C1A4))),
                      ],
                    ),
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

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
