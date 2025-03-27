import 'package:flutter/material.dart';
import 'package:flutter_application/features/payment/view/pages/confirmation_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:string_validator/string_validator.dart';

final _globalFormKey = GlobalKey<FormState>();

class CreditCardForm extends ConsumerStatefulWidget {
  const CreditCardForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreditCardFormState();
}

class _CreditCardFormState extends ConsumerState<CreditCardForm> {
  bool saveCardInfo = true;
  final cardNumber = TextEditingController();
  final cardHolderName = TextEditingController();
  final cardExpirationDate = TextEditingController();
  final cardCvv = TextEditingController();

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
    final prefs = await SharedPreferences.getInstance();
    // Try reading the counter value from persistent storage.
    // If not present, null is returned, so default to 0.
    cardHolderName.text = prefs.getString('cardHolderName') ?? '';
    cardNumber.text = prefs.getString('cardNumber') ?? '';
    cardExpirationDate.text = prefs.getString('cardExpirationDate') ?? '';
    cardCvv.text = prefs.getString('cardCvv') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _globalFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: cardNumber,
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
                controller: cardHolderName,
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
                      controller: cardExpirationDate,
                      maxLength: 5,
                      decoration: const InputDecoration(label: Text('Expiration Date'), hintText: "MM/YY"),
                      validator: (v) {
                        if (v == null || v.isEmpty || v.length < 5) {
                          return 'Please enter a valid expiration date';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Flexible(
                    child: TextFormField(
                      controller: cardCvv,
                      maxLength: 3,
                      decoration: const InputDecoration(label: Text('CVV'), hintText: "ex: 123"),
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
                ],
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text("Save Credit Card Info For Future Use"),
                controlAffinity: ListTileControlAffinity.leading,
                value: saveCardInfo,
                onChanged: (newValue) {
                  setState(() {
                    saveCardInfo = newValue ?? false;
                  });
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                width: double.maxFinite,
                child: Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final isValid = _globalFormKey.currentState!.validate();
                      if (isValid) {
                        if (saveCardInfo) {
                          // Load and obtain the shared preferences for this app.
                          final prefs = await SharedPreferences.getInstance();
                          // Save the counter value to persistent storage under the 'counter' key.
                          await prefs.setString('cardHolderName', cardHolderName.text);
                          await prefs.setString('cardNumber', cardNumber.text);
                          await prefs.setString('cardExpirationDate', cardExpirationDate.text);
                          await prefs.setString('cardCvv', cardCvv.text);
                        }
                        if (context.mounted) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentConfirmation()));
                        }
                      }
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
