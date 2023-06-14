import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String nameCard;
  final AssetImage imageCard;
  final String raCard;

  const ProfileCard({
    Key? key,
    required this.nameCard,
    required this.imageCard,
    required this.raCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              CircleAvatar(
                foregroundImage:
                imageCard,
                radius: 28,
              ),
              const SizedBox(
                width: 24,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameCard,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    raCard,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
