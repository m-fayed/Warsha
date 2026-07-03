import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';
import '../widgets/active_bookings_tab_view.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  int _activeTab = 0; // 0: Active, 1: Upcoming, 2: Past

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Top Header with Title and Notification Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Bookings',
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_none_outlined,
                      color: AppColors.textDark,
                      size: 26,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 2. Tab Bar capsules Row
              _buildTabRow(),
              const SizedBox(height: 20),

              // 3. Scrollable List of active/upcoming bookings
              Expanded(
                child: _activeTab == 0
                    ? ActiveBookingsTabView(
                        onActionTriggered: _showSnackBar,
                      )
                    : Center(
                        child: Text(
                          _activeTab == 1
                              ? 'No upcoming bookings scheduled.'
                              : 'No past booking records.',
                          style: const TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabRow() {
    return Row(
      children: [
        _buildTabCapsule('Active', 0),
        const SizedBox(width: 10),
        _buildTabCapsule('Upcoming', 1),
        const SizedBox(width: 10),
        _buildTabCapsule('Past', 2),
      ],
    );
  }

  Widget _buildTabCapsule(String label, int index) {
    final bool isSelected = _activeTab == index;
    return GestureDetector(
      onTap: () => setState(() => _activeTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? const Color(0xFF1E1E1E) : Colors.grey.shade300,
            width: 1.2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.textGrey,
            fontSize: 13,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
