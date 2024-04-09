import 'package:example/styles/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tarka_ui/styles/theme.dart';
import 'package:tarka_ui/tarka_ui.dart';

import 'symbol.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var tuiThemeData = TUIThemeData(
        TUIColors(
            AppColors.primary,
            AppColors.onPrimary,
            AppColors.primaryAlt,
            AppColors.onPrimaryAlt,
            AppColors.primaryHover,
            AppColors.primaryAltHover,
            AppColors.secondary,
            AppColors.onSecondary,
            AppColors.secondaryAlt,
            AppColors.onSecondaryAlt,
            AppColors.secondaryHover,
            AppColors.secondaryAltHover,
            AppColors.tertiary,
            AppColors.onTertiary,
            AppColors.tertiaryAlt,
            AppColors.onTertiaryAlt,
            AppColors.tertiaryHover,
            AppColors.tertiaryAltHover,
            AppColors.success,
            AppColors.onSuccess,
            AppColors.success10,
            AppColors.success20,
            AppColors.error,
            AppColors.onError,
            AppColors.error10,
            AppColors.errorHover,
            AppColors.warning,
            AppColors.onWarning,
            AppColors.warning10,
            AppColors.warningHover,
            AppColors.background,
            AppColors.onBackground,
            AppColors.outline,
            AppColors.disabledContent,
            AppColors.disabledBackground,
            AppColors.disabledBackgroundHover,
            AppColors.link,
            AppColors.inputText,
            AppColors.inputBackground,
            AppColors.inputTextDim,
            AppColors.surface,
            AppColors.surface50,
            AppColors.onSurface,
            AppColors.surfaceVariant,
            AppColors.surfaceHover,
            AppColors.surfaceVariantHover,
            AppColors.constantLight,
            AppColors.constantDark),
        TUITypography(
          TUITextStyle.heading1,
          TUITextStyle.heading2,
          TUITextStyle.heading3,
          TUITextStyle.heading4,
          TUITextStyle.heading5,
          TUITextStyle.heading6,
          TUITextStyle.heading7,
          TUITextStyle.body5,
          TUITextStyle.body6,
          TUITextStyle.body7,
          TUITextStyle.body8,
          TUITextStyle.button6,
          TUITextStyle.button7,
          TUITextStyle.button8,
        ));
    return TUIApp(
      theme: tuiThemeData,
      darkTheme: tuiThemeData,
      title: 'Tarka Kit Show Case',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TUIRangeValues rangeSliderValue = const TUIRangeValues(0.05, 0.9);
  double sliderValue = 0.1;
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

  updateRangeSliderValue(TUIRangeValues newValue) {
    if (rangeSliderValue == newValue) return;
    setState(() {
      rangeSliderValue = newValue;
    });
  }

  updateSliderValue(double newValue) {
    if (sliderValue == newValue) return;
    setState(() {
      sliderValue = newValue;
    });
  }

  int selectedBottomNavBarItem = 0;
  bool _enable = false;

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: TUIFloatingActionButton(
        iconData: Symbol.map.value,
        onPressed: () {},
      ),
      bottomNavigationBar: TUIAppTopBar(
        items: [
          TUIAppBarItem(
              iconData: FluentIcons.bookmark_24_regular, label: "Saved"),
          TUIAppBarItem(
              iconData: FluentIcons.search_24_regular, label: "Discover"),
          TUIAppBarItem(iconData: FluentIcons.home_24_regular, label: "Home"),
          TUIAppBarItem(
              iconData: FluentIcons.person_24_regular, label: "Profile"),
          TUIAppBarItem(
              iconData: FluentIcons.settings_24_regular, label: "Settings"),
        ],
        currentIndex: selectedBottomNavBarItem,
        onTap: (value) => {
          setState(() {
            selectedBottomNavBarItem = value;
          })
        },
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          children: [
            const Text("Text Field", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Select Date',
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: () => _selectDate(context),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text =
            '${_selectedDate!.year}/${_selectedDate!.month}/${_selectedDate!.day}';
      });
    }
  }
}
