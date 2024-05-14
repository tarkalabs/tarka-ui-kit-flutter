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
            primary: AppColors.primary,
            onPrimary: AppColors.onPrimary,
            primaryAlt: AppColors.primaryAlt,
            onPrimaryAlt: AppColors.onPrimaryAlt,
            primaryHover: AppColors.primaryHover,
            primaryAltHover: AppColors.primaryAltHover,
            secondary: AppColors.secondary,
            onSecondary: AppColors.onSecondary,
            secondaryAlt: AppColors.secondaryAlt,
            onSecondaryAlt: AppColors.onSecondaryAlt,
            secondaryHover: AppColors.secondaryHover,
            secondaryAltHover: AppColors.secondaryAltHover,
            tertiary: AppColors.tertiary,
            onTertiary: AppColors.onTertiary,
            tertiaryAlt: AppColors.tertiaryAlt,
            onTertiaryAlt: AppColors.onTertiaryAlt,
            tertiaryHover: AppColors.tertiaryHover,
            tertiaryAltHover: AppColors.tertiaryAltHover,
            success: AppColors.success,
            onSuccess: AppColors.onSuccess,
            error: AppColors.error,
            onError: AppColors.onError,
            errorHover: AppColors.errorHover,
            warning: AppColors.warning,
            onWarning: AppColors.onWarning,
            warningHover: AppColors.warningHover,
            background: AppColors.background,
            onBackground: AppColors.onBackground,
            outline: AppColors.outline,
            disabledContent: AppColors.disabledContent,
            disabledBackground: AppColors.disabledBackground,
            disabledBackgroundHover: AppColors.disabledBackgroundHover,
            backgroundScrim: AppColors.backgroundScrim,
            link: AppColors.link,
            inputText: AppColors.inputText,
            inputBackground: AppColors.inputBackground,
            inputTextDim: AppColors.inputTextDim,
            surface: AppColors.surface,
            onSurface: AppColors.onSurface,
            surfaceVariant: AppColors.surfaceVariant,
            surfaceHover: AppColors.surfaceHover,
            surfaceVariantHover: AppColors.surfaceVariantHover,
            surfaceScrim: AppColors.surfaceScrim,
            constantLight: AppColors.constantLight,
            constantDark: AppColors.constantDark),
        TUITypography(
          xl5: AppTextStyle.xl5,
          xl4: AppTextStyle.xl4,
          xl3: AppTextStyle.xl3,
          xl2: AppTextStyle.xl2,
          xl: AppTextStyle.xl,
          lg: AppTextStyle.lg,
          base: AppTextStyle.base,
          sm: AppTextStyle.sm,
          xs: AppTextStyle.xs,
          xs2: AppTextStyle.xs2,
        ));

    var tuiDarkThemeData = TUIThemeData(
        TUIColors(
            primary: AppColors.primaryDark,
            onPrimary: AppColors.onPrimaryDark,
            primaryAlt: AppColors.primaryAltDark,
            onPrimaryAlt: AppColors.onPrimaryAltDark,
            primaryHover: AppColors.primaryHoverDark,
            primaryAltHover: AppColors.primaryAltHoverDark,
            secondary: AppColors.secondaryDark,
            onSecondary: AppColors.onSecondaryDark,
            secondaryAlt: AppColors.secondaryAltDark,
            onSecondaryAlt: AppColors.onSecondaryAltDark,
            secondaryHover: AppColors.secondaryHoverDark,
            secondaryAltHover: AppColors.secondaryAltHoverDark,
            tertiary: AppColors.tertiaryDark,
            onTertiary: AppColors.onTertiaryDark,
            tertiaryAlt: AppColors.tertiaryAltDark,
            onTertiaryAlt: AppColors.onTertiaryAltDark,
            tertiaryHover: AppColors.tertiaryHoverDark,
            tertiaryAltHover: AppColors.tertiaryAltHoverDark,
            success: AppColors.successDark,
            onSuccess: AppColors.onSuccessDark,
            error: AppColors.errorDark,
            onError: AppColors.onErrorDark,
            errorHover: AppColors.errorHoverDark,
            warning: AppColors.warningDark,
            onWarning: AppColors.onWarningDark,
            warningHover: AppColors.warningHoverDark,
            background: AppColors.backgroundDark,
            onBackground: AppColors.onBackgroundDark,
            outline: AppColors.outline,
            disabledContent: AppColors.disabledContentDark,
            disabledBackground: AppColors.disabledBackgroundDark,
            disabledBackgroundHover: AppColors.disabledBackgroundHoverDark,
            backgroundScrim: AppColors.backgroundScrimDark,
            link: AppColors.linkDark,
            inputText: AppColors.inputTextDark,
            inputBackground: AppColors.inputBackgroundDark,
            inputTextDim: AppColors.inputTextDimDark,
            surface: AppColors.surfaceDark,
            onSurface: AppColors.onSurfaceDark,
            surfaceVariant: AppColors.surfaceVariantDark,
            surfaceHover: AppColors.surfaceHoverDark,
            surfaceVariantHover: AppColors.surfaceVariantHoverDark,
            surfaceScrim: AppColors.surfaceScrimDark,
            constantLight: AppColors.constantLight,
            constantDark: AppColors.constantDark),
        TUITypography(
          xl5: AppTextStyle.xl5,
          xl4: AppTextStyle.xl4,
          xl3: AppTextStyle.xl3,
          xl2: AppTextStyle.xl2,
          xl: AppTextStyle.xl,
          lg: AppTextStyle.lg,
          base: AppTextStyle.base,
          sm: AppTextStyle.sm,
          xs: AppTextStyle.xs,
          xs2: AppTextStyle.xs2,
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
    final theme = TUITheme.of(context);
    return Scaffold(
      backgroundColor: theme.colors.surface,
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
            Text("Text Style", style: theme.typography.baseBold),
            const SizedBox(height: 8),
            const Text("XL5", style: AppTextStyle.xl5),
            const Text("XL4", style: AppTextStyle.xl4),
            const Text("XL3", style: AppTextStyle.xl3),
            const Text("XL2", style: AppTextStyle.xl2),
            const Text("XL", style: AppTextStyle.xl),
            const Text("LG", style: AppTextStyle.lg),
            const Text("BASE", style: AppTextStyle.base),
            const Text("SM", style: AppTextStyle.sm),
            const Text("XS", style: AppTextStyle.xs),
            const Text("XS2", style: AppTextStyle.xs2),
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
            Text("Avatar", style: theme.typography.baseBold),
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
            Text("Divider", style: theme.typography.baseBold),
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
            Text("Badge", style: theme.typography.baseBold),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TUIBadge(
                  content: "400",
                  badgeSize: TUIBadgeSize.l,
                ),
                TUIBadge(
                  content: "4",
                  badgeSize: TUIBadgeSize.s,
                ),
                TUIBadge(
                  content: "400",
                  badgeSize: TUIBadgeSize.xs,
                ),
                TUIBadge(
                  badgeSize: TUIBadgeSize.l,
                ),
                TUIBadge(
                  badgeSize: TUIBadgeSize.s,
                ),
                TUIBadge(
                  badgeSize: TUIBadgeSize.xs,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text("SuccessCheckMark", style: theme.typography.baseBold),
            const SizedBox(height: 8),
            const TUISuccessCheckMark(),
            const SizedBox(height: 8),
            Text("Tag-Small", style: theme.typography.baseBold),
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
            Text("Tag-Medium", style: theme.typography.baseBold),
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
            Text("Tag-Large", style: theme.typography.baseBold),
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
            Text("Text Field", style: theme.typography.baseBold),
            const SizedBox(height: 8),
            const TUIInputField(
              labelText: "Label",
              prefix: TUITextFieldStartEndItem.icon(TUISymbol.successCheckMark),
              suffix: TUITextFieldStartEndItem.icon(TUISymbol.chevronDown),
              helperText: "Helper / hint message goes here.",
            ),
            const SizedBox(height: 8),
            const TUIInputField(
              hintText: "Label",
              labelText: "Hello World",
              errorText: "Error message goes here.",
            ),
            const SizedBox(height: 8),
            TUIInputField(
                labelText: null,
                hintText: "Text Prefix and icon button Suffix",
                prefix: const TUITextFieldStartEndItem.text("\$"),
                suffix: TUITextFieldStartEndItem.iconButton(
                    icon: FluentIcons.dismiss_24_regular,
                    buttonType: TUIIconButtonType.ghost,
                    onButtonTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(TUISnackBar(
                        context: context,
                        type: TUISnackBarType.information,
                        message: "Suffix icon clicked",
                        action: TUISnackBarAction.dismiss("Dismiss"),
                      ));
                    })),
            const SizedBox(height: 8),
            Text("Chips", style: theme.typography.baseBold),
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
            Text("Breadcrumb", style: theme.typography.baseBold),
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
            Text("Icon Button", style: theme.typography.baseBold),
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
            Text("Snackbar", style: theme.typography.baseBold),
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
            Text("Media Thumbnail", style: theme.typography.baseBold),
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
            Text("Checkbox", style: theme.typography.baseBold),
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
            Text("CheckBoxRow", style: theme.typography.baseBold),
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
            Text("Radio Button", style: theme.typography.baseBold),
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
            Text("Anchor", style: theme.typography.baseBold),
            TUIAnchor(
              title: "Link Text",
              onPressed: () {},
            ),
            Text("Anchor with truncating text",
                style: theme.typography.baseBold),
            const SizedBox(height: 8),
            TUIAnchor(
              title:
                  "This is an anchor with some very long test. This should hopefully overflow the text to the next line.",
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            Text("Anchor text with newlines", style: theme.typography.baseBold),
            TUIAnchor(
              title:
                  "This is an anchor with some very long test.\n\n This should hopefully overflow the text to the next line.",
              onPressed: () {},
            ),
            const SizedBox(height: 8),
            Text("Accordion", style: theme.typography.baseBold),
            const TUIAccordion(
                title: "Is this an accordion row?",
                subtitle:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
            const SizedBox(height: 8),
            Text("Switch", style: theme.typography.baseBold),
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
            Text("Email Field", style: theme.typography.baseBold),
            const SizedBox(height: 8),
            // TUISwitch
            TUIEmailField(
              emails: const [],
              showSuffix: true,
              onAdd: () {},
            ),
            const SizedBox(height: 8),
            Text("Attachment Upload With Description",
                style: theme.typography.baseBold),
            TUIAttachmentUpload(
              title: "Title",
              description: "This is a long description to test overflow.",
              isIconUsed: true,
              icon: FluentIcons.access_time_20_filled,
              downloadTapped: () {},
              deleteTapped: () {},
            ),
            Text("Attachment Upload", style: theme.typography.baseBold),
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
            Text("Draggable Card", style: theme.typography.baseBold),
            const SizedBox(height: 8),
            const TUIDraggableCard(
              child: Text("Hello"),
            ),
            const TUIDraggableCard(
              backgroundDark: true,
              child: Text("Hello"),
            ),
            const SizedBox(height: 8),
            Text("Email Subject Field", style: theme.typography.baseBold),
            const SizedBox(height: 8),
            TUIEmailSubjectField(
              onTextChanged: (String text) {},
            ),
            const SizedBox(height: 8),
            Text("Menu Item", style: theme.typography.baseBold),
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
            Text("Navigation Row", style: theme.typography.baseBold),
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
            Text("Button Block", style: theme.typography.baseBold),
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
            Text("Mobile Overlay Header", style: theme.typography.baseBold),
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
            Text("Selection Card", style: theme.typography.baseBold),
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
            Text("Toggle Row", style: theme.typography.baseBold),
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
            Text("Search Bar", style: theme.typography.baseBold),
            const SizedBox(height: 8),
            const TUISearchBar(
              showBackIcon: true,
            ),
            const SizedBox(height: 8),
            const TUISearchBar(
              showBackIcon: true,
              showClearButton: true,
            ),
            const SizedBox(height: 8),
            TUISearchBar(
              showBackIcon: false,
              showClearButton: true,
              onChanged: (String value) {},
              autofocus: true,
            ),
            const SizedBox(height: 8),
            Text("Radio Row", style: theme.typography.baseBold),
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
            Text("Overlay Menu Non Scrolling",
                style: theme.typography.baseBold),
            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                          20.0), // Adjust the top corner radius here
                    ),
                  ),
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(
                            20.0), // Match the radius with the shape
                      ),
                      child: TUIMobileOverlayMenu(
                        title: "title",
                        action: () {
                          print("tapped");
                        },
                        isScrollable: false,
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
              child: const Text('Show Modal Bottom Sheet'),
            ),

            const SizedBox(height: 8),
            Text("Overlay Menu Non Scrolling",
                style: theme.typography.baseBold),
            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                          20.0), // Adjust the top corner radius here
                    ),
                  ),
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(
                            20.0), // Match the radius with the shape
                      ),
                      child: TUIMobileOverlayMenu(
                        title: "title",
                        action: () {
                          print("tapped");
                        },
                        isScrollable: true,
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
                          ),
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
                          ),
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
                          ),
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
                          ),
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
                          ),
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
                          ),
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
                          ),
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
              child: const Text('Show Modal Bottom Sheet - Scrollable'),
            ),
            const SizedBox(height: 8),
            Text("Date Picker", style: theme.typography.baseBold),
            const SizedBox(height: 8),
            TUIDatePicker(
              labelText: "Label Text",
              dateSelected: (date) {
                print(date);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            // TUIFilePicker(),
            TUIFilePicker(
              title: "Pick file",
              filesPicked: (files) {
                print(files);
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
