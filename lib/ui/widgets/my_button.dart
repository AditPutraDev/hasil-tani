part of 'widgets.dart';

class MyRaisedButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  final Function() onPressed;
  final bool isLoading;
  final Alignment alignment;
  final double? elevation;

  const MyRaisedButton({
    Key? key,
    required this.title,
    this.icon,
    this.color,
    this.textColor,
    required this.onPressed,
    this.isLoading = false,
    this.alignment = Alignment.centerRight,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SizedBox(
            height: 48,
            child: SpinKitThreeBounce(
              color: Color(0xFF43A8FC),
              size: 14,
            ),
          )
        : Align(
            alignment: alignment,
            child: CustomElevation(
              elevation: elevation,
              borderRadius: 100,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding:
                      EdgeInsets.fromLTRB(30, 15, icon != null ? 15 : 30, 15),
                  backgroundColor: color ?? greenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: textColor ?? Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    if (icon != null)
                      Padding(
                        padding: EdgeInsets.only(left: 13),
                        child: Icon(
                          icon,
                          color: textColor ?? Colors.white,
                        ),
                      ),
                  ],
                ),
                onPressed: onPressed,
              ),
            ),
          );
  }
}
