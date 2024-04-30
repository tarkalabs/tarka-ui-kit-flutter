import 'package:example/styles/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:tarka_ui/tarka_ui.dart';

import 'styles/text_style.dart';
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

    var tuiDarkThemeData = TUIThemeData(
        TUIColors(
            AppColors.primaryDark,
            AppColors.onPrimaryDark,
            AppColors.primaryAltDark,
            AppColors.onPrimaryAltDark,
            AppColors.primaryHoverDark,
            AppColors.primaryAltHoverDark,
            AppColors.secondaryDark,
            AppColors.onSecondaryDark,
            AppColors.secondaryAltDark,
            AppColors.onSecondaryAltDark,
            AppColors.secondaryHoverDark,
            AppColors.secondaryAltHoverDark,
            AppColors.tertiaryDark,
            AppColors.onTertiaryDark,
            AppColors.tertiaryAltDark,
            AppColors.onTertiaryAltDark,
            AppColors.tertiaryHoverDark,
            AppColors.tertiaryAltHoverDark,
            AppColors.successDark,
            AppColors.onSuccessDark,
            AppColors.success10Dark,
            AppColors.success20Dark,
            AppColors.errorDark,
            AppColors.onErrorDark,
            AppColors.error10Dark,
            AppColors.errorHoverDark,
            AppColors.warningDark,
            AppColors.onWarningDark,
            AppColors.warning10Dark,
            AppColors.warningHoverDark,
            AppColors.backgroundDark,
            AppColors.onBackgroundDark,
            AppColors.outline,
            AppColors.disabledContentDark,
            AppColors.disabledBackgroundDark,
            AppColors.disabledBackgroundHoverDark,
            AppColors.linkDark,
            AppColors.inputTextDark,
            AppColors.inputBackgroundDark,
            AppColors.inputTextDimDark,
            AppColors.surfaceDark,
            AppColors.surface50Dark,
            AppColors.onSurfaceDark,
            AppColors.surfaceVariantDark,
            AppColors.surfaceHoverDark,
            AppColors.surfaceVariantHoverDark,
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
      darkTheme: tuiDarkThemeData,
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
              onRightIconTap: () {},
              badgeValue: "4",
            ),
            const SizedBox(height: 8),
            TUIChip(
              leftIcon: Icons.abc_outlined,
              title: "Chip",
              size: TUIChipSize.m,
              rightIcon: Icons.access_alarm,
              onRightIconTap: () {},
              badgeValue: "4",
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                TUIChip(
                  leftIcon: Icons.abc_outlined,
                  title: "Suggestion Chip",
                  size: TUIChipSize.l,
                  onRightIconTap: () {},
                  highlighted: false,
                ),
                const SizedBox(width: 24),
                TUIChip(
                  leftIcon: Icons.abc_outlined,
                  title: "Chip",
                  size: TUIChipSize.m,
                  rightIcon: Icons.access_alarm,
                  onRightIconTap: () {},
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
              onTap: (index) {},
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
                            label: "Retry", onActionPressed: () {}),
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
                  onPressed: () {},
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
                  onPressed: () {},
                ),
                TUIMediaThumbnail(
                  size: TUIMediaThumbnailSize.large,
                  mediaType: TUIMediaThumbnailType.document,
                  onPressed: () {},
                ),
                TUIMediaThumbnail(
                  size: TUIMediaThumbnailSize.large,
                  mediaType: TUIMediaThumbnailType.photo,
                  isSelectable: false,
                  onPressed: () {},
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
              onChangeStart: (value) => {},
              onChangeEnd: (value) => {},
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
                  onChanged: (state) {},
                ),
                const SizedBox(width: 20),
                const TUICheckBox(
                  state: TUICheckBoxState.unchecked,
                ),
                const SizedBox(width: 20),
                const TUICheckBox(
                  state: TUICheckBoxState.mixed,
                ),
                const SizedBox(width: 20),
                const TUICheckBox(
                  state: TUICheckBoxState.checked,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            const Text("CheckBoxRow", style: TUITextStyle.heading6),
            const SizedBox(height: 8.0),
            TUICheckBoxRow(
              enableMixedState: true,
              title: "Title",
              onChanged: (state) {},
            ),
            TUICheckBoxRow(
              enableMixedState: true,
              title: "Title",
              backgroundDark: true,
              onChanged: (state) {},
            ),
            const TUICheckBoxRow(
              enableMixedState: true,
              title: "Title",
              description: "Description",
              state: TUICheckBoxRowState.checked,
            ),
            TUICheckBoxRow(
              enableMixedState: true,
              title: "Title",
              description: "Description",
              backgroundDark: true,
              onChanged: (state) {},
            ),
            const TUICheckBoxRow(
              enableMixedState: true,
              title: "Title",
              state: TUICheckBoxRowState.checked,
            ),
            TUICheckBoxRow(
              enableMixedState: true,
              title: "Title",
              backgroundDark: true,
              state: TUICheckBoxRowState.checked,
              onChanged: (state) {},
            ),
            const TUICheckBoxRow(
              enableMixedState: true,
              title: "Title",
              description: "Description",
              state: TUICheckBoxRowState.mixed,
            ),
            TUICheckBoxRow(
              enableMixedState: true,
              title: "Title",
              description: "Description",
              backgroundDark: true,
              state: TUICheckBoxRowState.checked,
              onChanged: (state) {},
            ),
            const SizedBox(height: 8.0),
            const Text("Radio Button", style: TUITextStyle.heading6),
            Row(
              children: [
                TUIRadioButton(
                  onPressed: (isSelected) {
                    print(isSelected);
                  },
                ),
                const SizedBox(width: 8),
                const TUIRadioButton(
                  isSelected: true,
                ),
                const SizedBox(width: 8),
                TUIRadioButton(
                  isSelected: true,
                  onPressed: (isSelected) {
                    print(isSelected);
                  },
                ),
                const SizedBox(width: 8),
                const TUIRadioButton()
              ],
            ),
            const Text("Anchor", style: TUITextStyle.heading6),
            TUIAnchor(
              title: "Link Text",
              onPressed: () {},
            ),
            const Text("Anchor with truncating text",
                style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            TUIAnchor(
              title:
                  "This is an anchor with some very long test. This should hopefully overflow the text to the next line.",
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            const Text("Anchor text with newlines",
                style: TUITextStyle.heading6),
            TUIAnchor(
              title:
                  "This is an anchor with some very long test.\n\n This should hopefully overflow the text to the next line.",
              onPressed: () {},
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
                TUIToggleSwitch(
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
                TUIToggleSwitch(
                  value: _enable,
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text("Email Field", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            // TUISwitch
            TUIEmailField(
              emails: const [],
              showSuffix: true,
              onAdd: () {},
            ),
            const SizedBox(height: 8),
            const Text("Attachment Upload With Description",
                style: TUITextStyle.heading6),
            TUIAttachmentUpload(
              title: "Title",
              description: "This is a long description to test overflow.",
              isIconUsed: true,
              icon: FluentIcons.access_time_20_filled,
              downloadTapped: () {},
              deleteTapped: () {},
            ),
            const Text("Attachment Upload", style: TUITextStyle.heading6),
            TUIAttachmentUpload(
              title: "Title",
              isIconUsed: false,
              image: TUIImage(
                imageUrl:
                    "https://images.unsplash.com/photo-1579353977828-2a4eab540b9a",
                height: TUIMediaThumbnailSize.large.height,
                width: TUIMediaThumbnailSize.large.width,
                fit: BoxFit.fill,
              ),
            ),
            const Text("Draggable Card", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            const TUIDraggableCard(
              child: Text("Hello"),
            ),
            const TUIDraggableCard(
              backgroundDark: true,
              child: Text("Hello"),
            ),
            const SizedBox(height: 8),
            const Text("Email Subject Field", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            TUIEmailSubjectField(
              onTextChanged: (String text) {},
            ),
            const SizedBox(height: 8),
            const Text("Menu Item", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            TUIMenuItem(
              item: TUIMenuItemProperties(
                title: "Item",
                style: TUIMenuItemStyle.none,
              ),
              action: (state) {},
            ),
            const SizedBox(height: 8),
            TUIMenuItem(
              item: TUIMenuItemProperties(
                title: "Item",
                style: TUIMenuItemStyle.none,
              ),
              backgroundDark: true,
            ),
            const SizedBox(height: 8),
            TUIMenuItem(
              item: TUIMenuItemProperties(
                title: "Item",
                style: TUIMenuItemStyle.onlyRight,
              ),
            ),
            const SizedBox(height: 8),
            TUIMenuItem(
              item: TUIMenuItemProperties(
                title: "Item",
                style: TUIMenuItemStyle.onlyRight,
              ),
              backgroundDark: true,
            ),
            const SizedBox(height: 8),
            TUIMenuItem(
              item: TUIMenuItemProperties(
                title: "Item",
                style: TUIMenuItemStyle.onlyLeft,
              ),
              onLeftTap: (state) {},
            ),
            const SizedBox(height: 8),
            TUIMenuItem(
              item: TUIMenuItemProperties(
                title: "Item",
                style: TUIMenuItemStyle.onlyLeft,
              ),
              backgroundDark: true,
            ),
            const SizedBox(height: 8),
            TUIMenuItem(
              item: TUIMenuItemProperties(
                title: "Item",
                style: TUIMenuItemStyle.both,
              ),
            ),
            const SizedBox(height: 8),
            TUIMenuItem(
              item: TUIMenuItemProperties(
                title: "Item",
                style: TUIMenuItemStyle.both,
              ),
              backgroundDark: true,
            ),
            const SizedBox(height: 8),
            TUIMenuItem(
              item: TUIMenuItemProperties(
                title: "Item",
                style: TUIMenuItemStyle.onlyRight,
                state: TUIMenuItemState.rightChecked,
              ),
            ),
            const SizedBox(height: 8),
            TUIMenuItem(
              item: TUIMenuItemProperties(
                title: "Item",
                style: TUIMenuItemStyle.onlyRight,
                state: TUIMenuItemState.rightChecked,
              ),
              backgroundDark: true,
            ),
            const SizedBox(height: 8),
            TUIMenuItem(
              item: TUIMenuItemProperties(
                title: "Item",
                style: TUIMenuItemStyle.onlyLeft,
                state: TUIMenuItemState.leftChecked,
              ),
              onLeftTap: (state) {},
            ),
            const SizedBox(height: 8),
            TUIMenuItem(
              item: TUIMenuItemProperties(
                title: "Item",
                style: TUIMenuItemStyle.onlyLeft,
                state: TUIMenuItemState.leftChecked,
              ),
              backgroundDark: true,
            ),
            const SizedBox(height: 8),
            TUIMenuItem(
              item: TUIMenuItemProperties(
                title: "Item",
                style: TUIMenuItemStyle.both,
                state: TUIMenuItemState.leftChecked,
              ),
            ),
            const SizedBox(height: 8),
            TUIMenuItem(
              item: TUIMenuItemProperties(
                title: "Item",
                style: TUIMenuItemStyle.both,
                state: TUIMenuItemState.leftChecked,
              ),
              backgroundDark: true,
            ),
            const SizedBox(height: 8),
            const Text("Navigation Row", style: TUITextStyle.heading6),
            SizedBox(
              height: 40,
              child: TUINavigationRow(
                title:
                    "hello world, hello world, hello world, hello world, hello world, hello world, hello world, ",
                icon: FluentIcons.fluent_20_filled,
                accessoryView: Container(
                  width: 80,
                  height: 60,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.yellow, // Set your desired background color
                    borderRadius:
                        BorderRadius.circular(8.0), // Set the border radius
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text("Button Block", style: TUITextStyle.heading6),
            TUIMobileButtonBlock(
              style: TUIMobileButtonBlockStyle(
                style: Style.one,
                button: TUIButton(
                    type: TUIButtonType.outlined,
                    label: "Error",
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(TUISnackBar(
                        context: context,
                        type: TUISnackBarType.error,
                        message: "This is an error Snackbar with action",
                        action: TUISnackBarAction(
                            label: "Retry", onActionPressed: () {}),
                      ));
                    }),
              ),
            ),
            TUIMobileButtonBlock(
              style: TUIMobileButtonBlockStyle(
                style: Style.flexible,
                left: TUIButton(
                  label: "Button",
                  type: TUIButtonType.outlined,
                  size: TUIButtonSize.l,
                  onPressed: () {},
                ),
                right: TUIButton(
                  label: "Button",
                  type: TUIButtonType.outlined,
                  size: TUIButtonSize.l,
                  onPressed: () {},
                ),
              ),
            ),
            TUIMobileButtonBlock(
              style: TUIMobileButtonBlockStyle(
                style: Style.two,
                left: TUIButton(
                  label: "Button",
                  type: TUIButtonType.outlined,
                  size: TUIButtonSize.l,
                  onPressed: () {},
                ),
                right: TUIButton(
                  label: "Button",
                  type: TUIButtonType.outlined,
                  size: TUIButtonSize.l,
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text("Mobile Overlay Header", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            TUIMobileOverlayHeader(
                style: TUIOverlayMobileStyle(
              style: TUIOverlayMobileStyleType.handle,
            )),
            const SizedBox(height: 8),
            TUIMobileOverlayHeader(
              style: TUIOverlayMobileStyle(
                  style: TUIOverlayMobileStyleType.left,
                  title: "Hello",
                  action: () {}),
            ),
            const SizedBox(height: 8),
            TUIMobileOverlayHeader(
              style: TUIOverlayMobileStyle(
                  style: TUIOverlayMobileStyleType.onlyTitle, title: "Hello"),
            ),
            const SizedBox(height: 8),
            TUIMobileOverlayHeader(
              style: TUIOverlayMobileStyle(
                  style: TUIOverlayMobileStyleType.right,
                  title: "right",
                  icon: FluentIcons.access_time_20_filled,
                  action: () {}),
            ),
            const SizedBox(height: 8),
            const Text("Selection Card", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            TUISelectionCard(
              style: TUISelectionCardStyle(
                title: "Label",
                description: ["Description", "Description"],
                footer: "Label",
              ),
              icon: FluentIcons.guest_24_regular,
              badgeCount: 4,
              action: () {},
            ),
            const SizedBox(height: 8),
            TUISelectionCard(
              style: TUISelectionCardStyle(
                title: "Label",
                description: ["Description", "Description"],
                footer: "Label",
              ),
              icon: FluentIcons.guest_24_regular,
              badgeCount: 4,
              isHovered: true,
              action: () {},
            ),
            const SizedBox(height: 8),
            TUISelectionCard(
              style: TUISelectionCardStyle(
                title: "Label",
                description: ["Description", "Description"],
                footer: "Label",
              ),
              icon: FluentIcons.guest_24_regular,
              badgeCount: 4,
              isSelected: true,
              action: () {},
            ),
            const SizedBox(height: 8),
            TUISelectionCard(
              style: TUISelectionCardStyle(
                title: "Label",
                description: ["Description", "Description"],
                footer: "Label",
              ),
              icon: FluentIcons.guest_24_regular,
              badgeCount: 4,
              isSelected: true,
              isHovered: true,
              action: () {},
            ),
            const SizedBox(height: 8),
            const Text("Toggle Row", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            TUIToggleRow(
              title: "Title",
              value: _enable,
              onChanged: (value) {
                setState(() {
                  _enable = value;
                });
              },
            ),
            const SizedBox(height: 8),
            TUIToggleRow(
              title: "Title",
              value: true,
              backgroundDark: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 8),
            const TUIToggleRow(
              title: "Title",
              description:
                  "Description for this menu item that goes up-to two lines",
              value: false,
            ),
            const SizedBox(height: 8),
            TUIToggleRow(
              title: "Title",
              description:
                  "Description for this menu item that goes up-to two lines",
              value: false,
              backgroundDark: true,
              onChanged: (value) {
                setState(() {
                  _enable = value;
                });
              },
            ),
            const SizedBox(height: 8),
            TUIToggleRow(
              title: "Hello",
              value: false,
              icon: const Icon(FluentIcons.guest_24_filled),
              onChanged: (value) {
                setState(() {
                  _enable = value;
                });
              },
            ),
            const SizedBox(height: 8),
            TUIToggleRow(
              title: "Hello",
              value: false,
              icon: const Icon(FluentIcons.guest_24_filled),
              backgroundDark: true,
              onChanged: (value) {
                setState(() {
                  _enable = value;
                });
              },
            ),
            const SizedBox(height: 8),
            TUIToggleRow(
              title: "Hello",
              description:
                  "Description for this menu item that goes up-to two lines",
              value: false,
              icon: const Icon(FluentIcons.guest_24_filled),
              onChanged: (value) {
                setState(() {
                  _enable = value;
                });
              },
            ),
            const SizedBox(height: 8),
            TUIToggleRow(
              title: "Hello",
              description:
                  "Description for this menu item that goes up-to two lines",
              value: false,
              icon: const Icon(FluentIcons.guest_24_filled),
              backgroundDark: true,
              onChanged: (value) {
                setState(() {
                  _enable = value;
                });
              },
            ),
            const SizedBox(height: 8),
            const Text("Search Bar", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            const TUISearchBar(
              showBackIcon: true,
            ),
            const SizedBox(height: 8),
            const TUISearchBar(
              showBackIcon: true,
              showTrailingIcon: true,
            ),
            const SizedBox(height: 8),
            TUISearchBar(
              showBackIcon: false,
              showTrailingIcon: true,
              onChanged: (String value) {},
              autofocus: true,
            ),
            const SizedBox(height: 8),
            const Text("Radio Row", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            TUIRadioRow(
              title: "title",
              description: "description",
              isSelected: true,
              onPressed: (isSelected) {
                print(isSelected);
              },
            ),

            TUIRadioRow(
              title: "title",
              description: "description",
              backgroundDark: true,
              isSelected: false,
              onPressed: (isSelected) {
                print(isSelected);
              },
            ),

            const SizedBox(height: 8),
            const Text("Overlay Menu", style: TUITextStyle.heading6),
            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                          20.0), // Adjust the top corner radius here
                    ),
                  ),
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                            20.0), // Match the radius with the shape
                      ),
                      child: TUIMobileOverlayMenu(
                        title: "title",
                        action: () {
                          print("tapped");
                        },
                        menuItems: [
                          TUIMenuItem(
                            item: TUIMenuItemProperties(
                              title: "Item 1",
                              style: TUIMenuItemStyle.both,
                              state: TUIMenuItemState.unchecked,
                            ),
                            backgroundDark: true,
                          ),
                          TUIMenuItem(
                            item: TUIMenuItemProperties(
                              title: "Item 2",
                              style: TUIMenuItemStyle.none,
                              state: TUIMenuItemState.unchecked,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text('Show Modal Bottom Sheet'),
            ),
            const SizedBox(height: 8),
            const Text("Date Picker", style: TUITextStyle.heading6),
            const SizedBox(height: 8),
            TUIDatePicker(
              labelText: "Label Text",
              dateSelected: (date) {
                print(date);
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
