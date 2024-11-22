import 'package:flutter/material.dart';

class HeaderListWidget extends StatelessWidget {
  const HeaderListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: const BoxDecoration(
          color: Color(0XFFEDEFFB),
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        ),
        child: Row(children: [
          const Text(
            'Foto',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          const SizedBox(
            width: 20,
          ),
          const Text(
            'Nome',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('assets/dot.png'),
          ),
        ]));
  }
}
