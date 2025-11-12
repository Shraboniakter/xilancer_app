import 'package:flutter/material.dart';

class UseableCard extends StatelessWidget {
  UseableCard({super.key});
  final ValueNotifier<bool> isFavorite = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            width: 302,
            height: 346,
            decoration: BoxDecoration(
              color:Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Color(0xffFFFFFF),
                width: 3,
              ),

            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)), // ইমেজকেও একই রেডিয়াসে কাটবে
                  child: Image.asset(
                    'assets/images/Image.png',
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: 172,
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child:  ValueListenableBuilder<bool>(
                    valueListenable: isFavorite,
                    builder: (context, value, _) {
                      return GestureDetector(
                        onTap: () {
                          // toggle value
                          isFavorite.value = !isFavorite.value;
                        },

                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color:Color(0xffFFFFFF),


                              ),
                            ],
                          ),
                          child:Icon(
                            value ? Icons.favorite : Icons.favorite_border,
                            color:
                            value ? Colors.red : const Color(0xff3B4759),
                            size: 22,
                          ),
                        ),

                      );

                    },


                  ),
                ),


              ],

            ),

          ),
        )
    );
  }
}
