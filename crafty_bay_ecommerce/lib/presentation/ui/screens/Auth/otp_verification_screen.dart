import 'package:crafty_bay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:crafty_bay_ecommerce/presentation/ui/utility/image_path_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 130,
              ),
              Center(
                  child: SvgPicture.asset(
                ImagePathHolder.craftyBayLogoSVG,
                width: 100,
              )),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Enter OTP Code",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Text("A 4 digit OTP has been sent",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey)),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "OTP",
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6))),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Next",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: const TextSpan(
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(text: 'This code will expire in'),
                      TextSpan(
                          text: '120s', style: TextStyle(color: primeColor)),
                    ]),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Resend Code",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
