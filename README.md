# POKEDEX

Pokedex by Albert Jiménez.

## Introducción

Este proyecto es un acercamiento al reto de pokedex desde el lenguaje de dart y multiplataforma con la finalidad de demostrar las capacidades de desarrollar un MPV minimo producto vable de forma rapida, eficiente y escalable.

### Clean Arquitecture
![Clean arquitecture diagram](https://i.stack.imgur.com/VjXYl.png)
Para el proyecto usaremos el patron Bloc como manejador de estado a base de streams y la libreria RxDart, las peticiones las manejaremos con dio (Aunque no haya ventaja alguna de usarlo sobre el paquete http, simplemente es porque estoy más comodo con el otro paquete).

Para la generacion de fuentes usaremos google fonts pero en producción obviamente usaremos las fuentes embebidas.
## Enlaces utiles para consulta
-[Patrón bloc y su importancia en Dart](http://xurxodev.com/introduccion-al-patron-bloc/)
-[Patrón bloc en video](https://www.youtube.com/watch?v=vY4KmVqXEGE)
-[Paquete Dio](https://pub.dev/packages/dio/)
-[Google Fonts](https://pub.dev/packages/google_fonts)
-[Rx dart](https://pub.dev/packages/rxdart)