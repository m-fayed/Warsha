import 'package:flutter/material.dart';
import '../widgets/help_support_app_bar.dart';
import '../widgets/help_support_search_bar.dart';
import '../widgets/help_support_quick_cards.dart';
import '../widgets/help_support_faq_section.dart';
import '../widgets/help_support_footer.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const HelpSupportAppBar(),
      body: const CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Search Bar
                  HelpSupportSearchBar(),
                  SizedBox(height: 20),

                  // 2. Quick Support Cards
                  HelpSupportQuickCards(),
                  SizedBox(height: 28),

                  // 3. Frequently Asked Section
                  HelpSupportFaqSection(),

                  // Push footer text to absolute bottom
                  Spacer(),
                  SizedBox(height: 32),

                  // 4. Bottom Text Footer (NO LOGO)
                  HelpSupportFooter(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
