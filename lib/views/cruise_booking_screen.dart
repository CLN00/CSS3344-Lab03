import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sibu River Cruise & Heritage'),
        centerTitle: false,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _buildPortraitLayout();
          } else {
            return _buildLandscapeLayout();
          }
        },
      ),
    );
  }

  // Portrait Layout: Single Column ListView
  Widget _buildPortraitLayout() {
    return ListView(
      children: [
        HeaderImageWidget(imagePath: viewModel.destination.imagePath),
        TitleSectionWidget(
          name: viewModel.destination.name,
          location: viewModel.destination.location,
          ratingCount: viewModel.destination.ratingCount,
          isStarred: viewModel.destination.isStarred,
          onStarPressed: viewModel.toggleStar,
        ),
        const ActionBarWidget(),
        DescriptionWidget(text: viewModel.destination.description),
        BookingControlsWidget(viewModel: viewModel),
      ],
    );
  }

  // Landscape Layout: Side-by-Side Split Pane (Row + Expanded)
  Widget _buildLandscapeLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Pane: Header Image + Description
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderImageWidget(
                  imagePath: viewModel.destination.imagePath,
                  caption: 'Rajang River Horizon',
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(
                    'About the Destination',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                DescriptionWidget(text: viewModel.destination.description),
              ],
            ),
          ),
        ),
        const VerticalDivider(width: 1),
        // Right Pane: Title + Action Bar + Controls
        Expanded(
          flex: 1,
          child: ListView(
            children: [
              TitleSectionWidget(
                name: viewModel.destination.name,
                location: viewModel.destination.location,
                ratingCount: viewModel.destination.ratingCount,
                isStarred: viewModel.destination.isStarred,
                onStarPressed: viewModel.toggleStar,
              ),
              const ActionBarWidget(),
              BookingControlsWidget(viewModel: viewModel),
            ],
          ),
        ),
      ],
    );
  }
}