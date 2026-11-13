import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({super.key, required this.viewModel});

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: viewModel.selectedDate,
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      viewModel.updateDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String formattedDate =
        '${viewModel.selectedDate.day.toString().padLeft(2, '0')}/'
        '${viewModel.selectedDate.month.toString().padLeft(2, '0')}/'
        '${viewModel.selectedDate.year}';

    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Interactive Controls & Booking',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 24),

            // 1. Visit Date Picker
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_today),
              title: const Text('Visit Date'),
              subtitle: Text(formattedDate),
              trailing: OutlinedButton(
                onPressed: () => _pickDate(context),
                child: const Text('Select Date'),
              ),
            ),
            const SizedBox(height: 8),

            // 2. Cruise Package Dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.directions_boat_outlined),
                    SizedBox(width: 16),
                    Text('Cruise Package', style: TextStyle(fontSize: 16)),
                  ],
                ),
                DropdownButton<String>(
                  value: viewModel.selectedPackage,
                  items: viewModel.packages.map((String pkg) {
                    return DropdownMenuItem<String>(
                      value: pkg,
                      child: Text(pkg),
                    );
                  }).toList(),
                  onChanged: viewModel.updatePackage,
                ),
              ],
            ),
            const SizedBox(height: 8),

            // 3. Dark Mode Theme Switch
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: Icon(
                viewModel.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              ),
              title: const Text('Dark Mode Theme'),
              value: viewModel.isDarkMode,
              onChanged: viewModel.toggleTheme,
            ),
          ],
        ),
      ),
    );
  }
}