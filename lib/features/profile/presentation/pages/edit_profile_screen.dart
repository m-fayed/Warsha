import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import '../widgets/edit_profile_app_bar.dart';
import '../widgets/edit_profile_user_card.dart';
import '../widgets/edit_profile_personal_info.dart';
import '../widgets/edit_profile_account_section.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String _name = 'Seif Fawzy';
  String _phone = '+201111319944';
  String _email = 'Seif@warsha.app';

  void _editField({
    required String title,
    required String currentValue,
    required Function(String) onSave,
  }) {
    final controller = TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $title', style: const TextStyle(fontFamily: 'Roboto')),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter new $title',
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryOrange),
              ),
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  onSave(controller.text.trim());
                }
                Navigator.pop(context);
              },
              child: const Text('Save', style: TextStyle(color: AppColors.primaryOrange)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const EditProfileAppBar(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EditProfileUserCard(name: _name, phone: _phone),
                  const SizedBox(height: 24),
                  EditProfilePersonalInfo(
                    name: _name,
                    phone: _phone,
                    email: _email,
                    onEditName: () => _editField(
                      title: 'Full Name',
                      currentValue: _name,
                      onSave: (val) => setState(() => _name = val),
                    ),
                    onEditPhone: () => _editField(
                      title: 'Phone Number',
                      currentValue: _phone,
                      onSave: (val) => setState(() => _phone = val),
                    ),
                    onEditEmail: () => _editField(
                      title: 'Email',
                      currentValue: _email,
                      onSave: (val) => setState(() => _email = val),
                    ),
                  ),
                  const SizedBox(height: 24),
                  EditProfileAccountSection(
                    onDeleteAccount: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Delete account flow initiated...'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Logged out successfully')),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red, width: 1.5),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 180,
                      height: 100,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.car_repair,
                          size: 80,
                          color: AppColors.primaryOrange,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
