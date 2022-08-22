import 'package:flutter/material.dart';
const Duration _kExpand = Duration(milliseconds: 200);

class CustomExpansion extends StatefulWidget {
  const CustomExpansion({ Key? key, required this.children, required this.name }) : super(key: key);
   final List<Widget> children;
   final String name;


  @override
  State<CustomExpansion> createState() => _CustomExpansionState();
}

class _CustomExpansionState extends State<CustomExpansion> with SingleTickerProviderStateMixin  {
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

   late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
 


  bool _isExpanded = false;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    

    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


   _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
  }


  Widget? _buildIcon(BuildContext context) {
    return RotationTransition(
      turns: _iconTurns,
      child: const Icon(Icons.expand_more),
    );
  }

   Widget _buildChildren(BuildContext context, Widget? child) {
   

    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileTheme.merge(
            iconColor: Colors.white,
            textColor: Colors.blue,
            child: ListTile(
              onTap: _handleTap,
               title:   Padding(
                  padding:const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                subtitle: const Text(
                  '+55 (11) 3214-0987',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 13
                  ),
                ),
               trailing: _buildIcon(context),
            ),
          ),
          ClipRect(
            child: Align(
              alignment:  Alignment.center,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    final bool shouldRemoveChildren = closed;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding:  EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.children,
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }
  
}