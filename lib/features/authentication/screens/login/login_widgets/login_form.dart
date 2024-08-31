import 'package:appecomm/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:appecomm/features/authentication/screens/signup/signup.dart';
import 'package:appecomm/navigation_menu.dart';
import 'package:appecomm/utils/constants/sizes.dart';
import 'package:appecomm/utils/constants/text_strings.dart';
import 'package:appecomm/utils/validators/authservice.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatefulWidget {
  final void Function()? onTap;

  TLoginForm({super.key, this.onTap});

  @override
  _TLoginFormState createState() => _TLoginFormState();
}

class _TLoginFormState extends State<TLoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool rememberMe = false;

  void login(BuildContext context) async {
    final authService = AuthService();

    if (_formKey.currentState!.validate()) {
      try {
        await authService.SignInWithEmailPassword(
            emailController.text, passController.text);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => NavigationMenu(),
          ),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Login Error"),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: TTexts.email,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              // Basic email validation
              final emailPattern = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
              if (!emailPattern.hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            controller: passController,
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: TTexts.password,
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ),
                  const Text(TTexts.rememberMe),
                ],
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPassword()),
                ),
                child: Text(TTexts.forgotPassword),
              ),
            ],
          ),
          SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => login(context),
              child: Text(TTexts.signIn),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              ),
              child: Text(TTexts.createAccount),
            ),
          ),
          SizedBox(
            height: TSizes.spaceBtwSections,
          ),
        ],
      ),
    );
  }
}
