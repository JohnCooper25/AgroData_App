# AgroData App

AgroData es una aplicación móvil desarrollada en Flutter enfocada en la **gestión de registros de cosechas** y **mantenciones de maquinaria agrícola**. La app está pensada para facilitar el trabajo diario en el campo, permitiendo registrar, consultar y administrar información de forma ágil desde un dispositivo Android.

---

## Descripción General

La app se ambienta con una paleta de colores asociada al mundo agrícola (verdes, amarillos, tierra). Al iniciar, se presenta una pantalla de carga y luego se redirige al **Home**, que incluye un menú de navegación (`Drawer`) para acceder a las distintas funcionalidades: Perfil, Nueva Cosecha, Registros, Preferencias, Acerca de, entre otras.

Desde estas pantallas se puede:
- Ingresar los datos del usuario (nombre, teléfono, correo, huerto, administración).
- Registrar cosechas con variedad, contratista, cuadrillas y más.
- Registrar mantenciones técnicas a maquinarias.
- Editar y eliminar registros si las preferencias lo permiten.

---

## Lista de Funcionalidades Validadas

- Ingreso y visualización de datos del usuario.
- Registro de cosechas con información detallada.
- Registro de mantenciones por tipo de maquinaria.
- Edición y eliminación de registros con permisos configurables.
- Almacenamiento persistente con `SharedPreferences`.
- Navegación fluida con `Drawer`.
- Soporte para modo oscuro y claro.
- Protección de datos del perfil desde Preferencias.

---

## Requerimientos Técnicos

- Flutter >= 3.10
- Dart >= 3.0
- Android SDK 21+
- Dependencias clave:
  - `provider`
  - `shared_preferences`

---

## Capturas de Pantalla

A continuacion se muestran las pantallas principales de la aplicacion para un uso correcto de sus funcionalidades. 

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/390e77a0-3d19-46f1-a8f9-5c8b4a7817ab" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/d5e20e4f-5304-4ff4-acfb-eb3d7e0799e2" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/89daeab3-6d4c-476b-b24c-5dbfd2a8a166" width="200"/></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/bf73dce0-1f54-4dcf-b712-8903350b756a" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/ed7865c0-fe98-4325-88f7-84b73f189810" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/aa527476-7d92-4d87-bc58-83f1847974d0" width="200"/></td>  
  </tr>
</table>

## Diagramas

En este apartado se presentan los diagramas del proyecto. contamos con 2 diagramas de flujo para los diferentes tipos de usuario, tanto registro de cosechas como de mantenciones. Por otra parte tambien tenemos el diagrama de jerarquia de pantallas el cual expone los accesos y navegacion en la app.

### Diagrama de Jerarquía de Pantallas

En este diagrama podemos apreciar la navegacion existente en la aplicacion. Con la cual podemos encontrarnos diferentes caminos debido a la existencia del drawer en **Home** y en **Profile**. De esta manera tambien se expresa una conectividad de ida y vuelta entre pantallas generando una fluidez apropiada para el uso diario. 

![Jerarquia](https://github.com/user-attachments/assets/f1c7b478-584f-492f-bac9-07c0f27ed371)


### Diagrama de Flujo - Registro de Cosechas

Para la seccion de diagramas de flujo, tenemos 2 grandes secciones dependiendo del tipo de usuario que utilice la app. En este caso se tiene el flujo de registro de cosechas. El cual demuestra este mismo en el proceso de ingreso, registro, edicion o eliminacion de los registros de cosecha.

![Diagrama_Cosechas](https://github.com/user-attachments/assets/bf5fd561-0b54-42a8-a965-bc37af62ad31)


### Diagrama de Flujo - Registro de Mantenciones

Por otra parte tenemos la seccion del diagrama de flujo de mantenciones. Para esta parte el flujo en general tiene variaciones pero en esencia los trabajos que se realizan son similares a los de cosecha. Esto ya que nos permite crear, buscar, editar o eliminar la informacion en dichos registros creados para la mantencion adecuada.

![Diagrama_Mantenciones](https://github.com/user-attachments/assets/8acf61e6-0ae8-46c7-b5ac-63f3e6bebec3)


---

## Instalador APK

Puedes instalar la aplicación en un dispositivo Android descargando el siguiente archivo:

https://github.com/JohnCooper25/AgroData_App/blob/main/AgroData.apk

---

## 🔗 Repositorio GitHub

Puedes acceder al repositorio completo aquí:






