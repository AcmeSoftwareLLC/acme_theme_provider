import 'package:flutter/material.dart';
import 'package:playground/components/card.dart';

class PlayGroundCards extends StatelessWidget {
  const PlayGroundCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FirstCard(
            child: const Text(
              'Lorem ipsum dolor sit amet. 33 aperiam rerum vel sint veniam nam dolor placeat! Aut quis sint aut repellat dolorum 33 minus accusamus.',
            ),
          ),
          const SecondCard(
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                'Lorem ipsum dolor sit amet. Non vero voluptatem 33 impedit dolores eos unde soluta aut adipisci vitae qui nesciunt assumenda sed rerum aliquam. Et internos animi ex reiciendis iusto ut deleniti rerum sed deleniti libero ut praesentium tempora in amet ducimus.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
