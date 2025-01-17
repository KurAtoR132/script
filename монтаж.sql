USE [master]
GO
/****** Object:  Database [montage]    Script Date: 22.06.2024 8:25:40 ******/
CREATE DATABASE [montage]
GO
USE [montage]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 22.06.2024 8:25:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[ClientName] [nvarchar](200) NOT NULL,
	[Adress] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipeMontage]    Script Date: 22.06.2024 8:25:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipeMontage](
	[TipeMontageId] [int] IDENTITY(1,1) NOT NULL,
	[TipeMontageName] [nvarchar](200) NOT NULL,
	[Time] [int] NOT NULL,
	[Prise] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_TipeMontage] PRIMARY KEY CLUSTERED 
(
	[TipeMontageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Works]    Script Date: 22.06.2024 8:25:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Works](
	[WorkId] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[TipeMontageId] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Works_1] PRIMARY KEY CLUSTERED 
(
	[WorkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ClientId], [ClientName], [Adress], [Phone]) VALUES (2008, N'Света', N'Зеленая, 3', N'987654345678')
INSERT [dbo].[Clients] ([ClientId], [ClientName], [Adress], [Phone]) VALUES (4003, N'Тимур', N'Комарова, 43', N'89393813149')
INSERT [dbo].[Clients] ([ClientId], [ClientName], [Adress], [Phone]) VALUES (4004, N'Макар', N'Комарова, 43', N'89297213529')
INSERT [dbo].[Clients] ([ClientId], [ClientName], [Adress], [Phone]) VALUES (6003, N'Frfrf', N'Гордеева, 30', N'88005353535')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[TipeMontage] ON 

INSERT [dbo].[TipeMontage] ([TipeMontageId], [TipeMontageName], [Time], [Prise]) VALUES (3008, N'Бюджетный', 3, CAST(1200 AS Decimal(18, 0)))
INSERT [dbo].[TipeMontage] ([TipeMontageId], [TipeMontageName], [Time], [Prise]) VALUES (3009, N'Базовый', 3, CAST(2300 AS Decimal(18, 0)))
INSERT [dbo].[TipeMontage] ([TipeMontageId], [TipeMontageName], [Time], [Prise]) VALUES (3010, N'Обширный', 4, CAST(6500 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[TipeMontage] OFF
GO
SET IDENTITY_INSERT [dbo].[Works] ON 

INSERT [dbo].[Works] ([WorkId], [ClientId], [TipeMontageId], [Date]) VALUES (4005, 4004, 3010, CAST(N'2024-06-20' AS Date))
INSERT [dbo].[Works] ([WorkId], [ClientId], [TipeMontageId], [Date]) VALUES (5004, 4004, 3009, CAST(N'2024-06-22' AS Date))
INSERT [dbo].[Works] ([WorkId], [ClientId], [TipeMontageId], [Date]) VALUES (5005, 2008, 3010, CAST(N'2024-06-22' AS Date))
INSERT [dbo].[Works] ([WorkId], [ClientId], [TipeMontageId], [Date]) VALUES (5006, 4003, 3008, CAST(N'2024-06-22' AS Date))
SET IDENTITY_INSERT [dbo].[Works] OFF
GO
ALTER TABLE [dbo].[Works]  WITH CHECK ADD  CONSTRAINT [FK_Works_Clients] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Works] CHECK CONSTRAINT [FK_Works_Clients]
GO
ALTER TABLE [dbo].[Works]  WITH CHECK ADD  CONSTRAINT [FK_Works_TipeMontage] FOREIGN KEY([TipeMontageId])
REFERENCES [dbo].[TipeMontage] ([TipeMontageId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Works] CHECK CONSTRAINT [FK_Works_TipeMontage]
GO
USE [master]
GO
ALTER DATABASE [montage] SET  READ_WRITE 
GO
