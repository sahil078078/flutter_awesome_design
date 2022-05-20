import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15, right: 10),
          padding: const EdgeInsets.only(left: 10, right: 10),
          width: size.width * 0.75,
          height: size.height * 0.062,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.black54,
              width: 1.5,
            ),
          ),
          child: Center(
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 45,
          width: 45,
          margin: const EdgeInsets.only(right: 15),
          decoration: const BoxDecoration(
              color: Colors.black12, shape: BoxShape.circle),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset('assets/icons/shoping.png'),
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
