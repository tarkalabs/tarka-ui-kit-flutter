import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

enum Symbol {
  chevronDown(FluentIcons.chevron_down_48_regular),
  chevronRight(FluentIcons.chevron_right_48_regular),
  chevronLeft(FluentIcons.chevron_left_48_regular),
  checkmarkStarburst(FluentIcons.checkmark_starburst_24_regular),
  copy(FluentIcons.copy_32_regular),
  delete(FluentIcons.delete_48_regular),
  dismiss(FluentIcons.dismiss_48_regular),
  document(FluentIcons.document_48_regular),
  documentDownload(FluentIcons.document_header_arrow_down_24_regular),
  documentError(FluentIcons.document_error_24_regular),
  export(FluentIcons.arrow_export_up_24_regular),
  map(FluentIcons.map_24_regular),
  questionCircle(FluentIcons.question_circle_48_regular),
  refresh(FluentIcons.arrow_counterclockwise_48_regular),
  reorderDots(FluentIcons.re_order_dots_vertical_24_regular),
  search(FluentIcons.search_48_regular),
  shield(FluentIcons.shield_48_regular),
  sync(FluentIcons.arrow_sync_circle_24_regular),
  tabs(FluentIcons.tabs_24_regular),
  hamburgerMenu(FluentIcons.line_horizontal_3_20_filled);

  final IconData value;

  const Symbol(this.value);
}
