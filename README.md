# Brasa Urbana — práctica de la Semana 09

Sitio demostrativo de comida rápida inspirado en la categoría de plantillas de comida y restaurantes de TemplateMonster. El diseño es original: presenta hamburguesas y papas, un formulario de pedido de prueba y dos recorridos de servidor para practicar PHP y JSP.

## Estructura

```text
index.html           Entrada para Apache/PHP
config.php           Catálogo de ejemplo, escape HTML y sesión PHP
procesar.php         Validación del formulario POST en PHP
index.jsp            La misma página para Tomcat
procesar.jsp         Validación POST y contador de sesión JSP
WEB-INF/web.xml      Configuración mínima de la aplicación JSP
assets/styles.css    Diseño adaptable
assets/site.js       Menú móvil y estimación visual del total
```

Los precios del formulario se vuelven a validar y calcular en el servidor; el total JavaScript solo es una vista previa. Los pedidos se guardan únicamente como demostración de sesión. No hay base de datos, pago, envío ni contacto real con un restaurante.

## Ejecutar con PHP

1. Instala XAMPP o Laragon con Apache y PHP 8.2 o posterior.
2. Copia el contenido de esta carpeta en `htdocs/lab09/` (XAMPP) o en la carpeta pública equivalente de Laragon.
3. Inicia Apache y abre `http://localhost/lab09/index.html`.
4. Envía el formulario y revisa la respuesta `200` en DevTools → Network. Una petición GET directa a `procesar.php` responde `405`; datos inválidos responden `422`.

MySQL no se usa en esta versión: la guía lo incluye como recurso del entorno, pero este ejercicio no requiere persistencia ni CRUD.

## Ejecutar con JSP

1. Instala JDK 17 o posterior y Apache Tomcat 10.x.
2. Copia el contenido del proyecto en `webapps/lab09/` de Tomcat, conservando `WEB-INF/` y `assets/`.
3. Inicia Tomcat y abre `http://localhost:8080/lab09/` o `http://localhost:8080/lab09/index.jsp`.
4. Envía el formulario y revisa la respuesta `200` en DevTools → Network. Una petición GET directa a `procesar.jsp` responde `405`; datos inválidos responden `422`.

## Comparación PHP y JSP

| Aspecto | PHP con Apache | JSP con Tomcat |
|---|---|---|
| Entrada del formulario | `index.html` envía POST a `procesar.php` | `index.jsp` envía POST a `procesar.jsp` |
| Ciclo de vida | Apache ejecuta PHP al recibir la solicitud y devuelve HTML | Tomcat traduce JSP a servlet, lo compila y ejecuta el servlet para responder |
| Datos de la solicitud | `filter_input()` valida POST; el catálogo del servidor determina el precio | `request.getParameter()` recibe POST; una lista permitida determina el precio |
| Estado de ejemplo | La última solicitud queda en `$_SESSION` | El último pedido y el contador quedan en `session` |
| Despliegue | Copiar a la carpeta pública de Apache/XAMPP o Laragon | Copiar la aplicación a `webapps/lab09` y arrancar Tomcat |
| Uso adecuado en esta práctica | Prototipos sencillos con servidor PHP | Aplicaciones Java desplegadas en un contenedor Servlet |

HTTP es *stateless*: cada solicitud es independiente. Las dos sesiones de demostración conservan solo datos de ejemplo entre solicitudes; no son una base de datos.

> **Regla de la práctica:** la guía pide que al menos el 70 % de la lógica de procesamiento y configuración de despliegue sea escrita manualmente. Usa esta base para estudiar, reescribe y explica el flujo con tus propias palabras, y verifica la comparación con documentación oficial. No la entregues sin comprenderla.
>
> /* IA: comparación de ciclos de vida PHP/JSP. Solución manual: verifica las etapas con documentación oficial, logs y capturas propias de Apache y Tomcat. */

## Pruebas y evidencias de la guía

- Comprueba que Apache/MySQL (si lo inicias) y Tomcat arrancan sin conflictos de puertos y revisa sus logs.
- Envía un pedido válido en cada plataforma. Confirma los datos y el total calculado por el servidor.
- Prueba la validación del navegador y del servidor con datos faltantes o manipulados; confirma `422`. Prueba GET en los procesadores y confirma `405` con `Allow: POST`.
- Usa DevTools → Network para observar método, URL, código y cabeceras. No hay redirección `302` porque el formulario responde directamente; se puede añadir el patrón Post/Redirect/Get en una siguiente iteración.
- Guarda capturas del arranque, la página, el envío y la respuesta en PHP y JSP. La guía también solicita publicar el proyecto en GitHub: crea un repositorio y agrega aquí su enlace cuando lo tengas.

## Información que falta para convertirlo en un sitio real

- Nombre y logotipo definitivos, dirección exacta, teléfono/WhatsApp, horario y cobertura de reparto.
- Menú confirmado: ingredientes, tamaños, precios, extras, bebidas, alérgenos y fotos propias con permiso de uso. Los textos, precios, horarios y dirección actuales son ejemplos.
- Decidir cómo se reciben y guardan pedidos. Para producción harían falta una base de datos, protección CSRF, reglas de privacidad y una integración de pago o reparto solo si realmente se necesita.
- Dominio y hosting compatibles con PHP o Java/Tomcat, HTTPS y configuración de producción.
- Reemplazar las fotos de demostración por imágenes propias/licenciadas; las actuales y las fuentes tipográficas remotas necesitan conexión a Internet.
- Capturas de evidencias, revisión manual del funcionamiento y enlace del repositorio GitHub para completar la entrega de la práctica.
