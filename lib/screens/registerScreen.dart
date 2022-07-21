import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picstagram/resources/auth_methods.dart';
import 'package:picstagram/utils/utilities.dart';
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
  Uint8List? _image;
  bool _isLoading = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void registerUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!,
    );
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      showSnackbar(context, res);
    } else {}
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
                //height: 64, //TODO : Rechange height
                height: 1,
              ),
              //Profile pic selector :
              Stack(
                children: [
                  (_image != null)
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person),
                        ),
                  const SizedBox(
                    height: 24,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
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
                textEditingController: _passwordController,
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
                onTap: registerUser,
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
                      : const Text('Sign up'),
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


//TODO : make sure to use email validation, because even firebase uses it
//TODO : makes ure to make passwords longer than 6 characters, because thats what firebase wants