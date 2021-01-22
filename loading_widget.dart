@import

class @widget extends StatelessWidget {
  final int status;
  final Widget child;
  final VoidCallback onPressed;

  LoadingWidget(
      {Key key, @required this.status, @required this.child, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 0 = carregando || 1 = carregado || 2 = loading || 3 = no results
    switch (status) {
      case 3:
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.maxFinite,
              ),
              Text("Nenhum resultado encontrado!"),
              onPressed != null
                  ? TextButton(
                      onPressed: onPressed,
                      child: Text("Tentar novamente"),
                    )
                  : Container(
                      width: 0,
                      height: 0,
                    ),
            ],
          ),
        );
      case 1:
        return Container(
          child: child,
        );
      default:
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
    }
  }
}
