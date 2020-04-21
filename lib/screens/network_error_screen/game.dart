import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import '../../utils/export.dart';

const double BOARD_SIZE = 400.0;
const double PIECE_SIZE = 20.0;

class NoNetworkSnakeGame extends StatefulWidget {
  @override
  _NoNetworkSnakeGameState createState() => _NoNetworkSnakeGameState();
}

class _NoNetworkSnakeGameState extends State<NoNetworkSnakeGame> {
  // State of the game to change body accordingly //
  GameState _gameState = GameState.starting;

  // Starting direction of the snake //
  Direction _currentDirection = Direction.up;

  // Score is init to 5 //
  int _score = 5;

  List<PointClass> _snakePosition;

  PointClass _foodPosition;

  Timer _timer;

  @override
  void initState() {
    super.initState();
  }

  Widget _startWidget() {
    return Center(
      child: Container(
        width: BOARD_SIZE,
        height: BOARD_SIZE,
        color: Colors.yellow[100],
        child: Center(
            child: MaterialButton(
          onPressed: () {
            setState(() {
              _gameState = GameState.running;
              _startGame();
            });
          },
          child: Text(
            'Tap to Play',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.0),
          ),
          color: Color(0xff4d59fa),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        )),
      ),
    );
  }

  Widget _gameScreen() {
    List<Positioned> snakeAndFood = List();
    print(_snakePosition.length.toString());

    for (int i = 0; i < _snakePosition.length; i++) {
      var temp = _snakePosition[i];
      snakeAndFood.add(new Positioned(
        child: Snake(
          index: i,
          score: _score,
        ),
        left: temp.x * PIECE_SIZE,
        top: temp.y * PIECE_SIZE,
      ));
    }

    final food = new Positioned(
      child: Food(),
      left: _foodPosition.x * PIECE_SIZE,
      top: _foodPosition.y * PIECE_SIZE,
    );

    snakeAndFood.add(food);
    return Column(
      children: <Widget>[
        Container(
          width: BOARD_SIZE,
          height: BOARD_SIZE,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.red, width: 10.0)),
          child: Stack(fit: StackFit.expand, children: snakeAndFood),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          "Score = $_score",
          style: TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20.0,
        ),
        _controlButtons()
      ],
    );
  }

  Widget _controlButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        IconButton(
          iconSize: 40.0,
          icon: Icon(
            Icons.keyboard_arrow_up,
            color: Colors.purple[900],
            size: 40.0,
          ),
          onPressed: () {
            if (_currentDirection == Direction.down) {
              return;
            }
            setState(() {
              _currentDirection = Direction.up;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              iconSize: 40.0,
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.purple[900],
                size: 40.0,
              ),
              onPressed: () {
                if (_currentDirection == Direction.right) {
                  return;
                }
                setState(() {
                  _currentDirection = Direction.left;
                });
              },
            ),
            IconButton(
              iconSize: 40.0,
              icon: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.purple[900],
                size: 40.0,
              ),
              onPressed: () {
                if (_currentDirection == Direction.left) {
                  return;
                }
                setState(() {
                  _currentDirection = Direction.right;
                });
              },
            )
          ],
        ),
        IconButton(
          iconSize: 40.0,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.purple[900],
            size: 40.0,
          ),
          onPressed: () {
            if (_currentDirection == Direction.up) {
              return;
            }
            setState(() {
              _currentDirection = Direction.down;
            });
          },
        )
      ],
    );
  }

  // Helper function to decide widget from state //
  Widget _scaffoldBody(GameState gameState, BuildContext context) {
    Widget child;
    switch (gameState) {
      case (GameState.starting):
        child = _startWidget();
        break;
      case (GameState.running):
        // _startGame();
        child = _gameScreen();
        break;
      case (GameState.finish):
        child = GestureDetector(
            onTap: () {
              setState(() {
                _gameState = GameState.starting;
              });
            },
            child: GameOver(
              score: _score,
            ));
        break;
      default:
        return Center(
          child: Text('Nothing to show'),
        );
        break;
    }

    return child;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: EdgeInsets.all(0.0),
        child: _scaffoldBody(_gameState, context));
  }

  void timer(Timer timer) {
    _move();

    if (_collisionWithWall() || _collisionWithBody()) {
      setState(() {
        _gameState = GameState.finish;
        _timer.cancel();
      });
    }

    if (_collisionWithFood()) {
      _generateNewFood();
      _grow();
      setState(() {
        _score++;
      });
    }
  }

  void _move() {
    setState(() {
      _snakePosition.insert(0, _generateNewSnake());
      _snakePosition.removeLast();
    });
  }

  void _grow() {
    setState(() {
      _snakePosition.insert(0, _generateNewSnake());
    });
  }

  bool _collisionWithWall() {
    var currentHeadPosition = _snakePosition.first;
    bool collision = false;

    if (currentHeadPosition.x < -4 ||
        currentHeadPosition.y < -4 ||
        currentHeadPosition.x > (BOARD_SIZE / 20) + 4.0 ||
        currentHeadPosition.y > (BOARD_SIZE / 20) + 4.0) {
      collision = true;
    }

    return collision;
  }

  bool _collisionWithFood() {
    bool collision = false;

    bool xCheck = _snakePosition.first.x.round() == _foodPosition.x;
    bool yCheck = _snakePosition.first.y.round() == _foodPosition.y;

    if (xCheck && yCheck) {
      collision = true;
    }

    return collision;
  }

  bool _collisionWithBody() {
    bool collision = false;

    for (int i = 1; i < _snakePosition.length; i++) {
      if (_snakePosition.first == _snakePosition[i]) {
        collision = true;
      }
    }

    return collision;
  }

  void _generateNewFood() {
    Random random = new Random();
    var min = 0;
    var max = BOARD_SIZE ~/ PIECE_SIZE;

    var nextX = min + random.nextInt(max - min);
    var nextY = min + random.nextInt(max - min);

    var newFood = PointClass(nextX.toDouble(), nextY.toDouble());

    if (_snakePosition.contains(newFood)) {
      _generateNewFood();
    } else {
      _foodPosition = newFood;
    }
  }

  void _startSnake() {
    setState(() {
      final approxMid = BOARD_SIZE / PIECE_SIZE / 2;
      _snakePosition = [
        PointClass(approxMid + 2, approxMid),
        PointClass(approxMid + 1, approxMid),
        PointClass(approxMid, approxMid),
        PointClass(approxMid - 1, approxMid),
        PointClass(approxMid - 2, approxMid)
      ];
    });
  }

  void _startGame() {
    setState(() {
      _score = 5;
    });
    _startSnake();
    _generateNewFood();
    _timer = new Timer.periodic(new Duration(milliseconds: 800), timer);
  }

  // when the snake moves we need to update its position
  PointClass _generateNewSnake() {
    PointClass newHeadPos;

    switch (_currentDirection) {
      case (Direction.up):
        PointClass currentHeadPos = _snakePosition.first;
        newHeadPos = PointClass(currentHeadPos.x, currentHeadPos.y - 1);
        break;
      case (Direction.down):
        PointClass currentHeadPos = _snakePosition.first;
        newHeadPos = PointClass(currentHeadPos.x, currentHeadPos.y + 1);
        break;
      case (Direction.right):
        PointClass currentHeadPos = _snakePosition.first;
        newHeadPos = PointClass(currentHeadPos.x + 1, currentHeadPos.y);
        break;
      case (Direction.left):
        PointClass currentHeadPos = _snakePosition.first;
        newHeadPos = PointClass(currentHeadPos.x - 1, currentHeadPos.y);
        break;
      default:
        PointClass currentHeadPos = _snakePosition.first;
        newHeadPos = PointClass(currentHeadPos.x + 1, currentHeadPos.y);
        break;
    }
    return newHeadPos;
  }
}
