USE [ABC]
GO
/****** Object:  Table [dbo].[TContent]    Script Date: 03/22/2020 12:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TContent](
	[Filter] [nvarchar](128) NOT NULL,
	[Column1] [nvarchar](max) NULL,
	[Column2] [nvarchar](max) NULL,
	[Column3] [nvarchar](max) NULL,
	[Column4] [nvarchar](max) NULL,
	[Column5] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.TContent] PRIMARY KEY CLUSTERED 
(
	[Filter] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 03/22/2020 12:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Slider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Picture] [varchar](150) NULL,
	[Title] [varchar](100) NULL,
	[SubTitle] [varchar](100) NULL,
	[Description] [varchar](250) NULL,
	[CategoryLink] [varchar](150) NULL,
	[ProductLink] [varchar](150) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[PIndex] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Slider] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Slider] ON
INSERT [dbo].[Slider] ([ID], [Picture], [Title], [SubTitle], [Description], [CategoryLink], [ProductLink], [Price], [PIndex]) VALUES (1, N'/Content/img/slider/4.jpg', N'KAÇIRILMAYACAK FIRSATLARI', N'MODANIN EN YENİ ADRESİNDE SİZ DE YERİNİZİ ALIN', N'Kırmızı Basic -%100 Pamuk Bisiklet Yaka Örme T-shirt TOFSS18DU0033', N'#', N'#', CAST(90.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Slider] ([ID], [Picture], [Title], [SubTitle], [Description], [CategoryLink], [ProductLink], [Price], [PIndex]) VALUES (2, N'/Content/img/slider/3.jpg', N'EN UYGUNU BURADA', N'CEKETLER', N'Kırmızı Basic -%100 Pamuk Bisiklet Yaka Örme T-shirt TOFSS18DU0033', N'#', N'#', CAST(80.00 AS Decimal(18, 2)), 2)
SET IDENTITY_INSERT [dbo].[Slider] OFF
/****** Object:  Table [dbo].[Member]    Script Date: 03/22/2020 12:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
	[SurName] [varchar](30) NULL,
	[MailAddress] [varchar](80) NULL,
	[Password] [varchar](80) NULL,
	[LastDate] [datetime] NOT NULL,
	[LastIP] [varchar](20) NULL,
	[Role] [varchar](10) NULL,
 CONSTRAINT [PK_dbo.Member] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 03/22/2020 12:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PIndex] [int] NOT NULL,
	[IsNew] [bit] NOT NULL,
	[ParentID] [int] NULL,
	[Name] [varchar](30) NULL,
 CONSTRAINT [PK_dbo.Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON
INSERT [dbo].[Category] ([ID], [PIndex], [IsNew], [ParentID], [Name]) VALUES (1, 1, 0, NULL, N'Kadın')
INSERT [dbo].[Category] ([ID], [PIndex], [IsNew], [ParentID], [Name]) VALUES (2, 2, 0, NULL, N'Erkek')
INSERT [dbo].[Category] ([ID], [PIndex], [IsNew], [ParentID], [Name]) VALUES (3, 3, 0, NULL, N'Çocuk')
INSERT [dbo].[Category] ([ID], [PIndex], [IsNew], [ParentID], [Name]) VALUES (4, 4, 0, NULL, N'Ayakkabı')
INSERT [dbo].[Category] ([ID], [PIndex], [IsNew], [ParentID], [Name]) VALUES (5, 5, 1, NULL, N'Mücevher')
INSERT [dbo].[Category] ([ID], [PIndex], [IsNew], [ParentID], [Name]) VALUES (6, 6, 0, NULL, N'Aksesuar')
INSERT [dbo].[Category] ([ID], [PIndex], [IsNew], [ParentID], [Name]) VALUES (7, 1, 0, 1, N'Etek')
INSERT [dbo].[Category] ([ID], [PIndex], [IsNew], [ParentID], [Name]) VALUES (8, 2, 0, 1, N'Gömlek')
INSERT [dbo].[Category] ([ID], [PIndex], [IsNew], [ParentID], [Name]) VALUES (9, 3, 0, 1, N'Kazak')
INSERT [dbo].[Category] ([ID], [PIndex], [IsNew], [ParentID], [Name]) VALUES (10, 4, 0, 1, N'Denim')
INSERT [dbo].[Category] ([ID], [PIndex], [IsNew], [ParentID], [Name]) VALUES (11, 5, 0, 1, N'Elbise')
INSERT [dbo].[Category] ([ID], [PIndex], [IsNew], [ParentID], [Name]) VALUES (12, 1, 0, 2, N'Pantolon')
INSERT [dbo].[Category] ([ID], [PIndex], [IsNew], [ParentID], [Name]) VALUES (13, 2, 0, 2, N'Kıravat')
INSERT [dbo].[Category] ([ID], [PIndex], [IsNew], [ParentID], [Name]) VALUES (14, 3, 0, 2, N'Yelek')
INSERT [dbo].[Category] ([ID], [PIndex], [IsNew], [ParentID], [Name]) VALUES (16, 1, 0, 1, N'x')
INSERT [dbo].[Category] ([ID], [PIndex], [IsNew], [ParentID], [Name]) VALUES (17, 1, 0, NULL, N'Deneme')
SET IDENTITY_INSERT [dbo].[Category] OFF
/****** Object:  Table [dbo].[Brand]    Script Date: 03/22/2020 12:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
 CONSTRAINT [PK_dbo.Brand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON
INSERT [dbo].[Brand] ([ID], [Name]) VALUES (1, N'Zara')
INSERT [dbo].[Brand] ([ID], [Name]) VALUES (2, N'Mango')
INSERT [dbo].[Brand] ([ID], [Name]) VALUES (3, N'Adidas')
INSERT [dbo].[Brand] ([ID], [Name]) VALUES (4, N'Koton')
INSERT [dbo].[Brand] ([ID], [Name]) VALUES (5, N'Puma')
INSERT [dbo].[Brand] ([ID], [Name]) VALUES (6, N'HM')
INSERT [dbo].[Brand] ([ID], [Name]) VALUES (7, N'LC Waikiki')
INSERT [dbo].[Brand] ([ID], [Name]) VALUES (8, N'Mavi')
INSERT [dbo].[Brand] ([ID], [Name]) VALUES (9, N'Kığılı')
INSERT [dbo].[Brand] ([ID], [Name]) VALUES (10, N'DS Damat')
SET IDENTITY_INSERT [dbo].[Brand] OFF
/****** Object:  Table [dbo].[Advertisement]    Script Date: 03/22/2020 12:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Advertisement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
	[FPath] [varchar](150) NULL,
	[Link] [varchar](150) NULL,
	[PIndex] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Advertisement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Advertisement] ON
INSERT [dbo].[Advertisement] ([ID], [Name], [FPath], [Link], [PIndex]) VALUES (1, N'Reklam 1', N'/content/img/advertisement/1.jpg', N'#', 1)
INSERT [dbo].[Advertisement] ([ID], [Name], [FPath], [Link], [PIndex]) VALUES (2, N'Reklam 2', N'/content/img/advertisement/2.jpg', N'#', 2)
SET IDENTITY_INSERT [dbo].[Advertisement] OFF
/****** Object:  Table [dbo].[Admin]    Script Date: 03/22/2020 12:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[UserName] [varchar](30) NOT NULL,
	[NameSurname] [varchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[LastDate] [datetime] NOT NULL,
	[LastIP] [varchar](20) NULL,
	[Role] [varchar](10) NULL,
 CONSTRAINT [PK_dbo.Admin] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Admin] ([UserName], [NameSurname], [Password], [LastDate], [LastIP], [Role]) VALUES (N'admin', N'Ali Veli', N'123', CAST(0x0000000000000000 AS DateTime), N'1', N'admin')
/****** Object:  Table [dbo].[Order]    Script Date: 03/22/2020 12:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [varchar](10) NULL,
	[MailAddress] [varchar](80) NULL,
	[PayOption] [int] NOT NULL,
	[DeliveryNameSurname] [varchar](50) NULL,
	[DeliveryPhone] [varchar](30) NULL,
	[DeliveryAddress] [varchar](250) NULL,
	[InvoiceNameSurname] [varchar](50) NULL,
	[InvoiceTaxOffice] [varchar](30) NULL,
	[InvoiceTaxNumber] [varchar](30) NULL,
	[InvoiceAddress] [varchar](250) NULL,
	[Shipment] [decimal](18, 2) NOT NULL,
	[OrderStatus] [int] NOT NULL,
	[RecDate] [datetime] NOT NULL,
	[IPAddress] [varchar](20) NULL,
	[MemberID] [int] NULL,
 CONSTRAINT [PK_dbo.Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON
INSERT [dbo].[Order] ([ID], [OrderNumber], [MailAddress], [PayOption], [DeliveryNameSurname], [DeliveryPhone], [DeliveryAddress], [InvoiceNameSurname], [InvoiceTaxOffice], [InvoiceTaxNumber], [InvoiceAddress], [Shipment], [OrderStatus], [RecDate], [IPAddress], [MemberID]) VALUES (2, N'TRW123', N'deneme@deneme.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(7.90 AS Decimal(18, 2)), 1, CAST(0x0000A9F100000000 AS DateTime), N'1', NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
/****** Object:  Table [dbo].[Address]    Script Date: 03/22/2020 12:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NULL,
	[MemberAddress] [varchar](150) NULL,
	[City] [varchar](50) NULL,
	[District] [varchar](50) NULL,
	[MemberID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Address] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 03/22/2020 12:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[PIndex] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[BrandID] [int] NOT NULL,
	[Stock] [int] NOT NULL,
	[IsNew] [bit] NOT NULL,
	[IsDiscount] [bit] NOT NULL,
	[Detail] [text] NULL,
 CONSTRAINT [PK_dbo.Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ID], [Name], [Price], [PIndex], [CategoryID], [BrandID], [Stock], [IsNew], [IsDiscount], [Detail]) VALUES (3, N'Ürün 1', CAST(1111.00 AS Decimal(18, 2)), 1, 3, 1, 0, 0, 0, N'sdfsdfsdf')
INSERT [dbo].[Product] ([ID], [Name], [Price], [PIndex], [CategoryID], [BrandID], [Stock], [IsNew], [IsDiscount], [Detail]) VALUES (5, N'Ürün 2', CAST(2222.00 AS Decimal(18, 2)), 1, 13, 9, 0, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Price], [PIndex], [CategoryID], [BrandID], [Stock], [IsNew], [IsDiscount], [Detail]) VALUES (6, N'Ürün 3', CAST(1.00 AS Decimal(18, 2)), 1, 3, 2, 0, 0, 0, N'<p><strong>asdasdasdasd</strong></p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [PIndex], [CategoryID], [BrandID], [Stock], [IsNew], [IsDiscount], [Detail]) VALUES (7, N'Ürün 4', CAST(123.00 AS Decimal(18, 2)), 1, 7, 4, 25, 1, 1, N'<p><span style="color:#ff0000">detaylar </span>sd ad asd asd asda</p>
')
INSERT [dbo].[Product] ([ID], [Name], [Price], [PIndex], [CategoryID], [BrandID], [Stock], [IsNew], [IsDiscount], [Detail]) VALUES (8, N'Ürün 5', CAST(56.00 AS Decimal(18, 2)), 5, 3, 1, 15, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Price], [PIndex], [CategoryID], [BrandID], [Stock], [IsNew], [IsDiscount], [Detail]) VALUES (9, N'Ürün 6', CAST(56.00 AS Decimal(18, 2)), 5, 3, 1, 15, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Price], [PIndex], [CategoryID], [BrandID], [Stock], [IsNew], [IsDiscount], [Detail]) VALUES (10, N'Ürün 7', CAST(56.00 AS Decimal(18, 2)), 5, 3, 1, 15, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Price], [PIndex], [CategoryID], [BrandID], [Stock], [IsNew], [IsDiscount], [Detail]) VALUES (11, N'Ürün 8', CAST(56.00 AS Decimal(18, 2)), 5, 3, 1, 15, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Price], [PIndex], [CategoryID], [BrandID], [Stock], [IsNew], [IsDiscount], [Detail]) VALUES (12, N'Ürün 9', CAST(56.00 AS Decimal(18, 2)), 5, 3, 1, 15, 0, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Price], [PIndex], [CategoryID], [BrandID], [Stock], [IsNew], [IsDiscount], [Detail]) VALUES (13, N'Ürün 10', CAST(56.00 AS Decimal(18, 2)), 5, 3, 1, 15, 0, 0, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Table [dbo].[Picture]    Script Date: 03/22/2020 12:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Picture](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FPath] [varchar](150) NULL,
	[PIndex] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Picture] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Picture] ON
INSERT [dbo].[Picture] ([ID], [FPath], [PIndex], [ProductID]) VALUES (2, N'/Content/img/product/1.jpg', 2, 3)
INSERT [dbo].[Picture] ([ID], [FPath], [PIndex], [ProductID]) VALUES (3, N'/Content/img/product/2.jpg', 1, 5)
INSERT [dbo].[Picture] ([ID], [FPath], [PIndex], [ProductID]) VALUES (4, N'/Content/img/product/3.jpg', 1, 6)
INSERT [dbo].[Picture] ([ID], [FPath], [PIndex], [ProductID]) VALUES (5, N'/Content/img/product/4.jpg', 1, 7)
INSERT [dbo].[Picture] ([ID], [FPath], [PIndex], [ProductID]) VALUES (6, N'/Content/img/product/5.jpg', 1, 8)
INSERT [dbo].[Picture] ([ID], [FPath], [PIndex], [ProductID]) VALUES (7, N'/Content/img/product/6.jpg', 1, 9)
INSERT [dbo].[Picture] ([ID], [FPath], [PIndex], [ProductID]) VALUES (8, N'/Content/img/product/7.jpg', 1, 10)
INSERT [dbo].[Picture] ([ID], [FPath], [PIndex], [ProductID]) VALUES (9, N'/Content/img/product/8.jpg', 1, 11)
INSERT [dbo].[Picture] ([ID], [FPath], [PIndex], [ProductID]) VALUES (10, N'/Content/img/product/9.jpg', 1, 12)
INSERT [dbo].[Picture] ([ID], [FPath], [PIndex], [ProductID]) VALUES (11, N'/Content/img/product/10.jpg', 1, 13)
INSERT [dbo].[Picture] ([ID], [FPath], [PIndex], [ProductID]) VALUES (12, N'/Content/img/product/11.jpg', 1, 3)
INSERT [dbo].[Picture] ([ID], [FPath], [PIndex], [ProductID]) VALUES (13, N'/Content/img/product/12.jpg', 3, 3)
INSERT [dbo].[Picture] ([ID], [FPath], [PIndex], [ProductID]) VALUES (14, N'/Content/img/product/13.jpg', 2, 5)
INSERT [dbo].[Picture] ([ID], [FPath], [PIndex], [ProductID]) VALUES (15, N'/Content/img/product/14.jpg', 3, 5)
SET IDENTITY_INSERT [dbo].[Picture] OFF
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 03/22/2020 12:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Name] [varchar](150) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_dbo.OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [Name], [Price], [Quantity], [ProductID]) VALUES (1, 2, N'Ürün 1', CAST(1111.00 AS Decimal(18, 2)), 3, 3)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [Name], [Price], [Quantity], [ProductID]) VALUES (2, 2, N'Ürün 2', CAST(2222.00 AS Decimal(18, 2)), 5, 5)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [Name], [Price], [Quantity], [ProductID]) VALUES (3, 2, N'Ürün 3', CAST(1.00 AS Decimal(18, 2)), 10, 6)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [Name], [Price], [Quantity], [ProductID]) VALUES (4, 2, N'Ürün 4', CAST(123.00 AS Decimal(18, 2)), 15, 7)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
/****** Object:  Table [dbo].[Favorite]    Script Date: 03/22/2020 12:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorite](
	[ProductID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Favorite] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MemberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF__Admin__UserName__145C0A3F]    Script Date: 03/22/2020 12:57:48 ******/
ALTER TABLE [dbo].[Admin] ADD  DEFAULT ('') FOR [UserName]
GO
/****** Object:  Default [DF__Admin__NameSurna__15502E78]    Script Date: 03/22/2020 12:57:48 ******/
ALTER TABLE [dbo].[Admin] ADD  DEFAULT ('') FOR [NameSurname]
GO
/****** Object:  Default [DF__Admin__Password__164452B1]    Script Date: 03/22/2020 12:57:48 ******/
ALTER TABLE [dbo].[Admin] ADD  DEFAULT ('') FOR [Password]
GO
/****** Object:  Default [DF__Admin__LastDate__173876EA]    Script Date: 03/22/2020 12:57:48 ******/
ALTER TABLE [dbo].[Admin] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [LastDate]
GO
/****** Object:  Default [DF__Slider__PIndex__182C9B23]    Script Date: 03/22/2020 12:57:48 ******/
ALTER TABLE [dbo].[Slider] ADD  DEFAULT ((0)) FOR [PIndex]
GO
/****** Object:  ForeignKey [FK_dbo.Address_dbo.Member_MemberID]    Script Date: 03/22/2020 12:57:48 ******/
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Address_dbo.Member_MemberID] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_dbo.Address_dbo.Member_MemberID]
GO
/****** Object:  ForeignKey [FK_dbo.Category_dbo.Category_ParentID]    Script Date: 03/22/2020 12:57:48 ******/
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Category_dbo.Category_ParentID] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_dbo.Category_dbo.Category_ParentID]
GO
/****** Object:  ForeignKey [FK_dbo.Favorite_dbo.Member_MemberID]    Script Date: 03/22/2020 12:57:48 ******/
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Favorite_dbo.Member_MemberID] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_dbo.Favorite_dbo.Member_MemberID]
GO
/****** Object:  ForeignKey [FK_dbo.Favorite_dbo.Product_ProductID]    Script Date: 03/22/2020 12:57:48 ******/
ALTER TABLE [dbo].[Favorite]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Favorite_dbo.Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favorite] CHECK CONSTRAINT [FK_dbo.Favorite_dbo.Product_ProductID]
GO
/****** Object:  ForeignKey [FK_dbo.Order_dbo.Member_MemberID]    Script Date: 03/22/2020 12:57:48 ******/
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Order_dbo.Member_MemberID] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_dbo.Order_dbo.Member_MemberID]
GO
/****** Object:  ForeignKey [FK_dbo.OrderDetail_dbo.Order_OrderID]    Script Date: 03/22/2020 12:57:48 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetail_dbo.Order_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_dbo.OrderDetail_dbo.Order_OrderID]
GO
/****** Object:  ForeignKey [FK_dbo.OrderDetail_dbo.Product_ProductID]    Script Date: 03/22/2020 12:57:48 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetail_dbo.Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_dbo.OrderDetail_dbo.Product_ProductID]
GO
/****** Object:  ForeignKey [FK_dbo.Picture_dbo.Product_ProductID]    Script Date: 03/22/2020 12:57:48 ******/
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Picture_dbo.Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Picture] CHECK CONSTRAINT [FK_dbo.Picture_dbo.Product_ProductID]
GO
/****** Object:  ForeignKey [FK_dbo.Product_dbo.Brand_BrandID]    Script Date: 03/22/2020 12:57:48 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Product_dbo.Brand_BrandID] FOREIGN KEY([BrandID])
REFERENCES [dbo].[Brand] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_dbo.Product_dbo.Brand_BrandID]
GO
/****** Object:  ForeignKey [FK_dbo.Product_dbo.Category_CategoryID]    Script Date: 03/22/2020 12:57:48 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Product_dbo.Category_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_dbo.Product_dbo.Category_CategoryID]
GO
