class GestionPrueba {
  String titulo;
  String director;
  String horarioAtencion;
  String telefonoAtencion;
  // Consejos Comunitario
  String presidenteConsejo;
  // Telefono Encargado
  String telefonoConsejo;
  String imgConsejo;

  GestionPrueba({
    required this.titulo,
    required this.director,
    required this.horarioAtencion,
    required this.telefonoAtencion,
    required this.presidenteConsejo,
    required this.telefonoConsejo,
    required this.imgConsejo,
  });
}

List<GestionPrueba> gestionDataUD = [
  GestionPrueba(
    titulo: "Mañana",
    director: "Lic. Enrique Alejandro Mamani",
    horarioAtencion: "08:00am - 12:00pm",
    telefonoAtencion: "+591 78452415",
    presidenteConsejo: "Juan Pérez",
    telefonoConsejo: "+591 78452418",
    imgConsejo:
        "https://i.pinimg.com/564x/78/12/83/781283026f7e36347d3e0a73126148f2.jpg",
  ),
  GestionPrueba(
    titulo: "Tarde",
    director: "Lic. María Rodríguez",
    horarioAtencion: "02:00pm - 06:00pm",
    telefonoAtencion: "+591 78452416",
    presidenteConsejo: "Ana García",
    telefonoConsejo: "+591 78452419",
    imgConsejo:
        "https://i.pinimg.com/564x/8c/ce/fe/8ccefef2b64386f912b31110751886ae.jpg",
  ),
  GestionPrueba(
    titulo: "Noche",
    director: "Lic. Carlos González",
    horarioAtencion: "08:00pm - 12:00am",
    telefonoAtencion: "+591 78452417",
    presidenteConsejo: "Pedro López",
    telefonoConsejo: "+591 78452420",
    imgConsejo:
        "https://i.pinimg.com/564x/73/03/31/7303316d88af769424a1de6c95340a07.jpg",
  ),
];

List<GestionPrueba> gestionDataCM = [
  GestionPrueba(
    titulo: "Continuo",
    director: "Lic. Ana López",
    telefonoAtencion: "+591 78452415",
    horarioAtencion: "08:00am - 12:00pm y 02:00pm - 06:00pm",
    presidenteConsejo: "Pedro López",
    telefonoConsejo: "+591 78452420",
    imgConsejo:
        "https://i.pinimg.com/564x/d1/13/40/d11340c35f4df696e5f59174302f06cb.jpg",
  ),
];

class MantemientoInfraestructura {
  String titulo;
  String fecha;
  String encargado;
  String empresa;

  MantemientoInfraestructura({
    required this.titulo,
    required this.fecha,
    required this.encargado,
    required this.empresa,
  });
}

List<MantemientoInfraestructura> mantenimientosUE = [
  MantemientoInfraestructura(
    titulo: "Reparación escaleras",
    fecha: "05/03/2024",
    encargado: "Juan Pérez",
    empresa: "Constructora ABC",
  ),
  MantemientoInfraestructura(
    titulo: "Pintura pasillos",
    fecha: "10/03/2024",
    encargado: "María López",
    empresa: "Servicios Pinturas XYZ",
  ),
  MantemientoInfraestructura(
    titulo: "Revisión sistemas eléctricos",
    fecha: "15/03/2024",
    encargado: "Carlos Martínez",
    empresa: "Electro Seguridad SRL",
  ),
  MantemientoInfraestructura(
    titulo: "Mantenimiento fontanería",
    fecha: "20/03/2024",
    encargado: "Ana García",
    empresa: "Plomería Profesional",
  ),
  MantemientoInfraestructura(
    titulo: "Inspección de seguridad",
    fecha: "25/03/2024",
    encargado: "Luis Rodríguez",
    empresa: "Seguridad Total",
  ),
  MantemientoInfraestructura(
    titulo: "Limpieza Aire Acondicionado",
    fecha: "30/03/2024",
    encargado: "Elena Fernández",
    empresa: "Servicios de Limpieza Clean",
  ),
];

List<MantemientoInfraestructura> mantenimientosCS = [
  MantemientoInfraestructura(
    titulo: "Ascensores",
    fecha: "05/03/2024",
    encargado: "Juan Pérez",
    empresa: "Elevadores Rápidos",
  ),
  MantemientoInfraestructura(
    titulo: "Quirófanos",
    fecha: "10/03/2024",
    encargado: "María López",
    empresa: "Servicios Higiénicos",
  ),
  MantemientoInfraestructura(
    titulo: "Equipos de Emergencia",
    fecha: "15/03/2024",
    encargado: "Carlos Martínez",
    empresa: "Mantenimiento Total",
  ),
  MantemientoInfraestructura(
    titulo: "Climatización",
    fecha: "20/03/2024",
    encargado: "Ana García",
    empresa: "Aire Fresco S.A.",
  ),
  MantemientoInfraestructura(
    titulo: "Sistemas contra Incendios",
    fecha: "25/03/2024",
    encargado: "Luis Rodríguez",
    empresa: "Protección y Seguridad",
  ),
  MantemientoInfraestructura(
    titulo: "Comunicaciones",
    fecha: "30/03/2024",
    encargado: "Elena Fernández",
    empresa: "Comunicaciones Integrales",
  ),
];

class SuministroGubernamental {
  String titulo;
  String fecha;
  String encargado;
  String cantidad;

  SuministroGubernamental({
    required this.titulo,
    required this.fecha,
    required this.encargado,
    required this.cantidad,
  });
}

List<SuministroGubernamental> suministrosEducacion = [
  SuministroGubernamental(
    titulo: "Computadoras portátiles",
    fecha: "10/03/2024",
    encargado: "Ana Pérez",
    cantidad: "50",
  ),
  SuministroGubernamental(
    titulo: "Libros de texto",
    fecha: "15/03/2024",
    encargado: "Juan Martínez",
    cantidad: "200",
  ),
  SuministroGubernamental(
    titulo: "Equipos audiovisuales",
    fecha: "20/03/2024",
    encargado: "María Gómez",
    cantidad: "10",
  ),
  SuministroGubernamental(
    titulo: "Muebles de aula",
    fecha: "25/03/2024",
    encargado: "Carlos López",
    cantidad: "30",
  ),
  SuministroGubernamental(
    titulo: "Material didáctico",
    fecha: "30/03/2024",
    encargado: "Elena Rodríguez",
    cantidad: "1000",
  ),
];

List<SuministroGubernamental> suministrosHospitales = [
  SuministroGubernamental(
    titulo: "Equipos de diagnóstico",
    fecha: "10/03/2024",
    encargado: "Ana Pérez",
    cantidad: "10",
  ),
  SuministroGubernamental(
    titulo: "Medicamentos",
    fecha: "15/03/2024",
    encargado: "Juan Martínez",
    cantidad: "500",
  ),
  SuministroGubernamental(
    titulo: "Equipo de protección personal",
    fecha: "20/03/2024",
    encargado: "María Gómez",
    cantidad: "1000",
  ),
  SuministroGubernamental(
    titulo: "Camas hospitalarias",
    fecha: "25/03/2024",
    encargado: "Carlos López",
    cantidad: "50",
  ),
  SuministroGubernamental(
    titulo: "Material quirúrgico",
    fecha: "30/03/2024",
    encargado: "Elena Rodríguez",
    cantidad: "2000",
  ),
];

class VisitaGubernamental {
  String titulo;
  String fecha;
  String motivo;
  String quienesVisitaron;

  VisitaGubernamental({
    required this.titulo,
    required this.fecha,
    required this.motivo,
    required this.quienesVisitaron,
  });
}

List<VisitaGubernamental> visitasEducacion = [
  VisitaGubernamental(
    titulo: "Inspección de infraestructura",
    fecha: "10/03/2024",
    motivo: "Verificar condiciones de los edificios",
    quienesVisitaron:
        "Maria Isabel Camacho, Juan Pérez Gonzales y Luisa Fernández Hernandez",
  ),
  VisitaGubernamental(
    titulo: "Evaluación de calidad",
    fecha: "15/03/2024",
    motivo: "Revisar estándares académicos",
    quienesVisitaron: "Comisión de Educación",
  ),
  VisitaGubernamental(
    titulo: "Supervisión de alimentación",
    fecha: "20/03/2024",
    motivo: "Verificar normativas",
    quienesVisitaron: "Departamento de Alimentación Escolar",
  ),
  VisitaGubernamental(
    titulo: "Capacitación docente",
    fecha: "25/03/2024",
    motivo: "Nuevas metodologías",
    quienesVisitaron: "Equipo de Capacitación Educativa",
  ),
  VisitaGubernamental(
    titulo: "Revisión de salud escolar",
    fecha: "30/03/2024",
    motivo: "Evaluar atención médica",
    quienesVisitaron: "Departamento de Salud Escolar",
  ),
];

List<VisitaGubernamental> visitasHospitales = [
  VisitaGubernamental(
    titulo: "Inspección de instalaciones",
    fecha: "10/03/2024",
    motivo: "Verificar condiciones de los edificios",
    quienesVisitaron:
        "Maria Isabel Camacho, Juan Pérez Gonzales y Luisa Fernández Hernandez",
  ),
  VisitaGubernamental(
    titulo: "Evaluación de calidad de atención",
    fecha: "15/03/2024",
    motivo: "Revisar estándares médicos",
    quienesVisitaron:
        "Jhony Fernandez, Mario Cronelbol y Luis Fernando Camacho",
  ),
  VisitaGubernamental(
    titulo: "Supervisión de cumplimiento normativo",
    fecha: "20/03/2024",
    motivo: "Verificar cumplimiento de regulaciones sanitarias",
    quienesVisitaron: "Evo Morales, Vinchita Soliz y Luis Fernando Camacho",
  ),
  VisitaGubernamental(
    titulo: "Capacitación de personal médico",
    fecha: "25/03/2024",
    motivo: "Impartir nuevas técnicas de atención",
    quienesVisitaron: "Equipo de Capacitación Médica",
  ),
  VisitaGubernamental(
    titulo: "Revisión de protocolos de emergencia",
    fecha: "30/03/2024",
    motivo: "Evaluar preparación para situaciones críticas",
    quienesVisitaron: "Departamento de Emergencias",
  ),
];

class DesayunoEscolar {
  String dia;
  String menu;

  DesayunoEscolar({required this.dia, required this.menu});
}

List<DesayunoEscolar> desayunosSemana = [
  DesayunoEscolar(dia: "Lunes", menu: "Leche, pan y fruta"),
  DesayunoEscolar(dia: "Martes", menu: "Cereal, jugo y galletas"),
  DesayunoEscolar(dia: "Miércoles", menu: "Yogur, tostadas y plátano"),
  DesayunoEscolar(dia: "Jueves", menu: "Avena, manzana y huevos revueltos"),
  DesayunoEscolar(dia: "Viernes", menu: "Batido de frutas, panecillos y queso"),
];
