import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

final _globalFormKey = GlobalKey<FormState>();

class CreditCardForm extends StatelessWidget {
  const CreditCardForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _globalFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                maxLength: 16,
                decoration: const InputDecoration(label: Text('Card Number'), hintText: "ex: 1234 5678 9123 4567"),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Please enter 16 digits.';
                  }
                  if (!v.isInt) {
                    return 'Please enter valid digits only.';
                  }
                  if (v.length < 16) {
                    return 'Please enter 16 digits.';
                  }
                  return null;
                },
              ),
              TextFormField(
                maxLength: 60,
                decoration: const InputDecoration(label: Text('Card Holder Name'), hintText: "ex: John Doe"),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'You must enter a value for the name.';
                  }
                  if (!v.isAlpha) {
                    return 'Please enter valid charchters only.';
                  }

                  return null;
                },
              ),

              Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      maxLength: 5,
                      decoration: const InputDecoration(label: Text('Expiration Date'), hintText: "MM/YY"),
                      validator: (v) {
                        if (v == null || v.isEmpty || v.length < 3) {
                          return 'Please Enter a 3 digits.';
                        }
                        if (!v.isInt) {
                          return 'Please enter valid digits only.';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Flexible(
                    child: TextFormField(
                      maxLength: 3,
                      decoration: const InputDecoration(label: Text('CVV'), hintText: "ex: 123"),
                      validator: (v) {
                        if (v == null || v.isEmpty || v.length < 5) {
                          return 'Please enter a valid expiration date';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: double.maxFinite,
                child: Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _globalFormKey.currentState!.validate();
                    },

                    child: const Text('Pay'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
