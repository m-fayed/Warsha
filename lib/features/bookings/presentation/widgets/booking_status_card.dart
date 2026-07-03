import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class BookingStatusCard extends StatelessWidget {
  final String statusText;
  final Color statusTextColor;
  final Color statusBgColor;
  final Color? statusBorderColor;
  final String title;
  final String workshopName;
  final String? dateTimeText;
  final bool showDetailsDivider;
  final Widget? detailsRow;
  final String? bannerText;
  final List<Widget>? actionButtons;

  const BookingStatusCard({
    super.key,
    required this.statusText,
    required this.statusTextColor,
    required this.statusBgColor,
    this.statusBorderColor,
    required this.title,
    required this.workshopName,
    this.dateTimeText,
    this.showDetailsDivider = false,
    this.detailsRow,
    this.bannerText,
    this.actionButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFF7905).withValues(alpha: 0.12), // Hex #FF79051F Tinted orange shade
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFFF7905).withValues(alpha: 0.3), // Subtle orange outline
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Status Badge & Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBgColor,
                  borderRadius: BorderRadius.circular(20),
                  border: statusBorderColor != null
                      ? Border.all(color: statusBorderColor!, width: 1.0)
                      : null,
                ),
                child: Text(
                  statusText,
                  style: TextStyle(
                    color: statusTextColor,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              if (dateTimeText != null)
                Text(
                  dateTimeText!,
                  style: const TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 12,
                    fontFamily: 'Roboto',
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),

          // 2. Title & Workshop Location Info
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textDark,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            workshopName,
            style: const TextStyle(
              color: AppColors.textGrey,
              fontSize: 13,
              fontFamily: 'Roboto',
            ),
          ),

          // 3. Optional Divider and Details Row (Figma specs for Confirmed Card)
          if (showDetailsDivider) ...[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Divider(
                color: Colors.black12, // Darker divider for light background contrast
                height: 1,
              ),
            ),
          ],
          if (detailsRow != null) ...[
            detailsRow!,
          ],

          // 4. Conditional Banner (e.g. clock indicator text)
          if (bannerText != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.amber.shade50.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber.shade200, width: 0.8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: Colors.amber.shade800,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      bannerText!,
                      style: TextStyle(
                        color: Colors.amber.shade900,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          // 5. Action Buttons Row (if any)
          if (actionButtons != null && actionButtons!.isNotEmpty) ...[
            const SizedBox(height: 14),
            Row(
              children: actionButtons!.map((btn) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: btn,
                ),
              )).toList(),
            ),
          ],
        ],
      ),
    );
  }
}
