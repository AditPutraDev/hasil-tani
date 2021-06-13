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

  static Widget shimmer = Shimmer(
    gradient: LinearGradient(
        begin: Alignment(-1, 0.3),
        end: Alignment(1, -0.3),
        stops: [0.25, 0.5, 0.35],
        colors: [Colors.grey.shade200, Colors.white, Colors.grey.shade200]),
    child: Container(
      color: whiteColor,
    ),
  );
}
