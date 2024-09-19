import 'package:crafty_bay/presentation/ui/screen/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:crafty_bay/presentation/utils/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTecConTroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(
                height: 82,
              ),
              const AppLogo(),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Enter OTP Code',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Text('A 4 digit otp has sent to  email',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black54)),
              const SizedBox(
                height: 24,
              ),
              PinCodeTextField(
                  length: 6,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedColor: Colors.green,
                      inactiveColor: AppColors.themeColor),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  controller: _otpTecConTroller,
                  appContext: context),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed:_onTapNextButton,
                child: const Text('Next'),
              ),
              const SizedBox(
                height: 16,
              ),
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),
                  text: 'This code will expire in ',
                  children: const [
                    TextSpan(
                        text: '120s',
                        style: TextStyle(color: AppColors.themeColor))
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(onPressed: (){}, child:const  Text('Resend code'))

            ],
          ),
        ),
      ),
    );
  }
  void _onTapNextButton(){
    Get.to(()=>const CompeleteProfileScreen(),);
  }

  @override
  void dispose() {
    _otpTecConTroller.dispose();
    super.dispose();
  }
}
