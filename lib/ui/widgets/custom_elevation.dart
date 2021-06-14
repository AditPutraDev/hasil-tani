part of 'widgets.dart';

class CustomElevation extends StatelessWidget {
  final Widget? child;
  final double? borderRadius;
  final double? elevation;

  CustomElevation({@required this.child, this.borderRadius, this.elevation})
      : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: greenColor.withAlpha(100),
            blurRadius: elevation ?? 20,
            offset: Offset(0, elevation == 0 ? 0 : 6),
          ),
        ],
      ),
      child: this.child,
    );
  }
}
