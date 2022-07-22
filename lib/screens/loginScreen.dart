import 'package:flutter/material.dart';
import 'package:picstagram/resources/auth_methods.dart';
import 'package:picstagram/responsive/mobile_layout.dart';
import 'package:picstagram/responsive/responsive.dart';
import 'package:picstagram/responsive/web_layout.dart';
import 'package:picstagram/utils/utilities.dart';
import 'package:picstagram/widgets/inputFormField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().logInUser(
        email: _emailController.text, password: _passwordController.text);
    setState(() {
      _isLoading = false;
    });
    if (res == 'success') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            webScreenLayout: WebScreenLayout(),
            mobileScreenLayout: MobileScreenLayout(),
          ),
        ),
      );
    } else {
      showSnackbar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Container(),
              ),
              //Main logo :
              Hero(
                tag: 'Main_Logo',
                child: Text(
                  'Picstagram',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              //Email input field :
              InputFormField(
                textEditingController: _emailController,
                hintText: 'Enter your email',
                keyType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 24,
              ),
              //Password input field :
              InputFormField(
                textEditingController: _passwordController,
                hintText: 'Enter your password',
                keyType: TextInputType.text,
                hideInput: true,
              ),
              const SizedBox(
                height: 24,
              ),
              //Log in button :
              InkWell(
                onTap: loginUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: ShapeDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text('Log in'),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, );
                    },
                    child: const Text(
                      'Sign up.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
