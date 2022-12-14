import 'package:flutter/material.dart';

import '../../model/Address_model.dart';
import '../styles/style.dart';

class AddressWidget extends StatelessWidget {
  AddressModel? model;
  AddressWidget({Key? key,required this.model }) : super(key: key);
   // AddressModel model=AddressModel();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return  Container(
      decoration: BoxDecoration(
          color: backGroundColor,
          border: Border.all(color: Colors.grey.withOpacity(0.8)),
          borderRadius:
          const BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Row(
          children: [
            Container(
              height: mediaQuery.height / 18,
              width: mediaQuery.width / 10,
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius:
                  BorderRadius.all(Radius.circular(10))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 7.0, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    '${model!.name}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  Text(
                    '${model!.street}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
