import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rock_paper_scissors/src/features/game/data/constants/constants.dart';
import 'package:rock_paper_scissors/src/features/game/logic/blocs/blocs.dart';
import 'package:rock_paper_scissors/src/features/game/presentation/components/components.dart';
import 'package:rock_paper_scissors/src/shared/shared.dart';

class SelectOptionState extends StatelessWidget {
  const SelectOptionState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void pickMove(String yourPick) {
      context.read<GameBloc>().add(YourPickEvent(yourPick: yourPick));
    }

    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        return FittedBox(
          fit: BoxFit.contain,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 472,
              // maxHeight: state.isBonusGame ? 470 : 400,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 12,
              children: [
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 400),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  child: state.isBonusGame
                      ? _BonusSelectOption(pickMove: pickMove)
                      : _ClassicSelectOption(pickMove: pickMove),
                ),
                GameTypeSwitch(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BonusSelectOption extends StatelessWidget {
  final void Function(String yourPick) pickMove;
  const _BonusSelectOption({required this.pickMove});

  Widget _buildTile(String name) {
    return GameOptionContainer(
      icon: nameToPath(name),
      size: 110,
      onTap: () => pickMove(name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 436 / 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgAsset(
            path: pentagon,
            height: 300,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTile(SCISSORS),
              Transform.translate(
                offset: Offset(0, -20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTile(SPOCK),
                      _buildTile(PAPER),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTile(LIZARD),
                    _buildTile(ROCK),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ClassicSelectOption extends StatelessWidget {
  final void Function(String yourPick) pickMove;
  const _ClassicSelectOption({required this.pickMove});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 436 / 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: 254 / 287,
            child: SvgAsset(
              path: bgTriangle,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GameOptionContainer(
                    icon: paperTile,
                    onTap: () => pickMove(PAPER),
                  ),
                  GameOptionContainer(
                    icon: scissorsTile,
                    onTap: () => pickMove(SCISSORS),
                  ),
                ],
              ),
              GameOptionContainer(
                icon: rockTile,
                onTap: () => pickMove(ROCK),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
