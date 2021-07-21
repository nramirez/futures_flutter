# Ejemplos de streams en flutter

Video: 

```
    // crear un stream
    Stream.value(5);
    // crear un stream que devuelve un error
    Stream.error("Sin Internet");
    
    // crear un stream que emite un valor cada segundo
    var st = var st = Stream.periodic(Duration(seconds: 1), (t) => t);

    // Solo se puede escuchar el stream una vez por aplicación.
    // st.asBroadcastStream()
    // permite escuchar un stream mas de una vez por aplicación

    // Como escuchar los valores de un stream
    var lst = st.listen((v) => print("PRIMER LISTEN: " + v), 
                      onError: (e) => print("Problema manito: " + e));

    // Este liste puede ser pausado, resumido o cancelado con:
    lst.pause();
    lst.resume();
    lst.cancel();
```

Como crear un stream

```

class Macarena {
  Macarena() {
    Timer.periodic(const Duration(seconds: 3), (t) {
      if (t.tick > letras.length) {
        t.cancel();
         // terminar el stream
        _controller.close();
      } else {
          // enviar nuevos valores a los oyentes
        _controller.sink.add(letras.elementAt(t.tick - 1));
      }
    });
  }
  // Un controlador privado
  final _controller = StreamController<String>();

  List<String> letras = [
    "Dale a tu cuerpo alegría Macarena",
    "Que tu cuerpo es pa' darle alegría y cosa buena",
    "Dale a tu cuerpo alegría Macarena",
    "Hey Macarena",
  ];
  
  // Exponer el stream por una propiedad publica
  Stream<String> get stream => _controller.stream;
}

```

Para consumir este stream en flutter usar StreamBuilder, mas detalles en el main.dart