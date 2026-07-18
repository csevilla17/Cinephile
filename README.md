# Cinephile

## Descripción
Cinephile es una aplicación móvil desarrollada en Flutter diseñada para explorar y descubrir películas. Permite a los usuarios navegar a través de un catálogo de títulos y visualizar información detallada de cada película, incluyendo su reparto actoral, calificaciones y sinopsis, ofreciendo una experiencia moderna y fluida.

## Guía del Usuario
El flujo principal de la aplicación es intuitivo y directo:
1. El usuario comienza en una pantalla de inicio donde puede interactuar con las opciones de exploración y suscripción.
2. Desde la vista principal o explorador, el usuario puede seleccionar cualquier tarjeta de película para ver sus detalles.
3. Al abrir los detalles de una película, la aplicación recupera la información y muestra el reparto real de actores correspondiente a esa cinta.

## Guía de Instalación (Para Desarrolladores)
Para configurar y ejecutar este proyecto en un entorno local, sigue los pasos a continuación:

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone <url-del-repositorio>
   ```

2. Accede al directorio principal del proyecto:
   ```bash
   cd Cinephile
   ```

3. Descarga e instala las dependencias de Flutter:
   ```bash
   flutter pub get
   ```

4. Ejecuta la aplicación en un simulador, emulador o dispositivo físico (Android/iOS):
   ```bash
   flutter run
   ```

## Estructura de Archivos (lib/)
El proyecto utiliza una arquitectura modular estricta para mantener un código limpio y escalable. A continuación, se detalla el mapeo completo de cada directorio y archivo bajo la carpeta `lib/`:

* `lib/main.dart`: Punto de entrada principal de la aplicación. Configura la inyección de dependencias (Provider) y la inicialización del MaterialApp.

* `lib/config/`
  * `routes/AppRoutes.dart`: Archivo encargado de definir el mapa estático de rutas (navegación centralizada) de toda la aplicación.
  * `theme/CinephileTheme.dart`: Define la paleta de colores y las tipografías (Poppins, Inter) garantizando una consistencia visual en todo el proyecto.

* `lib/models/`
  * `Actor.dart`: Modelo de datos para parsear la información de los actores proveniente de TMDB (ID, nombre, personaje, ruta de perfil).
  * `Movie.dart`: Modelo de datos para parsear la información de las películas (ID, título, sinopsis, póster, fondo, calificación).

* `lib/providers/`
  * `MovieProvider.dart`: Controlador de estado que gestiona las peticiones HTTP a la API de TMDB (películas populares, paginación con infinite scrolling, y obtención de reparto por película).

* `lib/screens/`
  * `HomeScreen.dart`: Pantalla de bienvenida o landing page inicial. Invita al usuario a explorar o iniciar sesión/suscribirse.
  * `SubscriptionScreen.dart`: Vista que presenta los planes de suscripción disponibles para el usuario y recoge información de registro.
  * `LoginScreen.dart`: Pantalla de autenticación para usuarios ya registrados.
  * `ExplorerScreen.dart`: Vista principal de navegación. Implementa un grid de películas populares con carga infinita (Infinite Scrolling) y una barra de navegación inferior.
  * `DetailsScreen.dart`: Pantalla detallada de una película seleccionada. Muestra póster gigante, sinopsis, calificación y un listado asíncrono con el reparto actoral real.
  * `InfoScreen.dart`: Pantalla de perfil del usuario, accesible desde la barra de navegación del explorador. Permite ver detalles de cuenta y cerrar sesión.
  * `InfoScreenDev.dart`: Vista informativa sobre los desarrolladores de la aplicación.

* `lib/widgets/`
  * `CustomBottomNav.dart`: Componente reutilizable para la barra de navegación inferior.
  * `CustomSliverAppBar.dart`: Componente reutilizable para las cabeceras colapsables modernas (SliverAppBar) utilizadas en vistas con scroll.

## Arquitectura y Lógica
El desarrollo de Cinephile se apoya fuertemente en las siguientes metodologías y patrones:

* **Gestión de estado con Provider**: Asegura un flujo de datos limpio, separando la lógica de negocio de la capa de presentación.
* **Carga de datos asincrónica con FutureBuilder**: Se implementa para realizar cargas de datos no bloqueantes. Específicamente, se utiliza en la vista de detalles para cargar el reparto, mostrando un indicador de progreso (CircularProgressIndicator) mientras se espera la respuesta.
* **Integración con API externa**: La aplicación se conecta a la API externa de películas (TMDB) para obtener información actualizada sobre películas populares, sus descripciones, el reparto actoral y sus respectivas imágenes.
* **Navegación centralizada**: Toda la aplicación fluye a través de un único archivo de rutas estáticas, garantizando una transición robusta entre módulos.

## Notas de Desarrollo
* **Limitación de renderizado**: Al visualizar los detalles de una película, la lista del reparto actoral recuperada de la API se encuentra limitada a los primeros 15 actores. Esto permite mantener un diseño limpio, estético y con buen rendimiento.
* **Manejo de estados vacíos**: En caso de que la API no retorne una imagen de perfil para un actor específico, el sistema inyecta automáticamente un marcador de posición (un fondo gris súper oscuro con un icono de persona) para no romper la estructura de las tarjetas visuales.
