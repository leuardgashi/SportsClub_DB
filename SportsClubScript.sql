USE [SportsClub]
GO
/****** Object:  Table [dbo].[councils]    Script Date: 1/19/2025 8:13:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[councils](
	[council_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[budget] [decimal](10, 2) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[council_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 1/19/2025 8:13:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[department_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[council_id] [int] NOT NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[managers]    Script Date: 1/19/2025 8:13:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[managers](
	[manager_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[age] [tinyint] NULL,
	[salary] [decimal](10, 2) NULL,
	[department_id] [int] NOT NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[manager_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[players]    Script Date: 1/19/2025 8:13:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[players](
	[player_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[age] [tinyint] NULL,
	[jersey_number] [tinyint] NOT NULL,
	[salary] [decimal](10, 2) NULL,
	[team_id] [int] NOT NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[player_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sponsors]    Script Date: 1/19/2025 8:13:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sponsors](
	[sponsor_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[contact_info] [varchar](255) NULL,
	[budget] [decimal](10, 2) NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sponsor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sponsorships]    Script Date: 1/19/2025 8:13:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sponsorships](
	[sponsorship_id] [int] IDENTITY(1,1) NOT NULL,
	[sponsor_id] [int] NOT NULL,
	[team_id] [int] NOT NULL,
	[amount] [decimal](10, 2) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[sponsorship_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teams]    Script Date: 1/19/2025 8:13:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teams](
	[team_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[founded] [date] NULL,
	[department_id] [int] NOT NULL,
	[schedule] [date] NULL,
	[createdAt] [datetime] NULL,
	[updatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[team_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[councils] ADD  DEFAULT ((0.00)) FOR [budget]
GO
ALTER TABLE [dbo].[councils] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[councils] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[departments] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[departments] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[managers] ADD  DEFAULT ((0.00)) FOR [salary]
GO
ALTER TABLE [dbo].[managers] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[managers] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT ((0.00)) FOR [salary]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[players] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[sponsors] ADD  DEFAULT ((0.00)) FOR [budget]
GO
ALTER TABLE [dbo].[sponsors] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[sponsors] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[sponsorships] ADD  DEFAULT ((0.00)) FOR [amount]
GO
ALTER TABLE [dbo].[sponsorships] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[sponsorships] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[teams] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[teams] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[departments]  WITH CHECK ADD FOREIGN KEY([council_id])
REFERENCES [dbo].[councils] ([council_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[managers]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([department_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[players]  WITH CHECK ADD FOREIGN KEY([team_id])
REFERENCES [dbo].[teams] ([team_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sponsorships]  WITH CHECK ADD FOREIGN KEY([sponsor_id])
REFERENCES [dbo].[sponsors] ([sponsor_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sponsorships]  WITH CHECK ADD FOREIGN KEY([team_id])
REFERENCES [dbo].[teams] ([team_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[teams]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([department_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[councils]  WITH CHECK ADD CHECK  (([budget]>=(0)))
GO
ALTER TABLE [dbo].[managers]  WITH CHECK ADD CHECK  (([age]>=(25) AND [age]<=(100)))
GO
ALTER TABLE [dbo].[managers]  WITH CHECK ADD CHECK  (([salary]>=(0)))
GO
ALTER TABLE [dbo].[players]  WITH CHECK ADD CHECK  (([age]>=(18) AND [age]<=(100)))
GO
ALTER TABLE [dbo].[players]  WITH CHECK ADD CHECK  (([salary]>=(0)))
GO
ALTER TABLE [dbo].[sponsors]  WITH CHECK ADD CHECK  (([budget]>=(0)))
GO
ALTER TABLE [dbo].[sponsorships]  WITH CHECK ADD CHECK  (([amount]>=(0)))
GO
