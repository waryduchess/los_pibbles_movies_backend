CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT NOT NULL AUTO_INCREMENT,
    nombres VARCHAR(100) NULL,
    apellidos VARCHAR(100) NULL,
    correo VARCHAR(150) NULL,
    password VARCHAR(255) NULL,
    foto_perfil VARCHAR(255) NULL,
    fecha_registro DATETIME NULL,
    PRIMARY KEY(id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS comentarios (
    id_comentario INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NULL,
    id_pelicula INT NULL,
    comentario TEXT NULL,
    estrellas INT NULL,
    fecha DATETIME NULL,
    PRIMARY KEY(id_comentario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS likes_comentarios (
    id_like INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NULL,
    id_comentario INT NULL,
    fecha_like DATETIME NULL,
    PRIMARY KEY(id_like)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS favoritos (
    id_favorito INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NULL,
    id_pelicula INT NULL,
    PRIMARY KEY(id_favorito)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS peliculas_guardadas (
    id_guardado INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NULL,
    id_pelicula INT NULL,
    fecha_guardado DATETIME NULL,
    PRIMARY KEY(id_guardado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS busquedas (
    id_busqueda INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NULL,
    texto_busqueda VARCHAR(255) NULL,
    fecha_busqueda DATETIME NULL,
    PRIMARY KEY(id_busqueda)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS historial_vistas (
    id_historial INT NOT NULL AUTO_INCREMENT,
    id_usuario INT NULL,
    id_pelicula INT NULL,
    fecha_vista DATETIME NULL,
    PRIMARY KEY(id_historial)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE busquedas
    ADD CONSTRAINT busquedas_id_usuario_foreign FOREIGN KEY (id_usuario)
    REFERENCES usuarios (id_usuario);

ALTER TABLE peliculas_guardadas
    ADD CONSTRAINT peliculas_guardadas_id_usuario_foreign FOREIGN KEY (id_usuario)
    REFERENCES usuarios (id_usuario);

ALTER TABLE historial_vistas
    ADD CONSTRAINT historial_vistas_id_usuario_foreign FOREIGN KEY (id_usuario)
    REFERENCES usuarios (id_usuario);

ALTER TABLE favoritos
    ADD CONSTRAINT favoritos_id_usuario_foreign FOREIGN KEY (id_usuario)
    REFERENCES usuarios (id_usuario);

ALTER TABLE likes_comentarios
    ADD CONSTRAINT likes_comentarios_id_usuario_foreign FOREIGN KEY (id_usuario)
    REFERENCES usuarios (id_usuario);

ALTER TABLE comentarios
    ADD CONSTRAINT comentarios_id_usuario_foreign FOREIGN KEY (id_usuario)
    REFERENCES usuarios (id_usuario);

ALTER TABLE likes_comentarios
    ADD CONSTRAINT likes_comentarios_id_comentario_foreign FOREIGN KEY (id_comentario)
    REFERENCES comentarios (id_comentario);
