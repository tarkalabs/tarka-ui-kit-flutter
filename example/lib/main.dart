import 'package:example/styles/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tarka_ui/components/button/style.dart';
import 'package:tarka_ui/components/checkboxrow/checkboxrow.dart';
import 'package:tarka_ui/components/chip/chip.dart';
import 'package:tarka_ui/styles/theme.dart';
import 'package:tarka_ui/subcomponents/image.dart';
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
            print("On tap, item selected: $value");
            selectedBottomNavBarItem = value;
          })
        },
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          children: [
            const Text("Text Style", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            const Text("Heading1", style: TUITextStyle.heading1),
            const Text("Heading2", style: TUITextStyle.heading2),
            const Text("Heading3", style: TUITextStyle.heading3),
            const Text("Heading4", style: TUITextStyle.heading4),
            const Text("Heading5", style: TUITextStyle.heading5),
            const Text("Heading6", style: TUITextStyle.heading6),
            const Text("Heading7", style: TUITextStyle.heading7),
            const Text("Body5", style: TUITextStyle.body5),
            const Text("Body6", style: TUITextStyle.body6),
            const Text("Body7", style: TUITextStyle.body7),
            const Text("Body8", style: TUITextStyle.body8),
            const Text("Button6", style: TUITextStyle.button6),
            const Text("Button7", style: TUITextStyle.button7),
            const Text("Button8", style: TUITextStyle.button8),
            const SizedBox(height: 8),
            const Text("Button", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            TUIButton(
              label: "Primary Button",
              type: TUIButtonType.primary,
              size: TUIButtonSize.xs,
              onPressed: () {},
            ),
            TUIButton(
              label: "Secondary Button",
              iconData: Symbol.chevronDown.value,
              type: TUIButtonType.secondary,
              size: TUIButtonSize.s,
              iconPosition: TUIButtonIconPosition.right,
              onPressed: () {},
            ),
            TUIButton(
              label: "Outlined Button",
              iconData: Symbol.chevronDown.value,
              type: TUIButtonType.outlined,
              size: TUIButtonSize.m,
              onPressed: () {},
            ),
            TUIButton(
              label: "Ghost Button",
              iconData: Symbol.chevronDown.value,
              type: TUIButtonType.ghost,
              size: TUIButtonSize.l,
              onPressed: () {},
            ),
            TUIButton(
              label: "Danger Button",
              iconData: Symbol.chevronDown.value,
              type: TUIButtonType.danger,
              size: TUIButtonSize.l,
              onPressed: () {},
            ),
            TUIButton(
              iconData: Symbol.hamburgerMenu.value,
              type: TUIButtonType.ghost,
              size: TUIButtonSize.l,
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            const Text("Avatar", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            TUIAvatar(
              avatarSize: TUIAvatarSize.xxl,
              avatarContent: TUIAvatarContent(
                text: "TUI",
                type: TUIAvatarContentType.text,
              ),
            ),
            TUIAvatar(
              avatarSize: TUIAvatarSize.xl,
              avatarContent: TUIAvatarContent(
                text: "TUI",
                type: TUIAvatarContentType.text,
              ),
            ),
            TUIAvatar(
              avatarSize: TUIAvatarSize.m,
              avatarContent: TUIAvatarContent(
                type: TUIAvatarContentType.icon,
                icon: Symbol.export.value,
              ),
              isBadged: true,
            ),
            TUIAvatar(
              avatarSize: TUIAvatarSize.xxl,
              backgroundColor: Colors.grey[200],
              avatarContent: TUIAvatarContent(
                type: TUIAvatarContentType.image,
                image: const TUIImage(
                  imageUrl:
                      "https://avatars.githubusercontent.com/u/8043494?v=4",
                ),
              ),
              isBadged: true,
            ),
            const SizedBox(height: 8),
            const Text("Divider", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            const TUIDivider(horizontalPadding: TUIDividerHorizontalPadding.s),
            const TUIDivider(horizontalPadding: TUIDividerHorizontalPadding.m),
            const TUIDivider(horizontalPadding: TUIDividerHorizontalPadding.l),
            const TUIDivider(horizontalPadding: TUIDividerHorizontalPadding.xl),
            const SizedBox(
              height: 80,
              child: TUIDivider(
                type: TUIDividerType.vertical,
                verticalPadding: TUIDividerVerticalPadding.s,
              ),
            ),
            const SizedBox(height: 8),
            const Text("Badge", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TUIBadge(
                  isNumbered: true,
                  content: "1",
                  badgeSize: TUIBadgeSize.l,
                ),
                TUIBadge(
                  isNumbered: true,
                  content: "1",
                  badgeSize: TUIBadgeSize.s,
                ),
                TUIBadge(
                  isNumbered: true,
                  content: "1",
                  badgeSize: TUIBadgeSize.xs,
                ),
                TUIBadge(
                  isNumbered: false,
                  badgeSize: TUIBadgeSize.l,
                ),
                TUIBadge(
                  isNumbered: false,
                  badgeSize: TUIBadgeSize.s,
                ),
                TUIBadge(
                  isNumbered: false,
                  badgeSize: TUIBadgeSize.xs,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text("SuccessCheckMark", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            const TUISuccessCheckMark(),
            const SizedBox(height: 8),
            const Text("Tag-Small", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            const Row(
              children: [
                TUITag(
                    tagSize: TUITagSize.s,
                    tagText: "Label",
                    tagIconType: TUITagIconType.none),
                SizedBox(width: 8),
                TUITag(
                    tagSize: TUITagSize.s,
                    tagText: "Label",
                    tagContrast: TUITagContrast.high,
                    tagIconType: TUITagIconType.left),
                SizedBox(width: 8),
                TUITag(
                    tagSize: TUITagSize.s,
                    tagText: "Label",
                    tagContrast: TUITagContrast.high,
                    tagIconType: TUITagIconType.right),
              ],
            ),
            const Text("Tag-Medium", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            const Row(
              children: [
                TUITag(
                    tagSize: TUITagSize.m,
                    tagText: "Label",
                    tagIconType: TUITagIconType.none),
                SizedBox(width: 8),
                TUITag(
                    tagSize: TUITagSize.m,
                    tagText: "Label",
                    tagContrast: TUITagContrast.high,
                    tagIconType: TUITagIconType.left),
                SizedBox(width: 8),
                TUITag(
                    tagSize: TUITagSize.m,
                    tagText: "Label",
                    tagContrast: TUITagContrast.high,
                    tagIconType: TUITagIconType.right),
              ],
            ),
            const Text("Tag-Large", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            const Row(
              children: [
                TUITag(
                    tagSize: TUITagSize.l,
                    tagText: "Label",
                    tagIconType: TUITagIconType.none),
                SizedBox(width: 8),
                TUITag(
                    tagSize: TUITagSize.l,
                    tagText: "Label",
                    tagContrast: TUITagContrast.high,
                    tagIconType: TUITagIconType.left),
                SizedBox(width: 8),
                TUITag(
                    tagSize: TUITagSize.l,
                    tagText: "Label",
                    tagContrast: TUITagContrast.high,
                    tagIconType: TUITagIconType.right),
              ],
            ),
            const SizedBox(height: 8),
            const Text("Text Field", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            const TUIInputField(
              labelText: "Label",
              prefixIcon: Icon(TUISymbol.successCheckMark),
              suffixIcon: Icon(TUISymbol.chevronDown),
              helperText: "Helper / hint message goes here.",
            ),
            const SizedBox(height: 8),
            const TUIInputField(
              hintText: "Label",
              labelText: "Hello World",
              errorText: "Error message goes here.",
            ),
            const SizedBox(height: 8),
            const Text("Chips", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            TUIChip(
              leftIcon: Icons.abc_outlined,
              title: "Chip",
              size: TUIChipSize.m,
              rightIcon: Icons.access_alarm,
              onRightIconTap: () {
                print("Right Icon Tapped");
              },
              badgeValue: "4",
            ),
            const SizedBox(height: 8),
            TUIChip(
              leftIcon: Icons.abc_outlined,
              title: "Chip",
              size: TUIChipSize.m,
              rightIcon: Icons.access_alarm,
              onRightIconTap: () {
                print("Right Icon Tapped");
              },
              badgeValue: "4",
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                TUIChip(
                  leftIcon: Icons.abc_outlined,
                  title: "Suggestion Chip",
                  size: TUIChipSize.l,
                  onRightIconTap: () {
                    print("Right Icon Tapped");
                  },
                  highlighted: false,
                ),
                const SizedBox(width: 24),
                TUIChip(
                  leftIcon: Icons.abc_outlined,
                  title: "Chip",
                  size: TUIChipSize.m,
                  rightIcon: Icons.access_alarm,
                  onRightIconTap: () {
                    print("Right Icon Tapped");
                  },
                  badgeValue: "4",
                  highlighted: true,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text("Breadcrumb", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            TUIBreadCrumb(
              titles: const [
                "one",
                "two",
                "three",
                "four",
                "five",
                "six",
                "seven",
                "eight",
                "nine",
                "ten"
              ],
              onTap: (index) {
                print("The tapped index is ${index}");
              },
            ),
            const SizedBox(height: 8),
            const Text("Icon Button", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            Column(
                children: TUIIconButtonType.values
                    .map((type) => Row(
                        children: TUIIconButtonSize.values
                            .map((size) => TUIIconButton(
                                type: type,
                                size: size,
                                onPressed: () {},
                                iconData: Symbol.documentDownload.value))
                            .toList(growable: false)))
                    .toList(growable: false)),
            const SizedBox(height: 8),
            const Text("Snackbar", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TUIButton(
                    type: TUIButtonType.outlined,
                    label: "Success",
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(TUISnackBar(
                        context: context,
                        type: TUISnackBarType.success,
                        message: "This is an success Snackbar",
                      ));
                    }),
                TUIButton(
                    type: TUIButtonType.outlined,
                    label: "Information",
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(TUISnackBar(
                        context: context,
                        type: TUISnackBarType.information,
                        message: "This is an information Snackbar with action",
                        action: TUISnackBarAction.dismiss("Dismiss"),
                      ));
                    }),
                TUIButton(
                    type: TUIButtonType.outlined,
                    label: "Warning",
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(TUISnackBar(
                        context: context,
                        type: TUISnackBarType.warning,
                        message:
                            "This is an warning Snackbar with TUISnackBarAction",
                        action: TUISnackBarAction.dismiss("Dismiss"),
                      ));
                    }),
                TUIButton(
                    type: TUIButtonType.outlined,
                    label: "Error",
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(TUISnackBar(
                        context: context,
                        type: TUISnackBarType.error,
                        message: "This is an error Snackbar with action",
                        action: TUISnackBarAction(
                            label: "Retry",
                            onActionPressed: () {
                              print("Snackbar Retry onPressed");
                            }),
                      ));
                    })
              ],
            ),
            const SizedBox(height: 8),
            const Text("Media Thumbnail", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            Wrap(
              direction: Axis.horizontal,
              spacing: 4,
              runSpacing: 10,
              children: [
                TUIMediaThumbnail(
                  size: TUIMediaThumbnailSize.large,
                  mediaType: TUIMediaThumbnailType.video,
                  onPressed: () {
                    print("Video thumbnail tapped.");
                  },
                  customThumbnailImage: TUIImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1579353977828-2a4eab540b9a",
                    height: TUIMediaThumbnailSize.large.height,
                    width: TUIMediaThumbnailSize.large.width,
                    fit: BoxFit.fill,
                  ),
                ),
                TUIMediaThumbnail(
                  size: TUIMediaThumbnailSize.large,
                  mediaType: TUIMediaThumbnailType.audio,
                  isSelectable: false,
                  onPressed: () {
                    print("Audio thumbnail tapped.");
                  },
                ),
                TUIMediaThumbnail(
                  size: TUIMediaThumbnailSize.large,
                  mediaType: TUIMediaThumbnailType.document,
                  onPressed: () {
                    print("Document thumbnail tapped.");
                  },
                ),
                TUIMediaThumbnail(
                  size: TUIMediaThumbnailSize.large,
                  mediaType: TUIMediaThumbnailType.photo,
                  isSelectable: false,
                  onPressed: () {
                    print("Photo thumbnail tapped.");
                  },
                  customThumbnailImage: TUIImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1579353977828-2a4eab540b9a",
                    height: TUIMediaThumbnailSize.large.height,
                    width: TUIMediaThumbnailSize.large.width,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            TUIRangeSlider(
              values: rangeSliderValue,
              onChanged: (value) {
                updateRangeSliderValue(value);
              },
              onChangeStart: (value) => {print("Range change Started $value")},
              onChangeEnd: (value) => {print("Range change Ended $value")},
              max: 1,
              min: 0,
            ),
            TUISlider(
              value: sliderValue,
              onChanged: (value) {
                updateSliderValue(value);
              },
              max: 1,
              min: 0,
            ),
            const SizedBox(height: 8),
            const Text("Checkbox", style: TUITextStyle.heading6),
            Row(
              children: [
                TUICheckBox(
                  enableMixedState: true,
                  onChanged: (state) {
                    print("The tapped index is ${state}");
                  },
                ),
                const SizedBox(width: 20),
                TUICheckBox(
                  state: TUICheckBoxState.unchecked,
                ),
                const SizedBox(width: 20),
                TUICheckBox(
                  state: TUICheckBoxState.mixed,
                ),
                const SizedBox(width: 20),
                TUICheckBox(
                  state: TUICheckBoxState.checked,
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            const Text("CheckBoxRow", style: TUITextStyle.heading6),
            const SizedBox(height: 5.0),
            TUICheckBoxRow(
              enableMixedState: true,
              title: "Title",
              onChanged: (state) {
                print("The tapped index is $state");
              },
            ),
            TUICheckBoxRow(
              enableMixedState: true,
              title: "Title",
              backgroundDark: true,
              onChanged: (state) {
                print("The tapped index is $state");
              },
            ),
            TUICheckBoxRow(
              enableMixedState: true,
              title: "Title",
              description: "Description",
              onChanged: (state) {
                print("The tapped index is $state");
              },
            ),
            TUICheckBoxRow(
              enableMixedState: true,
              title: "Title",
              description: "Description",
              backgroundDark: true,
              onChanged: (state) {
                print("The tapped index is $state");
              },
            ),
            TUICheckBoxRow(
              enableMixedState: true,
              title: "Title",
              state: TUICheckBoxRowState.checked,
              onChanged: (state) {
                print("The tapped index is $state");
              },
            ),
            TUICheckBoxRow(
              enableMixedState: true,
              title: "Title",
              backgroundDark: true,
              state: TUICheckBoxRowState.checked,
              onChanged: (state) {
                print("The tapped index is $state");
              },
            ),
            TUICheckBoxRow(
              enableMixedState: true,
              title: "Title",
              description: "Description",
              state: TUICheckBoxRowState.checked,
              onChanged: (state) {
                print("The tapped index is $state");
              },
            ),
            TUICheckBoxRow(
              enableMixedState: true,
              title: "Title",
              description: "Description",
              backgroundDark: true,
              state: TUICheckBoxRowState.checked,
              onChanged: (state) {
                print("The tapped index is $state");
              },
            ),
            const SizedBox(height: 5.0),
            const Text("Radio Button", style: TUITextStyle.heading6),
            Row(
              children: [
                TUIRadioButton(
                  onPressed: () {
                    print("Anchor tapped");
                  },
                ),
                const SizedBox(width: 8),
                const TUIRadioButton(
                  isSelected: true,
                ),
                const SizedBox(width: 8),
                TUIRadioButton(
                  isSelected: true,
                  onPressed: () {
                    print("Anchor tapped");
                  },
                ),
                const SizedBox(width: 8),
                const TUIRadioButton()
              ],
            ),
            const Text("Anchor", style: TUITextStyle.heading6),
            TUIAnchor(
              title: "Link Text",
              onPressed: () {
                print("Anchor tapped");
              },
            ),
            const Text("Anchor with truncating text",
                style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            TUIAnchor(
              title:
                  "This is an anchor with some very long test. This should hopefully overflow the text to the next line.",
              onPressed: () {
                print("Anchor tapped");
              },
            ),
            const SizedBox(height: 8),
            const Text("Anchor text with newlines",
                style: TUITextStyle.heading6),
            TUIAnchor(
              title:
                  "This is an anchor with some very long test.\n\n This should hopefully overflow the text to the next line.",
              onPressed: () {
                print("Anchor tapped");
              },
            ),
            const SizedBox(height: 8),
            const Text("Accordion", style: TUITextStyle.heading6),
            const TUIAccordion(
                title: "Is this an accordion row?",
                subtitle:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            const SizedBox(height: 8),
            const Text("Switch", style: TUITextStyle.heading6),
            Row(
              children: [
                TUISwitch(
                  value: _enable,
                  onChanged: (bool val) {
                    setState(() {
                      _enable = val;
                    });
                  },
                ),
                const SizedBox(
                  width: 40,
                ),
                TUISwitch(
                  value: _enable,
                ),
              ],
            ),
            // TUISwitch
          ],
        ),
      ),
    );
  }
}
