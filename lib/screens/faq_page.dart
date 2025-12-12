import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final List<Map<String, String>> faqs = [
    {
      'question': 'How do I register as a landlord or tenant?',
      'answer':
          'You can create an account by downloading the app and following the registration process. The email that you register will differentiate your role as the landlord has their own email to register.'
    },
    {
      'question': 'How do I make a payment for my rent?',
      'answer':
          'Payments can be made securely through the app using various methods, such as credit card, bank transfer, or e-wallet.'
    },
    {
      'question': 'How do I communicate with landlord?',
      'answer':
          'You can send email directly to landlords through the Email or make a phone call with the landlord.'
    },
    {
      'question': 'How do I view my payment history?',
      'answer':
          'To view your payment history, navigate to the Transaction History section in the app, where you can check your previous transactions.'
    },
    {
      'question': 'Can I adjust the rent price after publishing my listing?',
      'answer':
          'Yes, you can update the rent price and other details at any time by editing your listing. Any changes will be reflected immediately on the platform.'
    },
    {
      'question': 'How do I receive rent payments from tenants?',
      'answer':
          'Rent payments can be made directly through the app, where tenants can pay via credit card, bank transfer, or e-wallet. You will receive payments once tenants process their transactions.'
    },
    {
      'question': 'How can I update my profile information?',
      'answer':
          'You can update your profile information, such as email and contact details, by going to the Profile section of your profile.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9EAE2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Frequently Asked Questions",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Find answers to common questions",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: faqs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: ExpansionTile(
                      title: Text(
                        faqs[index]['question']!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      collapsedBackgroundColor:
                          Colors.white.withOpacity(0.6),
                      backgroundColor: Colors.white.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                      collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            faqs[index]['answer']!,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
