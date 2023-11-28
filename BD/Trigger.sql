
CREATE TABLE log (
    id INT PRIMARY KEY AUTO_INCREMENT,
    action ENUM('INSERT', 'DELETE', 'UPDATE') NOT NULL,
    tabla VARCHAR(255),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    contenido_anterior TEXT,
    contenido_actual TEXT
);
DELIMITER //

CREATE TRIGGER usuario_log_trigger_insert
BEFORE INSERT ON Usuario
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('INSERT', 'Usuario', NULL, CONCAT('IDUsuario: ', NEW.IDUsuario, ', usuario: ', NEW.usuario, ', password: ', NEW.password, ', correo: ', NEW.correo));
END;

CREATE TRIGGER usuario_log_trigger_update
BEFORE UPDATE ON Usuario
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('UPDATE', 'Usuario', CONCAT('IDUsuario: ', OLD.IDUsuario, ', usuario: ', OLD.usuario, ', password: ', OLD.password, ', correo: ', OLD.correo), 
                            CONCAT('IDUsuario: ', NEW.IDUsuario, ', usuario: ', NEW.usuario, ', password: ', NEW.password, ', correo: ', NEW.correo));
END;

CREATE TRIGGER usuario_log_trigger_delete
BEFORE DELETE ON Usuario
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('DELETE', 'Usuario', CONCAT('IDUsuario: ', OLD.IDUsuario, ', usuario: ', OLD.usuario, ', password: ', OLD.password, ', correo: ', OLD.correo), NULL);
END;

CREATE TRIGGER perfil_log_trigger_insert
BEFORE INSERT ON Perfil
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('INSERT', 'Perfil', NULL, CONCAT('IDPerfil: ', NEW.IDPerfil, ', IDUsuario: ', NEW.IDUsuario, ', nombre: ', NEW.nombre, ', apellido: ', NEW.apellido, ', fecha_nac: ', NEW.fecha_nac, ', foto: ', NEW.foto));
END;

CREATE TRIGGER perfil_log_trigger_update
BEFORE UPDATE ON Perfil
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('UPDATE', 'Perfil', CONCAT('IDPerfil: ', OLD.IDPerfil, ', IDUsuario: ', OLD.IDUsuario, ', nombre: ', OLD.nombre, ', apellido: ', OLD.apellido, ', fecha_nac: ', OLD.fecha_nac, ', foto: ', OLD.foto), 
                            CONCAT('IDPerfil: ', NEW.IDPerfil, ', IDUsuario: ', NEW.IDUsuario, ', nombre: ', NEW.nombre, ', apellido: ', NEW.apellido, ', fecha_nac: ', NEW.fecha_nac, ', foto: ', NEW.foto));
END;

CREATE TRIGGER perfil_log_trigger_delete
BEFORE DELETE ON Perfil
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('DELETE', 'Perfil', CONCAT('IDPerfil: ', OLD.IDPerfil, ', IDUsuario: ', OLD.IDUsuario, ', nombre: ', OLD.nombre, ', apellido: ', OLD.apellido, ', fecha_nac: ', OLD.fecha_nac, ', foto: ', OLD.foto), NULL);
END;

CREATE TRIGGER proyecto_log_trigger_insert
BEFORE INSERT ON Proyecto
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('INSERT', 'Proyecto', NULL, CONCAT('IDProyecto: ', NEW.IDProyecto, ', titulo: ', NEW.titulo, ', descripcion: ', NEW.descripcion, ', fecha_ini: ', NEW.fecha_ini, ', fecha_fin: ', NEW.fecha_fin));
END;

CREATE TRIGGER proyecto_log_trigger_update
BEFORE UPDATE ON Proyecto
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('UPDATE', 'Proyecto', CONCAT('IDProyecto: ', OLD.IDProyecto, ', titulo: ', OLD.titulo, ', descripcion: ', OLD.descripcion, ', fecha_ini: ', OLD.fecha_ini, ', fecha_fin: ', OLD.fecha_fin), 
                            CONCAT('IDProyecto: ', NEW.IDProyecto, ', titulo: ', NEW.titulo, ', descripcion: ', NEW.descripcion, ', fecha_ini: ', NEW.fecha_ini, ', fecha_fin: ', NEW.fecha_fin));
END;

CREATE TRIGGER proyecto_log_trigger_delete
BEFORE DELETE ON Proyecto
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('DELETE', 'Proyecto', CONCAT('IDProyecto: ', OLD.IDProyecto, ', titulo: ', OLD.titulo, ', descripcion: ', OLD.descripcion, ', fecha_ini: ', OLD.fecha_ini, ', fecha_fin: ', OLD.fecha_fin), NULL);
END;

CREATE TRIGGER notificacion_log_trigger_insert
BEFORE INSERT ON Notificacion
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('INSERT', 'Notificacion', NULL, CONCAT('IDNotificacion: ', NEW.IDNotificacion, ', mensaje: ', NEW.mensaje, ', titulo: ', NEW.titulo));
END;

CREATE TRIGGER notificacion_log_trigger_update
BEFORE UPDATE ON Notificacion
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('UPDATE', 'Notificacion', CONCAT('IDNotificacion: ', OLD.IDNotificacion, ', mensaje: ', OLD.mensaje, ', titulo: ', OLD.titulo), 
                            CONCAT('IDNotificacion: ', NEW.IDNotificacion, ', mensaje: ', NEW.mensaje, ', titulo: ', NEW.titulo));
END;

CREATE TRIGGER notificacion_log_trigger_delete
BEFORE DELETE ON Notificacion
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('DELETE', 'Notificacion', CONCAT('IDNotificacion: ', OLD.IDNotificacion, ', mensaje: ', OLD.mensaje, ', titulo: ', OLD.titulo), NULL);
END;
CREATE TRIGGER tarea_log_trigger_insert
BEFORE INSERT ON Tarea
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('INSERT', 'Tarea', NULL, CONCAT('IDTarea: ', NEW.IDTarea, ', titulo: ', NEW.titulo, ', descripcion: ', NEW.descripcion, ', fechaVenc: ', NEW.fechaVenc, ', prioridad: ', NEW.prioridad, ', estado: ', NEW.estado));
END;

CREATE TRIGGER tarea_log_trigger_update
BEFORE UPDATE ON Tarea
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('UPDATE', 'Tarea', CONCAT('IDTarea: ', OLD.IDTarea, ', titulo: ', OLD.titulo, ', descripcion: ', OLD.descripcion, ', fechaVenc: ', OLD.fechaVenc, ', prioridad: ', OLD.prioridad, ', estado: ', OLD.estado), 
                            CONCAT('IDTarea: ', NEW.IDTarea, ', titulo: ', NEW.titulo, ', descripcion: ', NEW.descripcion, ', fechaVenc: ', NEW.fechaVenc, ', prioridad: ', NEW.prioridad, ', estado: ', NEW.estado));
END;

CREATE TRIGGER tarea_log_trigger_delete
BEFORE DELETE ON Tarea
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('DELETE', 'Tarea', CONCAT('IDTarea: ', OLD.IDTarea, ', titulo: ', OLD.titulo, ', descripcion: ', OLD.descripcion, ', fechaVenc: ', OLD.fechaVenc, ', prioridad: ', OLD.prioridad, ', estado: ', OLD.estado), NULL);
END;

CREATE TRIGGER usuarioproyecto_log_trigger_insert
BEFORE INSERT ON usuarioProyecto
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('INSERT', 'usuarioProyecto', NULL, CONCAT('IDUsuario: ', NEW.IDUsuario, ', IDProyecto: ', NEW.IDProyecto, ', rol: ', NEW.rol, ', fecha: ', NEW.fecha));
END;

CREATE TRIGGER usuarioproyecto_log_trigger_update
BEFORE UPDATE ON usuarioProyecto
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('UPDATE', 'usuarioProyecto', CONCAT('IDUsuario: ', OLD.IDUsuario, ', IDProyecto: ', OLD.IDProyecto, ', rol: ', OLD.rol, ', fecha: ', OLD.fecha), 
                            CONCAT('IDUsuario: ', NEW.IDUsuario, ', IDProyecto: ', NEW.IDProyecto, ', rol: ', NEW.rol, ', fecha: ', NEW.fecha));
END;

CREATE TRIGGER usuarioproyecto_log_trigger_delete
BEFORE DELETE ON usuarioProyecto
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('DELETE', 'usuarioProyecto', CONCAT('IDUsuario: ', OLD.IDUsuario, ', IDProyecto: ', OLD.IDProyecto, ', rol: ', OLD.rol, ', fecha: ', OLD.fecha), NULL);
END;

CREATE TRIGGER notificacionusuario_log_trigger_insert
BEFORE INSERT ON notificacionUsuario
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('INSERT', 'notificacionUsuario', NULL, CONCAT('IDNotificacion: ', NEW.IDNotificacion, ', fecha: ', NEW.fecha, ', IDUsuario: ', NEW.IDUsuario));
END;

CREATE TRIGGER notificacionusuario_log_trigger_update
BEFORE UPDATE ON notificacionUsuario
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('UPDATE', 'notificacionUsuario', CONCAT('IDNotificacion: ', OLD.IDNotificacion, ', fecha: ', OLD.fecha, ', IDUsuario: ', OLD.IDUsuario), 
                            CONCAT('IDNotificacion: ', NEW.IDNotificacion, ', fecha: ', NEW.fecha, ', IDUsuario: ', NEW.IDUsuario));
END;

CREATE TRIGGER notificacionusuario_log_trigger_delete
BEFORE DELETE ON notificacionUsuario
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('DELETE', 'notificacionUsuario', CONCAT('IDNotificacion: ', OLD.IDNotificacion, ', fecha: ', OLD.fecha, ', IDUsuario: ', OLD.IDUsuario), NULL);
END;

CREATE TRIGGER notificacionproyecto_log_trigger_insert
BEFORE INSERT ON notificacionProyecto
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('INSERT', 'notificacionProyecto', NULL, CONCAT('IDNotificacion: ', NEW.IDNotificacion, ', IDProyecto: ', NEW.IDProyecto, ', fecha: ', NEW.fecha));
END;

CREATE TRIGGER notificacionproyecto_log_trigger_update
BEFORE UPDATE ON notificacionProyecto
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('UPDATE', 'notificacionProyecto', CONCAT('IDNotificacion: ', OLD.IDNotificacion, ', IDProyecto: ', OLD.IDProyecto, ', fecha: ', OLD.fecha), 
                            CONCAT('IDNotificacion: ', NEW.IDNotificacion, ', IDProyecto: ', NEW.IDProyecto, ', fecha: ', NEW.fecha));
END;

CREATE TRIGGER notificacionproyecto_log_trigger_delete
BEFORE DELETE ON notificacionProyecto
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('DELETE', 'notificacionProyecto', CONCAT('IDNotificacion: ', OLD.IDNotificacion, ', IDProyecto: ', OLD.IDProyecto, ', fecha: ', OLD.fecha), NULL);
END;

CREATE TRIGGER usuariotarea_log_trigger_insert
BEFORE INSERT ON usuarioTarea
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('INSERT', 'usuarioTarea', NULL, CONCAT('IDUsuario: ', NEW.IDUsuario, ', IDProyecto: ', NEW.IDProyecto, ', IDTarea: ', NEW.IDTarea));
END;

CREATE TRIGGER usuariotarea_log_trigger_update
BEFORE UPDATE ON usuarioTarea
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('UPDATE', 'usuarioTarea', CONCAT('IDUsuario: ', OLD.IDUsuario, ', IDProyecto: ', OLD.IDProyecto, ', IDTarea: ', OLD.IDTarea), 
                            CONCAT('IDUsuario: ', NEW.IDUsuario, ', IDProyecto: ', NEW.IDProyecto, ', IDTarea: ', NEW.IDTarea));
END;

CREATE TRIGGER usuariotarea_log_trigger_delete
BEFORE DELETE ON usuarioTarea
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('DELETE', 'usuarioTarea', CONCAT('IDUsuario: ', OLD.IDUsuario, ', IDProyecto: ', OLD.IDProyecto, ', IDTarea: ', OLD.IDTarea), NULL);
END;

CREATE TRIGGER subtarea_log_trigger_insert
BEFORE INSERT ON subTarea
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('INSERT', 'subTarea', NULL, CONCAT('IDSubTarea: ', NEW.IDSubTarea, ', IDTarea: ', NEW.IDTarea, ', contenido: ', NEW.contenido, ', finalizada: ', NEW.finalizada));
END;

CREATE TRIGGER subtarea_log_trigger_update
BEFORE UPDATE ON subTarea
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('UPDATE', 'subTarea', CONCAT('IDSubTarea: ', OLD.IDSubTarea, ', IDTarea: ', OLD.IDTarea, ', contenido: ', OLD.contenido, ', finalizada: ', OLD.finalizada), 
                            CONCAT('IDSubTarea: ', NEW.IDSubTarea, ', IDTarea: ', NEW.IDTarea, ', contenido: ', NEW.contenido, ', finalizada: ', NEW.finalizada));
END;

CREATE TRIGGER subtarea_log_trigger_delete
BEFORE DELETE ON subTarea
FOR EACH ROW
BEGIN
    INSERT INTO log (action, tabla, contenido_anterior, contenido_actual)
    VALUES ('DELETE', 'subTarea', CONCAT('IDSubTarea: ', OLD.IDSubTarea, ', IDTarea: ', OLD.IDTarea, ', contenido: ', OLD.contenido, ', finalizada: ', OLD.finalizada), NULL);
END;
//
DELIMITER ;
