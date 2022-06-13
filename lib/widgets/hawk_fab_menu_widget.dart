library hawk_fab_menu;

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

/// Wrapper that builds a FAB menu on top of [body] in a [Stack]
class HawkFabMenu extends StatefulWidget {
  HawkFabMenu({
    Key? key,
    required this.body,
    required this.items,
    this.blur = 5.0,
    this.icon,
    this.fabColor,
    this.iconColor,
    this.backgroundColor,
    this.openIcon,
    this.closeIcon,
    this.heroTag,
  }) : super(key: key) {
    assert(items.isNotEmpty);
  }

  final Color? backgroundColor;
  final double blur;
  final Widget body;
  final String? closeIcon;
  final Color? fabColor;
  final String? heroTag;
  final AnimatedIconData? icon;
  final Color? iconColor;
  final List<HawkFabMenuItem> items;
  final String? openIcon;

  @override
  _HawkFabMenuState createState() => _HawkFabMenuState();
}

class _HawkFabMenuState extends State<HawkFabMenu>
    with TickerProviderStateMixin {
  /// The [Duration] for every animation
  final Duration _duration = const Duration(milliseconds: 500);

  /// Animation controller that animates the menu item
  late AnimationController _iconAnimationCtrl;

  /// Animation that animates the menu item
  late Animation<double> _iconAnimationTween;

  /// To check if the menu is open
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _iconAnimationCtrl = AnimationController(
      vsync: this,
      duration: _duration,
    );
    _iconAnimationTween = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_iconAnimationCtrl);
  }

  /// Closes the menu if open and vice versa
  void _toggleMenu() {
    setState(() {
      _isOpen = !_isOpen;
    });
    if (_isOpen) {
      _iconAnimationCtrl.forward();
    } else {
      _iconAnimationCtrl.reverse();
    }
  }

  /// If the menu is open and the device's back button is pressed then menu gets closed instead of going back.
  Future<bool> _preventPopIfOpen() async {
    if (_isOpen) {
      _toggleMenu();
      return false;
    }
    return true;
  }

  /// Returns animated list of menu items
  Widget _buildMenuItemList() {
    return Positioned(
      bottom: 80,
      right: 15,
      child: ScaleTransition(
        scale: AnimationController(
          vsync: this,
          value: 0.7,
          duration: _duration,
        )..forward(),
        child: SizeTransition(
          axis: Axis.horizontal,
          sizeFactor: AnimationController(
            vsync: this,
            value: 0.5,
            duration: _duration,
          )..forward(),
          child: FadeTransition(
            opacity: AnimationController(
              vsync: this,
              value: 0.0,
              duration: _duration,
            )..forward(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: widget.items
                  .map<Widget>(
                    (item) => _MenuItemWidget(
                      item: item,
                      toggleMenu: _toggleMenu,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the blur effect when the menu is opened
  Widget _buildBlurWidget() {
    return InkWell(
      onTap: _toggleMenu,
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: widget.blur,
          sigmaY: widget.blur,
        ),
        child: Container(
          color: widget.backgroundColor ?? Colors.black12,
        ),
      ),
    );
  }

  /// Builds the main floating action button of the menu to the bottom right
  /// On clicking of which the menu toggles
  Widget _buildMenuButton(BuildContext context) {
    late Widget iconWidget;
    if (widget.openIcon != null && widget.closeIcon != null) {
      iconWidget = Image.asset(
        _isOpen ? widget.closeIcon! : widget.openIcon!,
        color: Colors.white,
        scale: 3,
      );
    } else {
      iconWidget = AnimatedIcon(
        icon: widget.icon ?? AnimatedIcons.menu_close,
        progress: _iconAnimationTween,
        color: widget.iconColor,
      );
    }
    return Positioned(
      bottom: 10,
      right: 10,
      child: FloatingActionButton(
        child: iconWidget,
        heroTag: widget.heroTag ?? '_HawkFabMenu_$hashCode',
        backgroundColor: widget.fabColor ?? Theme.of(context).primaryColor,
        onPressed: _toggleMenu,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Stack(
        children: <Widget>[
          widget.body,
          _isOpen ? _buildBlurWidget() : Container(),
          _isOpen ? _buildMenuItemList() : Container(),
          _buildMenuButton(context),
        ],
      ),
      onWillPop: _preventPopIfOpen,
    );
  }
}

/// Builds widget for a single menu item
class _MenuItemWidget extends StatelessWidget {
  const _MenuItemWidget({
    required this.item,
    required this.toggleMenu,
  });

  /// Contains details for a single menu item
  final HawkFabMenuItem item;

  /// A callback that toggles the menu
  final Function toggleMenu;

  /// Closes the menu and calls the function for a particular menu item
  void onTap() {
    toggleMenu();
    item.ontap();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            decoration: BoxDecoration(
              color:
                  // item.labelBackgroundColor ??
                  Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Text(
              item.label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color:
                    //item.labelColor ??
                    Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: onTap,
            heroTag: item.heroTag ?? '_MenuItemWidget_$hashCode',
            mini: true,
            child: item.icon,
            backgroundColor: item.color ?? Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}

/// Model for single menu item
class HawkFabMenuItem {
  HawkFabMenuItem({
    required this.label,
    required this.ontap,
    required this.icon,
    this.color,
    this.labelBackgroundColor,
    this.labelColor,
    this.heroTag,
  });

  /// Background color for icon
  Color? color;

  /// The tag to apply to the button's [Hero] widget.
  String? heroTag;

  /// Corresponding icon for the menu item
  Image icon;

  /// Text label for for the menu item
  String label;

  /// Background color for label
  Color? labelBackgroundColor;

  /// Text color for label
  Color? labelColor;

  /// Action that is to be performed on tapping the menu item
  Function ontap;
}
