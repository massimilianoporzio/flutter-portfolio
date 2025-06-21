import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/common/extensions.dart';
import 'package:portfolio/widgets/appbar/drawer_small_menu.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drawer_menu.g.dart';

class DrawerMenu extends ConsumerStatefulWidget {
  const DrawerMenu({super.key});

  @override
  ConsumerState<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends ConsumerState<DrawerMenu>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );
  late final _animation =
      Tween<Offset>(
        begin: const Offset(0, -1),
        end: const Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeIn,
        ),
      );

  @override
  void dispose() {
    _controller.dispose();
    _animation.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      drawerMenuControllerProvider,
      (previous, next) {
        if (next.value == true) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      },
    );
    return ClipRRect(
      child: SlideTransition(
        position: _animation,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: context.theme.colorScheme.surface.withValues(alpha: 0.4),
                blurRadius: 6,
                spreadRadius: 3,
              ),
            ],
          ),
          child: SmallMenu(),
        ),
      ),
    );
  }
}

@riverpod
class DrawerMenuController extends _$DrawerMenuController {
  @override
  FutureOr<bool> build() {
    return false; //quando costruisco il menu è chiuso
  }

  open() {
    update((state) => true);
  }

  close() {
    update((state) => false);
  }
}
