import 'package:gms_erp/config/global_params.dart';
import 'package:flutter/material.dart';

class TitleAndButton extends StatelessWidget {
  const TitleAndButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(GlobalParams.MainPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "inventories list".toUpperCase(),
                style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
