import 'package:flutter/material.dart';
import 'package:telegram_ui_joseph/assets.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryContainer = Theme.of(context).colorScheme.primaryContainer;
    final onPrimaryContainer = Theme.of(context).colorScheme.onPrimaryContainer;
    return Drawer(
      child: LayoutBuilder(
        builder: (_, constraints) => Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              height: constraints.maxHeight * 0.20,
              color: primaryContainer,
              child: SafeArea(
                  bottom: false,
                  child: _DrawerHeader(onPrimaryContainer: onPrimaryContainer)),
            ),
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.only(top: 12),
                  itemBuilder: (_, index) {
                    final item = _MenuDrawerItemModel.all[index];
                    return _DrawerMenuTile(
                      iconImagePath: item.imagePath,
                      title: item.title,
                      onPrimaryContainer: primaryContainer,
                      hasWarning: index == 5,
                    );
                  },
                  separatorBuilder: (_, index) => index == 5
                      ? const Divider(
                          height: 0,
                        )
                      : Container(),
                  itemCount: _MenuDrawerItemModel.all.length),
            )
          ],
        ),
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
    required this.onPrimaryContainer,
  }) : super(key: key);

  final Color onPrimaryContainer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 30,
              foregroundImage: AssetImage('assets/joseph.jpg'),
            ),
            Image.asset(
              AssetIcon.menuNight,
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Joseph',
                  style: TextStyle(
                      color: onPrimaryContainer,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '+20 120 5912496',
                  style: TextStyle(
                      color: onPrimaryContainer.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
                )
              ],
            ),
            Image.asset(AssetIcon.msgGoDown),
          ],
        )
      ],
    );
  }
}

class _DrawerMenuTile extends StatelessWidget {
  const _DrawerMenuTile({
    Key? key,
    required String iconImagePath,
    required String title,
    required Color onPrimaryContainer,
    required bool hasWarning,
  })  : _iconImagePath = iconImagePath,
        _title = title,
        _onPrimaryContainer = onPrimaryContainer,
        _hasWarning = hasWarning,
        super(key: key);

  final Color _onPrimaryContainer;
  final String _iconImagePath;
  final String _title;
  final bool _hasWarning;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        _iconImagePath,
        color: Colors.grey,
      ),
      title: Text(_title),
      trailing: _hasWarning
          ? Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _onPrimaryContainer,
              ),
              child: Image.asset(AssetIcon.listWarningSign),
            )
          : null,
    );
  }
}

class _MenuDrawerItemModel {
  _MenuDrawerItemModel._({required this.imagePath, required this.title});

  final String imagePath;
  final String title;

  static List<_MenuDrawerItemModel> all = [
    _MenuDrawerItemModel._(imagePath: AssetIcon.menuGroups, title: 'New Group'),
    _MenuDrawerItemModel._(
        imagePath: AssetIcon.menuContacts, title: 'Contacts'),
    _MenuDrawerItemModel._(imagePath: AssetIcon.menuCalls, title: 'Calls'),
    _MenuDrawerItemModel._(
        imagePath: AssetIcon.menuNearby, title: 'People Nearby'),
    _MenuDrawerItemModel._(
        imagePath: AssetIcon.menuSaved, title: 'Saved Messages'),
    _MenuDrawerItemModel._(
        imagePath: AssetIcon.menuSettings, title: 'Settings'),
    _MenuDrawerItemModel._(
        imagePath: AssetIcon.menuInvite, title: 'Invite Friends'),
    _MenuDrawerItemModel._(
        imagePath: AssetIcon.menuHelp, title: 'Telegram Features'),
  ];
}
