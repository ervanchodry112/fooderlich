import 'package:flutter/material.dart';
import 'package:fooderlich/db/db_provider.dart';

import '../models/models.dart';

class RecipeThumbnail extends StatefulWidget {
  final SimpleRecipe recipe;

  const RecipeThumbnail({
    super.key,
    required this.recipe,
  });

  @override
  RecipeThumbnailState createState() {
    return RecipeThumbnailState();
  }
}

class RecipeThumbnailState extends State<RecipeThumbnail> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    widget.recipe.dishImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          if (!_isFavorited) {
                            DBProvider.db.addResep(widget.recipe);
                          }
                          if (_isFavorited) {
                            DBProvider.db.delResep(widget.recipe.id);
                          }
                          setState(() {
                            _isFavorited = !_isFavorited;
                          });
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: _isFavorited ? Colors.red : Colors.grey,
                        ),
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.recipe.title!,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            widget.recipe.duration!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
