USE [master]
GO
/****** Object:  Database [TOTILO_DB]    Script Date: 15/6/2020 19:04:13 ******/
CREATE DATABASE [TOTILO_DB]
GO
USE [TOTILO_DB]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 15/6/2020 19:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[IDArticulo] [bigint] IDENTITY(1,1) NOT NULL,
	[IDMarca] [bigint] NOT NULL,
	[IDEstilo] [bigint] NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[ABV] [float] NULL,
	[IBU] [float] NULL,
	[Valoracion] [float] NULL,
	[Volumen] [int] NULL,
	[Precio] [decimal](6, 2) NOT NULL,
	[ImagenUrl] [varchar](500) NULL,
	[Estado] [bit] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[IDArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Domicilio]    Script Date: 15/6/2020 19:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Domicilio](
	[IDDomicilio] [bigint] IDENTITY(1,1) NOT NULL,
	[IDProvincia] [int] NOT NULL,
	[Ciudad] [varchar](100) NOT NULL,
	[Calle] [varchar](100) NOT NULL,
	[Numero] [int] NOT NULL,
	[Piso] [int] NULL,
	[Depto] [varchar](100) NULL,
	[Referencia] [varchar](100) NULL,
	[CodigoPostal] [int] NULL,
 CONSTRAINT [PK_Domicilio] PRIMARY KEY CLUSTERED 
(
	[IDDomicilio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estilos]    Script Date: 15/6/2020 19:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estilos](
	[IDEstilo] [bigint] IDENTITY(1,1) NOT NULL,
	[NombreEstilo] [varchar](100) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Estilos] PRIMARY KEY CLUSTERED 
(
	[IDEstilo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favoritos_x_Usuario]    Script Date: 15/6/2020 19:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favoritos_x_Usuario](
	[IDArticulo] [bigint] NOT NULL,
	[IDUsuario] [bigint] NOT NULL,
 CONSTRAINT [PK_Favoritos_x_Usuario] PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC,
	[IDArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 15/6/2020 19:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[IDMarca] [bigint] IDENTITY(1,1) NOT NULL,
	[IDDomicilio] [bigint] NOT NULL,
	[NombreMarca] [varchar](100) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[IDMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 15/6/2020 19:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[IDProvincia] [int] IDENTITY(1,1) NOT NULL,
	[NombreProvincia] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Provincias] PRIMARY KEY CLUSTERED 
(
	[IDProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 15/6/2020 19:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[IDTipo] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipo] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[IDTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 15/6/2020 19:04:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IDUsuario] [bigint] IDENTITY(1,1) NOT NULL,
	[IDDomicilio] [bigint] NOT NULL,
	[IDTipoUsuario] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Sexo] [char](1) NULL,
	[DNI] [int] NOT NULL,
	[FechaNac] [date] NOT NULL,
	[Telefono] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Contraseña] [varchar](100) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IDUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Articulo] ON 
GO
INSERT [dbo].[Articulo] ([IDArticulo], [IDMarca], [IDEstilo], [Descripcion], [ABV], [IBU], [Valoracion], [Volumen], [Precio], [ImagenUrl], [Estado], [Nombre]) VALUES (25, 1, 5, N'Amarga, pero muy equilibrada. Exquisita combinación de maltas caramelo con las notas de pomelo del lúpulo cascade. Con esta APA comenzó la historia de Manush. Un amor duradero. Lúpulos: Nugget y Cascade.', 5.4, 34, 5, 473, CAST(283.00 AS Decimal(6, 2)), N'https://cervezamanush.com.ar/2020/wp-content/uploads/2020/05/apa-1200x1200px-324x324.jpg', 1, N'APA')
GO
INSERT [dbo].[Articulo] ([IDArticulo], [IDMarca], [IDEstilo], [Descripcion], [ABV], [IBU], [Valoracion], [Volumen], [Precio], [ImagenUrl], [Estado], [Nombre]) VALUES (26, 1, 4, N'Nuestra negra clásica es uno de los pilares de Manush. De cuerpo pleno, sabor torrado a café y con notas tostadas. Se caracteriza por su espuma duradera y de alta cremosidad. Nuestros clientes siempre la repiten por ser intensa y refrescante a la vez. Lúpulos: Bullion y Willamette.', 4.4, 32, 5, 473, CAST(285.00 AS Decimal(6, 2)), N'https://cervezamanush.com.ar/2020/wp-content/uploads/2020/05/stout-1200x1200px.jpg', 1, N'Extra Stout')
GO
INSERT [dbo].[Articulo] ([IDArticulo], [IDMarca], [IDEstilo], [Descripcion], [ABV], [IBU], [Valoracion], [Volumen], [Precio], [ImagenUrl], [Estado], [Nombre]) VALUES (27, 1, 7, N'Floral, delicada y suave. Manush Honey es una armónica combinación de maltas claras, miel y mucha pasión. Lúpulos: Willamette.

', 6.5, 14.8, 5, 473, CAST(260.00 AS Decimal(6, 2)), N'https://cervezamanush.com.ar/2020/wp-content/uploads/2020/05/honey-1200x1200px.jpg', 1, N'Honey')
GO
INSERT [dbo].[Articulo] ([IDArticulo], [IDMarca], [IDEstilo], [Descripcion], [ABV], [IBU], [Valoracion], [Volumen], [Precio], [ImagenUrl], [Estado], [Nombre]) VALUES (28, 1, 4, N'Ale americana cobriza, floral, con toques herbáceos y cítricos. Buscamos el equilibrio entre el cuerpo y el lúpulo. Toda IPA Manush debe pasar la prueba del globo y el elefante: volar establemente con un buen contrapeso. Lúpulos: Nugget y Cascade.', 5.5, 58, 5, 473, CAST(285.00 AS Decimal(6, 2)), N'https://cervezamanush.com.ar/2020/wp-content/uploads/2020/05/ipa-1200x1200px.jpg', 1, N'IPA')
GO
INSERT [dbo].[Articulo] ([IDArticulo], [IDMarca], [IDEstilo], [Descripcion], [ABV], [IBU], [Valoracion], [Volumen], [Precio], [ImagenUrl], [Estado], [Nombre]) VALUES (29, 1, 8, N'La mejor opción para iniciarse en Manush es nuestra rubia clásica. Estilo ideal para medir un buen trabajo de fermentación. Liviana, maltosa y muy refrescante, con exquisitas notas a pera. Lúpulos: Willamette.', 5.2, 58, 5, 473, CAST(275.00 AS Decimal(6, 2)), N'https://cervezamanush.com.ar/2020/wp-content/uploads/2020/05/koslch-1200x1200px.jpg', 1, N'Kolsch')
GO
INSERT [dbo].[Articulo] ([IDArticulo], [IDMarca], [IDEstilo], [Descripcion], [ABV], [IBU], [Valoracion], [Volumen], [Precio], [ImagenUrl], [Estado], [Nombre]) VALUES (30, 1, 2, N'Una de las más elegidas. Ale Irlandesa fácil de beber, con sabores sutiles a grano y bizcocho. Posee un toque tostado en el final que la hace muy refrescante. Lúpulos: Nugget y Bullion.', 4.9, 20, 5, 473, CAST(260.00 AS Decimal(6, 2)), N'https://cervezamanush.com.ar/2020/wp-content/uploads/2020/05/irish-1200x1200px.jpg', 1, N'Irish Cream Ale')
GO
INSERT [dbo].[Articulo] ([IDArticulo], [IDMarca], [IDEstilo], [Descripcion], [ABV], [IBU], [Valoracion], [Volumen], [Precio], [ImagenUrl], [Estado], [Nombre]) VALUES (32, 1, 4, N'Cerveza en homenaje a Burton, el lugar donde nacieron las IPA. Hecha en una triple mezcla de fermentaciones, como un exquisito varietal. El lúpulo Styrian Golden le brinda una alta complejidad: frutal y fresca, con aromas a hierbas, té verde y Earl Grey. Un sorbo de esta cerveza te puede llevar a cualquier parte que imagines.
Disfrútese con tiempo: lo mejor nuestro siempre está madurando.
Lúpulo: Styrian Golden.', 6.9, 55, 5, 473, CAST(300.00 AS Decimal(6, 2)), N'https://cervezamanush.com.ar/2020/wp-content/uploads/2020/06/burton-ipa-1200x1200px.jpg', 1, N'Mr Burton Ipa')
GO
INSERT [dbo].[Articulo] ([IDArticulo], [IDMarca], [IDEstilo], [Descripcion], [ABV], [IBU], [Valoracion], [Volumen], [Precio], [ImagenUrl], [Estado], [Nombre]) VALUES (33, 1, 2, N'Cerveza roja escocesa tipo ale, muy suntuosa. La combinación de 5 variedades de malta le da un color cobrizo oscuro con notas ahumadas y acarameladas. Lúpulos: Nugget.', 5.6, 24, 5, 473, CAST(260.00 AS Decimal(6, 2)), N'https://cervezamanush.com.ar/2020/wp-content/uploads/2020/06/scotch-1200x1200px.jpg', 1, N'Scotch')
GO
INSERT [dbo].[Articulo] ([IDArticulo], [IDMarca], [IDEstilo], [Descripcion], [ABV], [IBU], [Valoracion], [Volumen], [Precio], [ImagenUrl], [Estado], [Nombre]) VALUES (34, 1, 6, N'Ale inglesa de cuerpo pleno y cremoso, levemente dulce y sedosa, pero con el lúpulo justo para balancear el gusto. Las maltas tostadas le dan notas a café y chocolate, y las caramelizadas aportan aromas a nuez y caramelo. Su nombre se debe al agregado de lactosa. Lúpulos: Bullion.', 4.2, 26.2, 5, 473, CAST(270.00 AS Decimal(6, 2)), N'https://cervezamanush.com.ar/2020/wp-content/uploads/2020/05/milk-1200x1200px.jpg', 1, N'Milk Stout')
GO
INSERT [dbo].[Articulo] ([IDArticulo], [IDMarca], [IDEstilo], [Descripcion], [ABV], [IBU], [Valoracion], [Volumen], [Precio], [ImagenUrl], [Estado], [Nombre]) VALUES (35, 1, 4, N'Una cuidada selección de lúpulos para evocar nuestros mejores recuerdos de frescura y aire libre. Esta IPA, que se mantiene y cambia a la vez, representa la persistencia del verano que todos llevamos dentro.', 5, 30, 5, 473, CAST(280.00 AS Decimal(6, 2)), N'https://cervezamanush.com.ar/2020/wp-content/uploads/2020/05/session-1200x1200px.jpg', 1, N'IPA Session')
GO
SET IDENTITY_INSERT [dbo].[Articulo] OFF
GO
SET IDENTITY_INSERT [dbo].[Domicilio] ON 
GO
INSERT [dbo].[Domicilio] ([IDDomicilio], [IDProvincia], [Ciudad], [Calle], [Numero], [Piso], [Depto], [Referencia], [CodigoPostal]) VALUES (1, 14, N'Bariloche', N'Dr. Juan Javier Nuemyer', 20, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Domicilio] ([IDDomicilio], [IDProvincia], [Ciudad], [Calle], [Numero], [Piso], [Depto], [Referencia], [CodigoPostal]) VALUES (2, 1, N'CABA', N'Jose Maria Moreno ', 351, 2, N'G', NULL, 1424)
GO
SET IDENTITY_INSERT [dbo].[Domicilio] OFF
GO
SET IDENTITY_INSERT [dbo].[Estilos] ON 
GO
INSERT [dbo].[Estilos] ([IDEstilo], [NombreEstilo], [Estado]) VALUES (1, N'Blonde', 1)
GO
INSERT [dbo].[Estilos] ([IDEstilo], [NombreEstilo], [Estado]) VALUES (2, N'Red', 1)
GO
INSERT [dbo].[Estilos] ([IDEstilo], [NombreEstilo], [Estado]) VALUES (4, N'IPA', 1)
GO
INSERT [dbo].[Estilos] ([IDEstilo], [NombreEstilo], [Estado]) VALUES (5, N'APA', 1)
GO
INSERT [dbo].[Estilos] ([IDEstilo], [NombreEstilo], [Estado]) VALUES (6, N'Stout', 1)
GO
INSERT [dbo].[Estilos] ([IDEstilo], [NombreEstilo], [Estado]) VALUES (7, N'Honey', 1)
GO
INSERT [dbo].[Estilos] ([IDEstilo], [NombreEstilo], [Estado]) VALUES (8, N'Koclsh', 1)
GO
SET IDENTITY_INSERT [dbo].[Estilos] OFF
GO
SET IDENTITY_INSERT [dbo].[Marcas] ON 
GO
INSERT [dbo].[Marcas] ([IDMarca], [IDDomicilio], [NombreMarca], [Estado]) VALUES (1, 1, N'Manush', 1)
GO
SET IDENTITY_INSERT [dbo].[Marcas] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincias] ON 
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (1, N'Buenos Aires')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (2, N'Catamarca')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (3, N'Chaco')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (4, N'Chubut')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (5, N'Cordoba')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (6, N'Corrientes')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (7, N'Entre Rios')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (8, N'Formosa')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (9, N'Jujuy')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (10, N'La Pampa')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (11, N'La Rioja')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (12, N'Mendoza')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (13, N'Neuquen')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (14, N'Rio Negro')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (15, N'Salta')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (16, N'San Juan')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (17, N'San Luis')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (18, N'Santa Cruz')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (19, N'Santa Fe')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (20, N'Santiago del Estero')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (21, N'Ushuaia')
GO
INSERT [dbo].[Provincias] ([IDProvincia], [NombreProvincia]) VALUES (22, N'San Miguel de Tucuman')
GO
SET IDENTITY_INSERT [dbo].[Provincias] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoUsuario] ON 
GO
INSERT [dbo].[TipoUsuario] ([IDTipo], [NombreTipo]) VALUES (1, N'Admin')
GO
INSERT [dbo].[TipoUsuario] ([IDTipo], [NombreTipo]) VALUES (2, N'Cliente')
GO
INSERT [dbo].[TipoUsuario] ([IDTipo], [NombreTipo]) VALUES (3, N'Comprador')
GO
SET IDENTITY_INSERT [dbo].[TipoUsuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([IDUsuario], [IDDomicilio], [IDTipoUsuario], [Nombre], [Apellido], [Sexo], [DNI], [FechaNac], [Telefono], [Email], [Contraseña], [Estado]) VALUES (1, 2, 1, N'Cristian', N'Totilo', N'M', 38680106, CAST(N'1995-04-21' AS Date), 1162083914, N'totilocristian@gmail.com', N'1234', 1)
GO
INSERT [dbo].[Usuarios] ([IDUsuario], [IDDomicilio], [IDTipoUsuario], [Nombre], [Apellido], [Sexo], [DNI], [FechaNac], [Telefono], [Email], [Contraseña], [Estado]) VALUES (3, 1, 2, N'Manush', N'Garcia', N'M', 638374, CAST(N'1930-01-01' AS Date), 44248793, N'manush@gmail.com.ar', N'12345', 1)
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Marcas]    Script Date: 15/6/2020 19:04:14 ******/
ALTER TABLE [dbo].[Marcas] ADD  CONSTRAINT [UQ_Marcas] UNIQUE NONCLUSTERED 
(
	[NombreMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Usuarios]    Script Date: 15/6/2020 19:04:14 ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [UQ_Usuarios] UNIQUE NONCLUSTERED 
(
	[Email] ASC,
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_ArticuloEstilo] FOREIGN KEY([IDEstilo])
REFERENCES [dbo].[Estilos] ([IDEstilo])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_ArticuloEstilo]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_ArticuloMarca] FOREIGN KEY([IDMarca])
REFERENCES [dbo].[Marcas] ([IDMarca])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_ArticuloMarca]
GO
ALTER TABLE [dbo].[Domicilio]  WITH CHECK ADD  CONSTRAINT [FK_DomicilioProvincias] FOREIGN KEY([IDProvincia])
REFERENCES [dbo].[Provincias] ([IDProvincia])
GO
ALTER TABLE [dbo].[Domicilio] CHECK CONSTRAINT [FK_DomicilioProvincias]
GO
ALTER TABLE [dbo].[Favoritos_x_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_FavoritoArticulo] FOREIGN KEY([IDArticulo])
REFERENCES [dbo].[Articulo] ([IDArticulo])
GO
ALTER TABLE [dbo].[Favoritos_x_Usuario] CHECK CONSTRAINT [FK_FavoritoArticulo]
GO
ALTER TABLE [dbo].[Favoritos_x_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_FavoritoUsuario] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[Usuarios] ([IDUsuario])
GO
ALTER TABLE [dbo].[Favoritos_x_Usuario] CHECK CONSTRAINT [FK_FavoritoUsuario]
GO
ALTER TABLE [dbo].[Marcas]  WITH CHECK ADD  CONSTRAINT [FK_MarcaDomicilio] FOREIGN KEY([IDDomicilio])
REFERENCES [dbo].[Domicilio] ([IDDomicilio])
GO
ALTER TABLE [dbo].[Marcas] CHECK CONSTRAINT [FK_MarcaDomicilio]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioDomicilio] FOREIGN KEY([IDDomicilio])
REFERENCES [dbo].[Domicilio] ([IDDomicilio])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_UsuarioDomicilio]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioTipo] FOREIGN KEY([IDTipoUsuario])
REFERENCES [dbo].[TipoUsuario] ([IDTipo])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_UsuarioTipo]
GO
USE [master]
GO
ALTER DATABASE [TOTILO_DB] SET  READ_WRITE 
GO
