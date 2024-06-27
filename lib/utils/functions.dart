import 'package:flutter/material.dart';
import 'package:ornamental/widget/desccard.dart';

Widget plantdescriptions(String type) {
  if (type == 'Santan') {
    return const Descriptioncard(
      tittle: "Santan",
      description:
          "Ixora coccinea is a species of flowering plant in the family Rubiaceae. It is a common flowering shrub",
      planttype: "Shrub",
      icontype: Icon(
        Icons.spa_outlined,
        color: Colors.green,
      ),
    );
  } else if (type == 'Lantana') {
    return const Descriptioncard(
      tittle: "Lantana",
      description:
          "Lantana is a genus of about 150 species of perennial flowering plants in the verbena family, Verbenaceae.",
      planttype: "Shrub",
      icontype: Icon(
        Icons.spa_outlined,
        color: Colors.green,
      ),
    );
  } else if (type == 'Pandakaki') {
    return const Descriptioncard(
      tittle: "Pandakaki",
      description:
          "Tabernaemontana pandacaqui, known as windmill bush and banana bush, is a species of plant in the dogbane family",
      planttype: "Shrub",
      icontype: Icon(
        Icons.spa_outlined,
        color: Colors.green,
      ),
    );
  } else if (type == 'Blue Ternate') {
    return const Descriptioncard(
      tittle: "Blue Ternate",
      description:
          "Blue Ternate is a plant species belonging to the family Fabaceae, endemic and native to the Indonesian island",
      planttype: "Herbal",
      icontype: Icon(
        Icons.filter_vintage_outlined,
        color: Colors.green,
      ),
    );
  } else {
    return Container();
  }
}
