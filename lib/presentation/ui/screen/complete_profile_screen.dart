import 'package:crafty_bay/presentation/ui/screen/otp_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompeleteProfileScreen extends StatefulWidget {
  const CompeleteProfileScreen({super.key});

  @override
  State<CompeleteProfileScreen> createState() => _CompeleteProfileScreenState();
}

class _CompeleteProfileScreenState extends State<CompeleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              const AppLogo(),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Complete Profile',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Text('Get started with us providing your information',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black54)),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: 'First name'),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: 'Last name'),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'mobile'),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: 'city'),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(hintText: 'Shipping Address'),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: _onTapCompeleteButton,
                child: const Text('Compelete'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onTapCompeleteButton() {
    Get.to(() => const OtpVerificationScreen());
  }
}
