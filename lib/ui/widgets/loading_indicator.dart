part of 'widgets.dart';

class Loading {
  static Widget circular({Color? color}) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? greenColor,
        ),
      ),
    );
  }

  static Widget threeBounce = SizedBox(
    height: 48,
    child: SpinKitThreeBounce(
      color: greenColor,
      size: 14,
    ),
  );
}
