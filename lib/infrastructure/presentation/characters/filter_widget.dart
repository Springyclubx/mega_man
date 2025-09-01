part of 'characters_screen.dart';

class _Filters extends StatelessWidget {
  const _Filters();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Icon(
              Icons.filter_alt_rounded,
              size: 32,
              color: colorDefault.textColor,
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: _BuildFilterList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildFilterList extends StatelessWidget {
  const _BuildFilterList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: House.values.length,
        padding: const EdgeInsets.only(bottom: 8.0),
        itemBuilder: (context, index) {
          final item = House.values[index];
          return _ComponentListFilters(house: item);
        },
      ),
    );
  }
}

class _ComponentListFilters extends StatelessWidget {
  const _ComponentListFilters({required this.house});

  final House house;

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CharactersState>(context);

    final isSelected = state.selected == house;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () async => state.filter(house),
        child: Chip(
          backgroundColor: isSelected
              ? colorDefault.cardColorSelected
              : colorDefault.cardColor,
          padding: const EdgeInsets.all(8.0),
          label: Text(
            house.name,
            style: TextStyle(
              fontSize: 20,
              color: isSelected
                  ? colorDefault.textColorSelected
                  : colorDefault.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
