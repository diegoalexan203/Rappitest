# rappitest

Desarrollado por Diego Alexander Ochoa para Rappi.

La prueba tuvo una variacion. Ya que el enunciado de la prueba, hace referencia al api de themoviedb. La cual tiene vigente la version 4. La version 3 a la cual hace referencia la prueba fue deprecada y no me fue posible acceder a la data.

La aplicacion, fue contruida con un maestro detalle. Desarrollado con UiKit, Patron MVVM con RXSwift, RXCocoa.

Se incluye el uso de Sqlite, para manejo offline. Tambien se utilizo un pod de SwiftLint, para garantizar un codigo mas saludable.

Para el consumo del api, decidi utilizar moya provider, el Cual me parece que es mas flexible para ser usado con el patron MVVM.

Responda y escriba dentro del Readme con las siguientes preguntas:
1. En qué consiste el principio de responsabilidad única? Cuál es su propósito?
    R/ Consiste en que cada objeto o clase debe tener una unica responsabilidad. Esto nos permite tener desarrollos mas desacoplados y mas faciles de testear.
    
2. Qué características tiene, según su opinión, un “buen” código o código limpio
    R/ Un codigo limpio, debe de ser facil de leer, facil de interpretar y facil de realizarle soporte. Debe de poderse escalar facilmente y debe poderse testear.
