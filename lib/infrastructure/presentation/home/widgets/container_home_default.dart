part of '../home_screen.dart';

class _ContainerHomeDefault extends StatelessWidget {
  const _ContainerHomeDefault({
    required this.icon,
    required this.text,
    required this.route,
  });

  final IconData icon;
  final String text;
  final String route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadiusDefault.borderRadiusDefault,
      onTap: () {
        Navigator.of(context).pushNamed(route);
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
            Icon(icon, size: 100, color: colorDefault.textColor),
            Text(
              text,
              style: context.typography.titleLarge?.copyWith(
                fontSize: 32,
                color: colorDefault.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
