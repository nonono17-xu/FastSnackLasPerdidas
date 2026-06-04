# FastSnackLasPerdidas
FastSnack es un sistema desarrollado en Java orientado a la gestión de pedidos de comida rápida. El proyecto aplica principios de Programación Orientada a Objetos (POO), utilizando conceptos como herencia, encapsulamiento, asociación, agregación y enumeraciones para modelar el proceso de administración de clientes, productos y pedidos.

El sistema permite registrar clientes, gestionar un catálogo de productos y crear pedidos compuestos por uno o varios productos. Cada pedido está asociado a un único cliente y cuenta con estados definidos mediante una enumeración, lo que facilita el seguimiento del proceso desde su creación hasta su entrega.

*Características principales*

Gestión de clientes con información personal y dirección.

Registro y administración de productos con nombre y precio.

Creación de pedidos asociados a un cliente.

Agregación de múltiples productos dentro de un pedido.

Cálculo automático del total del pedido.

Control de estados del pedido mediante la enumeración EstadoPedido.

Implementación de encapsulamiento mediante atributos privados y métodos de acceso (getters y setters).

Aplicación de relaciones UML como herencia, asociación, agregación y dependencia.

*Estructura del modelo*

Persona: Clase base que contiene nombre y teléfono.

Cliente: Hereda de Persona y agrega la dirección del cliente.

Producto: Representa los artículos disponibles para la venta.

Pedido: Gestiona los productos seleccionados por un cliente y su estado.

EstadoPedido: Enumeración que define los estados válidos de un pedido (Pendiente, Revición, Enviado, Entregado).

Este proyecto sirve como ejemplo práctico de modelado UML e implementación de sistemas orientados a objetos en Java, siguiendo buenas prácticas de diseño y organización del código.
