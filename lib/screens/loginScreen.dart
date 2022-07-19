import 'package:flutter/material.dart';
import 'package:picstagram/widgets/inputFormField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                textEditingController: _emailController,
                hintText: 'Enter your password',
                keyType: TextInputType.text,
                hideInput: true,
              ),
              const SizedBox(
                height: 24,
              ),
              //Log in button :
              InkWell(
                onTap: () {},
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
                  child: const Text('Log in'),
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
