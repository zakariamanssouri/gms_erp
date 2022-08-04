import 'package:flutter/material.dart';
import 'package:gms_erp/config/global_params.dart';

class ItemCardComplexe extends StatelessWidget {
  final Size size;
  VoidCallback? onPressed;
  Color? color;

  String? var1;
  String? var2;
  String? var3;
  String? var4;
  String? var5;
  String? var6;
  String? var7;

  Widget? indicator;
  Widget? additionalinfowidget;
  Color? textcolor;
  ItemCardComplexe(
      {Key? key,
      required this.size,
      this.color = GlobalParams.MainColor,
      this.var1,
      this.var2,
      this.var3,
      this.var4,
      this.var5,
      this.var6,
      this.var7,
      this.onPressed,
      this.textcolor = GlobalParams.itemCardTextColor,
      this.indicator,
      this.additionalinfowidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,


      child: Container(
        padding: EdgeInsets.all(GlobalParams.MainPadding / 4),
        width: double.infinity,
        height: size.height * 0.13,
        child: Card(
          elevation: 4,
          shadowColor: Colors.grey[300],
          // TODO:
          color: color,

          //  inventoryDetails.qty.toStringAsExponential(2).contains('0.00')
          //     ? Colors.red[400]
          //     : Colors.blue[400],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        var1 ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: textcolor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Open Sans'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      var2 ?? "",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: textcolor,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Open Sans'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        var6 ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: textcolor,
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Open Sans'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      var7 ?? "",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: textcolor,
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Open Sans'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      var3 ?? "",
                      style: TextStyle(
                          color: textcolor,
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Open Sans'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        indicator ?? Text(""),
                        Text(
                          var4 ?? "",
                          // 'Pr : ${inventoryDetails.singlePrice.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: textcolor,
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Open Sans'),
                        ),
                        Text(
                          var5 ?? "",
                          //'Qty:${inventoryDetails.qty.toStringAsFixed(3)}',
                          style: TextStyle(
                              color: textcolor,
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Open Sans'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
