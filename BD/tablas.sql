use prueba;
CREATE TABLE Usuario (
    IDUsuario INT PRIMARY KEY auto_increment,
    usuario VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    correo VARCHAR(255) NOT NULL
);

CREATE TABLE Perfil (
    IDPerfil INT PRIMARY KEY auto_increment,
    IDUsuario INT,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    fecha_nac DATE,
    foto VARCHAR(225),
    FOREIGN KEY (IDUsuario) REFERENCES Usuario(IDUsuario)
);

CREATE TABLE Proyecto (
    IDProyecto INT PRIMARY KEY auto_increment,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_ini DATE,
    fecha_fin DATE
);

CREATE TABLE Notificacion (
    IDNotificacion INT PRIMARY KEY,
    mensaje TEXT,
    titulo VARCHAR(255) NOT NULL
);

CREATE TABLE Tarea (
    IDTarea INT PRIMARY KEY auto_increment,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fechaVenc DATE,
    prioridad ENUM ('1', '2', '3', '5', '8', '13', '21', '34'),
    estado ENUM ('por hacer', 'en curso', 'listo')
);

CREATE TABLE usuarioProyecto (
    IDUsuario INT,
    IDProyecto INT,
    rol ENUM('Administrador', 'miembro', 'invitado'),
    fecha DATE,
    PRIMARY KEY (IDUsuario, IDProyecto),
    FOREIGN KEY (IDUsuario) REFERENCES Usuario(IDUsuario),
    FOREIGN KEY (IDProyecto) REFERENCES Proyecto(IDProyecto)
);

CREATE TABLE notificacionUsuario (
    IDNotificacion INT auto_increment,
    fecha DATE,
    IDUsuario INT,
    PRIMARY KEY (IDNotificacion),
    FOREIGN KEY (IDNotificacion) REFERENCES Notificacion(IDNotificacion),
    FOREIGN KEY (IDUsuario) REFERENCES Usuario(IDUsuario)
);

CREATE TABLE notificacionProyecto (
    IDNotificacion INT,
    IDProyecto INT,
    fecha DATE,
    PRIMARY KEY (IDNotificacion, IDProyecto),
    FOREIGN KEY (IDNotificacion) REFERENCES Notificacion(IDNotificacion),
    FOREIGN KEY (IDProyecto) REFERENCES Proyecto(IDProyecto)
);

CREATE TABLE usuarioTarea (
    IDUsuario INT,
    IDProyecto INT,
    IDTarea INT,
    PRIMARY KEY (IDUsuario, IDProyecto, IDTarea),
    FOREIGN KEY (IDUsuario, IDProyecto) REFERENCES usuarioProyecto(IDUsuario, IDProyecto),
    FOREIGN KEY (IDTarea) REFERENCES Tarea(IDTarea)
);

CREATE TABLE subTarea (
    IDSubTarea INT PRIMARY KEY auto_increment,
    IDTarea INT,
    contenido TEXT,
    finalizada BOOLEAN,
    FOREIGN KEY (IDTarea) REFERENCES Tarea(IDTarea)
);