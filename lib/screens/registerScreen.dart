import 'package:flutter/material.dart';
import 'package:picstagram/widgets/inputFormField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
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
              //Profile pic selector :
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1085&q=80'),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ),
                ],
              ),
              //Username input field :
              InputFormField(
                textEditingController: _usernameController,
                hintText: 'Enter your username',
                keyType: TextInputType.text,
              ),
              const SizedBox(
                height: 24,
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
              //Bio input field :
              InputFormField(
                textEditingController: _bioController,
                hintText: 'Enter your bio',
                keyType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 24,
              ),
              //Sign up button :
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
                  child: const Text('Sign up'),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, );
                    },
                    child: const Text(
                      'Log in.',
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
