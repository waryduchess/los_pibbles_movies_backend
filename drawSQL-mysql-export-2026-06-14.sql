CREATE TABLE `usuarios`(
    `id_usuario` INT NOT NULL,
    `nombres` VARCHAR(100) NULL,
    `apellidos` VARCHAR(100) NULL,
    `correo` VARCHAR(150) NULL,
    `password` VARCHAR(255) NULL,
    `foto_perfil` VARCHAR(255) NULL,
    `fecha_registro` DATETIME NULL,
    PRIMARY KEY(`id_usuario`)
);
CREATE TABLE `comentarios`(
    `id_comentario` INT NOT NULL,
    `id_usuario` INT NULL,
    `id_pelicula` INT NULL,
    `comentario` TEXT NULL,
    `estrellas` INT NULL,
    `fecha` DATETIME NULL,
    PRIMARY KEY(`id_comentario`)
);
CREATE TABLE `likes_comentarios`(
    `id_like` INT NOT NULL,
    `id_usuario` INT NULL,
    `id_comentario` INT NULL,
    `fecha_like` DATETIME NULL,
    PRIMARY KEY(`id_like`)
);
CREATE TABLE `favoritos`(
    `id_favorito` INT NOT NULL,
    `id_usuario` INT NULL,
    `id_pelicula` INT NULL,
    PRIMARY KEY(`id_favorito`)
);
CREATE TABLE `peliculas_guardadas`(
    `id_guardado` INT NOT NULL,
    `id_usuario` INT NULL,
    `id_pelicula` INT NULL,
    `fecha_guardado` DATETIME NULL,
    PRIMARY KEY(`id_guardado`)
);
CREATE TABLE `busquedas`(
    `id_busqueda` INT NOT NULL,
    `id_usuario` INT NULL,
    `texto_busqueda` VARCHAR(255) NULL,
    `fecha_busqueda` DATETIME NULL,
    PRIMARY KEY(`id_busqueda`)
);
CREATE TABLE `historial_vistas`(
    `id_historial` INT NOT NULL,
    `id_usuario` INT NULL,
    `id_pelicula` INT NULL,
    `fecha_vista` DATETIME NULL,
    PRIMARY KEY(`id_historial`)
);
ALTER TABLE
    `busquedas` ADD CONSTRAINT `busquedas_id_usuario_foreign` FOREIGN KEY(`id_usuario`) REFERENCES `usuarios`(`id_usuario`);
ALTER TABLE
    `peliculas_guardadas` ADD CONSTRAINT `peliculas_guardadas_id_usuario_foreign` FOREIGN KEY(`id_usuario`) REFERENCES `usuarios`(`id_usuario`);
ALTER TABLE
    `historial_vistas` ADD CONSTRAINT `historial_vistas_id_usuario_foreign` FOREIGN KEY(`id_usuario`) REFERENCES `usuarios`(`id_usuario`);
ALTER TABLE
    `favoritos` ADD CONSTRAINT `favoritos_id_usuario_foreign` FOREIGN KEY(`id_usuario`) REFERENCES `usuarios`(`id_usuario`);
ALTER TABLE
    `likes_comentarios` ADD CONSTRAINT `likes_comentarios_id_usuario_foreign` FOREIGN KEY(`id_usuario`) REFERENCES `usuarios`(`id_usuario`);
ALTER TABLE
    `comentarios` ADD CONSTRAINT `comentarios_id_usuario_foreign` FOREIGN KEY(`id_usuario`) REFERENCES `usuarios`(`id_usuario`);
ALTER TABLE
    `likes_comentarios` ADD CONSTRAINT `likes_comentarios_id_comentario_foreign` FOREIGN KEY(`id_comentario`) REFERENCES `comentarios`(`id_comentario`);