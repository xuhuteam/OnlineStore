USE [OnlineStoreDB]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2019-05-27 11:55:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Timestamp] [timestamp] NOT NULL,
	[DeliveryDate] [datetime2](7) NULL,
	[SaleOff] [decimal](18, 2) NOT NULL,
	[EmployeeId] [uniqueidentifier] NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[ShippingFee] [decimal](18, 2) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[AddressId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeliveryType] [tinyint] NOT NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[PaymentType] [tinyint] NULL,
	[SubTotal] [decimal](18, 0) NULL,
	[Total] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 2019-05-27 11:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Timestamp] [timestamp] NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[SaleOff] [decimal](18, 0) NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_LineItem] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [DeliveryDate], [SaleOff], [EmployeeId], [CustomerId], [ShippingFee], [Status], [OrderDate], [AddressId], [IsDeleted], [DeliveryType], [DateCreated], [DateModified], [PaymentType], [SubTotal], [Total]) VALUES (2, CAST(N'2019-11-01T23:20:00.0000000' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), NULL, N'b48829d5-906a-47b6-e7ed-08d6db6117ff', CAST(15000.00 AS Decimal(18, 2)), 1, CAST(N'2019-05-18T14:32:28.5833333' AS DateTime2), 4, 0, 1, CAST(N'2019-05-18T14:32:28.583' AS DateTime), CAST(N'2019-05-27T11:45:35.293' AS DateTime), 1, CAST(1025700000 AS Decimal(18, 0)), CAST(1025700000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([Id], [DeliveryDate], [SaleOff], [EmployeeId], [CustomerId], [ShippingFee], [Status], [OrderDate], [AddressId], [IsDeleted], [DeliveryType], [DateCreated], [DateModified], [PaymentType], [SubTotal], [Total]) VALUES (3, CAST(N'2019-05-19T08:40:37.8033333' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), NULL, N'b48829d5-906a-47b6-e7ed-08d6db6117ff', CAST(11000.00 AS Decimal(18, 2)), 2, CAST(N'2019-05-19T08:40:37.8033333' AS DateTime2), 4, 0, 2, CAST(N'2019-05-19T08:40:37.803' AS DateTime), CAST(N'2019-05-19T08:40:37.803' AS DateTime), 1, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderItem] ([OrderId], [ItemId], [Quantity], [Amount], [IsDeleted], [DateCreated], [DateModified], [SaleOff], [Price]) VALUES (2, 1, 5, CAST(102450000.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, CAST(20490000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderItem] ([OrderId], [ItemId], [Quantity], [Amount], [IsDeleted], [DateCreated], [DateModified], [SaleOff], [Price]) VALUES (2, 48, 1, CAST(120000.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, CAST(120000.00 AS Decimal(18, 2)))
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_SaleOff]  DEFAULT ((0)) FOR [SaleOff]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_ShippingFee]  DEFAULT ((0)) FOR [ShippingFee]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_IsSelfReceive]  DEFAULT ((0)) FOR [DeliveryType]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Address]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_AspNetUsers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_AspNetUsers]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_LineItem_Item_ItemId] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_LineItem_Item_ItemId]
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_LineItem_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItem] CHECK CONSTRAINT [FK_LineItem_Order_OrderId]
GO
