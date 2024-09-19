import 'package:flutter/material.dart';
import 'package:todo_mobile/res/app_colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      borderSide:
                          const BorderSide(color: AppColors.colorTextField)),
                  hintText: "Saerch",
                  hintStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: AppColors.colorSearchIcon,
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: AppColors.colorSearchIcon,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
