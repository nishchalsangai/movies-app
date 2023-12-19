
import 'package:flutter/material.dart';
import 'package:movies_app/modules/movies/domain/entity/grid_data.dart';

class GridCategoryCard extends StatelessWidget {
  const GridCategoryCard({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: AssetImage(gridValues[index].path), fit: BoxFit.cover),
        ),
        child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 13),
              child: Text(
                gridValues[index].name,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            )),
      ),
    );
  }
}
