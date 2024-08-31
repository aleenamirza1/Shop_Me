import 'package:appecomm/features/authentication/screens/signup/verify_email.dart';
import 'package:appecomm/utils/constants/colors.dart';
import 'package:appecomm/utils/constants/sizes.dart';
import 'package:appecomm/utils/constants/text_strings.dart';
import 'package:appecomm/utils/helpers/helper_functions.dart';
import 'package:appecomm/utils/validators/authservice.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSignUpForm extends StatefulWidget {
  final void Function()? onTap;

  TSignUpForm({super.key, this.onTap});

  @override
  _TSignUpFormState createState() => _TSignUpFormState();
}

class _TSignUpFormState extends State<TSignUpForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  @override
  void dispose() {
    // Dispose of controllers to free up resources
    emailController.dispose();
    passController.dispose();
    confirmpassController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  void register(BuildContext context) {
    final _auth = AuthService();
    if (passController.text == confirmpassController.text) {
      try {
        _auth.signUpWithEmailPassword(
            emailController.text, passController.text);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => VerifyEmailScreen(),
          ),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Password doesn't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Form(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: firstNameController,
                expands: false,
                decoration: InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
            SizedBox(width: TSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                controller: lastNameController,
                expands: false,
                decoration: InputDecoration(
                    labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
              ),
            )
          ],
        ),
        SizedBox(height: TSizes.spaceBtwInputFields),
        TextFormField(
          controller: userNameController,
          expands: false,
          decoration: InputDecoration(
              labelText: TTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
        ),
        SizedBox(height: TSizes.spaceBtwInputFields),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
              labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
        ),
        SizedBox(height: TSizes.spaceBtwInputFields),
        TextFormField(
          obscureText: true,
          controller: passController,
          decoration: InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check)),
        ),
        SizedBox(height: TSizes.spaceBtwInputFields),
        TextFormField(
          controller: confirmpassController,
          obscureText: true,
          decoration: InputDecoration(
              labelText: TTexts.confirmPassword,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),
        SizedBox(height: TSizes.spaceBtwSections),
        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: true,
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '${TTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: '${TTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary),
              ),
              TextSpan(
                  text: '${TTexts.and} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: TTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary),
              )
            ]))
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => register(context),
                child: Text(TTexts.createAccount))),
      ],
    ));
  }
}
