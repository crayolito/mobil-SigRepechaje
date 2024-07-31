import 'package:flutter/material.dart';

class SearchBarPersonalized extends StatelessWidget {
  const SearchBarPersonalized({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const decorationC1 = BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15)),
    );

    final decorationC2 = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF00A541), width: 3));

    final decorationC3 = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF00A541), width: 3));
    TextEditingController controller = TextEditingController();
    final TextStyle headlineMedium = Theme.of(context).textTheme.bodyMedium!;
    final size = MediaQuery.of(context).size;

    return Positioned(
      top: size.height * 0.04,
      right: 0,
      left: 0,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          height: size.height * 0.07,
          width: size.width,
          decoration: decorationC1,
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  right: size.width * 0.03,
                ),
                width: size.width * 0.8,
                height: size.height * 0.06,
                decoration: decorationC2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: size.width * 0.12,
                        height: size.height * 0.05,
                        child: const Icon(
                          Icons.search,
                          color: Color(0xFF44BEED),
                          size: 30,
                        )),
                    Expanded(
                      child: TextFormField(
                        controller: controller,
                        style: headlineMedium,
                        cursorColor: const Color(0xFF00A541),
                        decoration: InputDecoration(
                            floatingLabelStyle: headlineMedium,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            focusColor: const Color(0xFF00A541)),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.clear();
                },
                child: Container(
                    margin: EdgeInsets.only(left: size.width * 0.04),
                    decoration: decorationC3,
                    width: size.width * 0.12,
                    height: size.height * 0.06,
                    child: const Icon(
                      Icons.clear_rounded,
                      color: Color(0xFF44BEED),
                      size: 30,
                    )),
              ),
            ],
          )),
    );
  }
}
