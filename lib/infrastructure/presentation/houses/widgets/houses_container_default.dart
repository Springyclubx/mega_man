part of '../houses_screen.dart';

class _HousesContainer extends StatelessWidget {
  const _HousesContainer({super.key, required this.house});

  final House house;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadiusDefault.borderRadiusDefault,
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(NamedRoutes.characters, arguments: house);
      },
      child: Container(
        height: 200,
        width: 190,
        decoration: BoxDecoration(
          color: colorDefault.cardColor,
          borderRadius: BorderRadiusDefault.borderRadiusDefault,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/${house.name}.png', width: 100, height: 100),
            Text(
              house.name,
              style: textDefault.title,
            ),
          ],
        ),
      ),
    );
  }
}
