import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchLocationHeader extends StatelessWidget {
  const SearchLocationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: const SizedBox(
              width: 20,
              child: Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Choose Location',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
