
import 'package:flutter/cupertino.dart';


class RowDoubleImage extends StatelessWidget {

  final String first;
  final String second;

  const RowDoubleImage({Key? key, required this.first, required this.second}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
                top: 12,
                right: 6,
                bottom: 6,
                left: 12
            ),
            child: Image.network(first),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
                top: 6,
                right: 12,
                bottom: 6,
                left: 6
            ),
            child: Image.network(second),
          ),
        ),
      ],
    );
  }

}
