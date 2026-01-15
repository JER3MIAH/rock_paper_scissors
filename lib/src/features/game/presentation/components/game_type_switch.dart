import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_paper_scissors/src/features/game/logic/blocs/blocs.dart';
import 'package:rock_paper_scissors/src/features/theme/theme.dart';
import 'package:rock_paper_scissors/src/shared/widgets/widgets.dart';

class GameTypeSwitch extends StatelessWidget {
  const GameTypeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(builder: (context, state) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            'Classic'.toUpperCase(),
            color: appColors.white.withValues(alpha: .6),
            fontWeight: FontWeight.w600,
            
          ),
          Switch(
            value: state.isBonusGame,
            onChanged: (_) {
              context.read<GameBloc>().add(SwitchGameType());
            },
            activeThumbColor: appColors.shadow,
          ),
          AppText(
            'Bonus'.toUpperCase(),
            color: appColors.white.withValues(alpha: .6),
            fontWeight: FontWeight.w600,
          ),
        ],
      );
    });
  }
}
