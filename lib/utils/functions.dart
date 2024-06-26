import 'package:flutter/material.dart';
import 'package:ornamental/widget/desccard.dart';

Widget plantdescriptions(String type) {
  if (type == 'Rain Lily') {
    return const Descriptioncard(
      tittle: "Rain Lily",
      description:
          "Are you looking forward to developing a plant identification application? What are you waiting for",
      planttype: "Herbal",
      icontype: Icon(
        Icons.spa_outlined,
        color: Colors.green,
      ),
    );
  } else if (type == 'Zinnia Elegans') {
    return const Descriptioncard(
      tittle: "Zinnia Elegans",
      description:
          "Are you looking forward to developing a plant identification application? What are you waiting for",
      planttype: "Unknown",
      icontype: Icon(
        Icons.local_florist_outlined,
        color: Colors.green,
      ),
    );
  } else if (type == 'Mirabilis Jalapa') {
    return const Descriptioncard(
      tittle: "Mirabilis Jalapa",
      description:
          "Are you looking forward to developing a plant identification application? What are you waiting for",
      planttype: "Flower",
      icontype: Icon(
        Icons.filter_vintage_outlined,
        color: Colors.green,
      ),
    );
  } else {
    return Container();
  }
}
