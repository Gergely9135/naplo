import 'package:refilc/theme/colors/colors.dart';
import 'package:refilc/ui/widgets/grade/grade_tile.dart';
import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_extension.dart';

class AverageDisplay extends StatelessWidget {
  const AverageDisplay({super.key, this.average = 0.0, this.border = false});

  final double average;
  final bool border;

  @override
  Widget build(BuildContext context) {
    Color color = average == 0.0
        ? AppColors.of(context).text.withOpacity(.8)
        : gradeColor(context: context, value: average);

    String averageText = average.toStringAsFixed(2);
    if (I18n.of(context).locale.languageCode != "en") {
      averageText = averageText.replaceAll(".", ",");
    }

    return Container(
      width: border ? 57.0 : 54.0,
      padding: EdgeInsets.symmetric(
          horizontal: 6.0 - (border ? 2 : 0), vertical: 5.0 - (border ? 2 : 0)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45.0),
        border: border
            ? Border.fromBorderSide(
                BorderSide(color: color.withOpacity(.5), width: 1.0))
            : null,
        color: !border ? color.withOpacity(average == 0.0 ? .15 : .25) : null,
      ),
      child: Text(
        average == 0.0 ? "-" : averageText,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: color, fontWeight: FontWeight.w600, fontSize: 15.0),
        maxLines: 1,
      ),
    );
  }
}
