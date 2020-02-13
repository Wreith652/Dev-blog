
-- Voici tout les CREATE TABLE pour Projet DEV BDD --

USE [master]
GO
/****** All Object: Drop Table ******/

ALTER TABLE [dbo].[Personnel_Formation] DROP CONSTRAINT [FK_Personnel_Formation_Personnel]
GO
ALTER TABLE [dbo].[Personnel_Formation] DROP CONSTRAINT [FK_Personnel_Formation_Formation]
GO
ALTER TABLE [dbo].[Personnel_Absence] DROP CONSTRAINT [FK_Personnel_Absence_Personnel_Absence]
GO
ALTER TABLE [dbo].[Personnel_Absence] DROP CONSTRAINT [FK_Personnel_Absence_Personnel]
GO
ALTER TABLE [dbo].[Facture_detail] DROP CONSTRAINT [FK_Facture_detail_Produit]
GO
ALTER TABLE [dbo].[Facture_detail] DROP CONSTRAINT [FK_Facture_detail_Facture]
GO
ALTER TABLE [dbo].[Fournisseur] DROP CONSTRAINT [FK_Fournisseur_Produit]
GO
ALTER TABLE [dbo].[Fournisseur] DROP CONSTRAINT [FK_Fournisseur_Fournisseur1]
GO
ALTER TABLE [dbo].[Fournisseur] DROP CONSTRAINT [FK_Fournisseur_Fournisseur]
GO
ALTER TABLE [dbo].[Produit] DROP CONSTRAINT [FK_Produit_Magasin]
GO
ALTER TABLE [dbo].[Personnel] DROP CONSTRAINT [FK_Personnel_Magasin]
GO
ALTER TABLE [dbo].[Facture] DROP CONSTRAINT [FK_Facture_Client]
GO
ALTER TABLE [dbo].[Personnel] DROP CONSTRAINT [FK_Personnel_Magasin]
GO
DROP TABLE [dbo].[Personnel]
GO
DROP TABLE [dbo].[Formation]
GO
DROP TABLE [dbo].[Facture_detail]
GO
DROP TABLE [dbo].[Personnel_Absence]
GO
DROP TABLE [dbo].[Magasin]
GO
DROP TABLE [dbo].[Fournisseur]
GO
DROP TABLE [dbo].[Produit]
GO
DROP TABLE [dbo].[Client]
GO
DROP TABLE [dbo].[Personnel_Formation]
GO
DROP TABLE [dbo].[Facture]
GO

/****** Object:  Table [dbo].[Magasin] ******/


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Magasin](
	[ID_MAGASIN] [int] NOT NULL,
	[Adresse_Magasin] [varchar](50) NULL,
	[Tel_Magasin] [int] NULL,
 CONSTRAINT [PK_Magasin] PRIMARY KEY CLUSTERED 
(
	[ID_MAGASIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[Client] ******/


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Client](
	[ID_CLIENT] [int] NOT NULL,
	[Nom] [varchar](50) NULL,
	[Prenom] [varchar](50) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID_CLIENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[Facture] ******/


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Facture](
	[ID_FACTURE] [int] NOT NULL,
	[ID_CLIENT] [int] NULL,
	[Date_Facture] [int] NULL,
	[Type_Reglement] [varchar](50) NULL,
 CONSTRAINT [PK_Facture] PRIMARY KEY CLUSTERED 
(
	[ID_FACTURE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Facture]  WITH CHECK ADD  CONSTRAINT [FK_Facture_Client] FOREIGN KEY([ID_CLIENT])
REFERENCES [dbo].[Client] ([ID_CLIENT])
GO
ALTER TABLE [dbo].[Facture] CHECK CONSTRAINT [FK_Facture_Client]
GO



/****** Object:  Table [dbo].[Produit] ******/


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Produit](
	[ID_PRODUIT] [int] NOT NULL,
	[Nom] [varchar](50) NULL,
	[Prix] [int] NULL,
	[Qte_Stock] [int] NULL,
	[Categorie] [varchar](50) NULL,
	[ID_MAGASIN] [int] NULL,
 CONSTRAINT [PK_Produit] PRIMARY KEY CLUSTERED 
(
	[ID_PRODUIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Produit]  WITH CHECK ADD  CONSTRAINT [FK_Produit_Magasin] FOREIGN KEY([ID_MAGASIN])
REFERENCES [dbo].[Magasin] ([ID_MAGASIN])
GO
ALTER TABLE [dbo].[Produit] CHECK CONSTRAINT [FK_Produit_Magasin]
GO



/****** Object:  Table [dbo].[Fournisseur] ******/


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fournisseur](
	[ID_FOURNISSEUR] [int] NOT NULL,
	[Nom] [varchar](50) NULL,
	[Adresse] [varchar](50) NULL,
	[Ville] [varchar](50) NULL,
	[Code_Postal] [int] NULL,
	[Tel] [int] NULL,
	[ID_PRODUIT] [int] NULL,
 CONSTRAINT [PK_Fournisseur] PRIMARY KEY CLUSTERED 
(
	[ID_FOURNISSEUR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Fournisseur]  WITH CHECK ADD  CONSTRAINT [FK_Fournisseur_Fournisseur] FOREIGN KEY([ID_FOURNISSEUR])
REFERENCES [dbo].[Fournisseur] ([ID_FOURNISSEUR])
GO
ALTER TABLE [dbo].[Fournisseur] CHECK CONSTRAINT [FK_Fournisseur_Fournisseur]
GO
ALTER TABLE [dbo].[Fournisseur]  WITH CHECK ADD  CONSTRAINT [FK_Fournisseur_Fournisseur1] FOREIGN KEY([ID_FOURNISSEUR])
REFERENCES [dbo].[Fournisseur] ([ID_FOURNISSEUR])
GO
ALTER TABLE [dbo].[Fournisseur] CHECK CONSTRAINT [FK_Fournisseur_Fournisseur1]
GO
ALTER TABLE [dbo].[Fournisseur]  WITH CHECK ADD  CONSTRAINT [FK_Fournisseur_Produit] FOREIGN KEY([ID_PRODUIT])
REFERENCES [dbo].[Produit] ([ID_PRODUIT])
GO
ALTER TABLE [dbo].[Fournisseur] CHECK CONSTRAINT [FK_Fournisseur_Produit]
GO



/****** Object:  Table [dbo].[Personnel]    Script Date: 28/01/2020 12:27:54 ******/





SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Personnel](
	[ID_EMPLOYE] [int] NOT NULL,
	[Nom] [varchar](255) NULL,
	[Prenom] [varchar](255) NULL,
	[Date_Naissance] [varchar](255) NULL,
	[Num_Secu] [varchar](255) NULL,
	[Contrat] [varchar](25) NULL,
	[ID_MAGASIN] [int] NULL,
 CONSTRAINT [PK_Personnel] PRIMARY KEY CLUSTERED 
(
	[ID_EMPLOYE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Personnel]  WITH CHECK ADD  CONSTRAINT [FK_Personnel_Magasin] FOREIGN KEY([ID_MAGASIN])
REFERENCES [dbo].[Magasin] ([ID_MAGASIN])
GO



/****** Object:  Table [dbo].[HeureSupl] ******/


DROP TABLE [dbo].[HeureSupl]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HeureSupl](
	[ID_HEURES_SUPL] [int] NOT NULL,
	[Nbr_Heuresupl] [int] NULL,
	[Date] [varchar](255) NULL,
 CONSTRAINT [PK_HeureSupl] PRIMARY KEY CLUSTERED 
(
	[ID_HEURES_SUPL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[Prime]    Script Date: 28/01/2020 12:26:47 ******/


ALTER TABLE [dbo].[Prime] DROP CONSTRAINT [FK_Prime_Personnel]
GO
DROP TABLE [dbo].[Prime]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Prime](
	[ID_PRIME] [int] NOT NULL,
	[Montant] [int] NULL,
	[Motif] [varchar](255) NULL,
	[ID_EMPLOYE] [int] NULL,
 CONSTRAINT [PK_Prime] PRIMARY KEY CLUSTERED 
(
	[ID_PRIME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Prime]  WITH CHECK ADD  CONSTRAINT [FK_Prime_Personnel] FOREIGN KEY([ID_EMPLOYE])
REFERENCES [dbo].[Personnel] ([ID_EMPLOYE])
GO
ALTER TABLE [dbo].[Prime] CHECK CONSTRAINT [FK_Prime_Personnel]
GO


/****** Object:  Table [dbo].[Formation]    Script Date: 28/01/2020 12:29:10 ******/


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Formation](
	[ID_FORMATION] [int] NOT NULL,
	[Type_Formation] [varchar](250) NULL,
	[Date_Formation] [date] NULL,
	[Duree_Formation_Heure] [int] NULL,
 CONSTRAINT [PK_Formation] PRIMARY KEY CLUSTERED 
(
	[ID_FORMATION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[Absence_Conge]    Script Date: 28/01/2020 12:30:00 ******/


DROP TABLE [dbo].[Absence_Conge]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Absence_Conge](
	[ID_ABSENCE] [int] NOT NULL,
	[Date_DebutAbsence_Conge] [varchar](255) NULL,
	[Nbr_Jour] [int] NULL,
	[Justifie] [varchar](255) NULL,
 CONSTRAINT [PK_Absence_Conge] PRIMARY KEY CLUSTERED 
(
	[ID_ABSENCE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[Facture_detail]    Script Date: 28/01/2020 12:30:57 ******/


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Facture_detail](
	[ID_Facture_Detail] [int] NOT NULL,
	[ID_PRODUIT] [int] NULL,
	[NbrProduit] [int] NULL,
	[ID_FACTURE] [int] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ID_Facture_Detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Facture_detail]  WITH CHECK ADD  CONSTRAINT [FK_Facture_detail_Facture] FOREIGN KEY([ID_FACTURE])
REFERENCES [dbo].[Facture] ([ID_FACTURE])
GO
ALTER TABLE [dbo].[Facture_detail] CHECK CONSTRAINT [FK_Facture_detail_Facture]
GO
ALTER TABLE [dbo].[Facture_detail]  WITH CHECK ADD  CONSTRAINT [FK_Facture_detail_Produit] FOREIGN KEY([ID_PRODUIT])
REFERENCES [dbo].[Produit] ([ID_PRODUIT])
GO
ALTER TABLE [dbo].[Facture_detail] CHECK CONSTRAINT [FK_Facture_detail_Produit]
GO



/****** Object:  Table [dbo].[Personnel_Absence]    Script Date: 28/01/2020 12:31:54 ******/


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Personnel_Absence](
	[ID_PERSONNEL_ABSENCE] [smallint] NOT NULL,
	[ID_EMPLOYE] [int] NULL,
	[ID_ABSENCE] [int] NULL,
 CONSTRAINT [PK_Personnel_Absence] PRIMARY KEY CLUSTERED 
(
	[ID_PERSONNEL_ABSENCE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Personnel_Absence]  WITH CHECK ADD  CONSTRAINT [FK_Personnel_Absence_Personnel] FOREIGN KEY([ID_EMPLOYE])
REFERENCES [dbo].[Personnel] ([ID_EMPLOYE])
GO
ALTER TABLE [dbo].[Personnel_Absence] CHECK CONSTRAINT [FK_Personnel_Absence_Personnel]
GO
ALTER TABLE [dbo].[Personnel_Absence]  WITH CHECK ADD  CONSTRAINT [FK_Personnel_Absence_Personnel_Absence] FOREIGN KEY([ID_ABSENCE])
REFERENCES [dbo].[Absence_Conge] ([ID_ABSENCE])
GO
ALTER TABLE [dbo].[Personnel_Absence] CHECK CONSTRAINT [FK_Personnel_Absence_Personnel_Absence]
GO



/****** Object:  Table [dbo].[Personnel_Formation]    Script Date: 28/01/2020 12:32:47 ******/


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Personnel_Formation](
	[ID_PERSONNEL_FORMATION] [int] NOT NULL,
	[ID_EMPLOYE] [int] NULL,
	[ID_FORMATION] [int] NULL,
 CONSTRAINT [PK_Personnel_Formation] PRIMARY KEY CLUSTERED 
(
	[ID_PERSONNEL_FORMATION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Personnel_Formation]  WITH CHECK ADD  CONSTRAINT [FK_Personnel_Formation_Formation] FOREIGN KEY([ID_FORMATION])
REFERENCES [dbo].[Formation] ([ID_FORMATION])
GO
ALTER TABLE [dbo].[Personnel_Formation] CHECK CONSTRAINT [FK_Personnel_Formation_Formation]
GO
ALTER TABLE [dbo].[Personnel_Formation]  WITH CHECK ADD  CONSTRAINT [FK_Personnel_Formation_Personnel] FOREIGN KEY([ID_EMPLOYE])
REFERENCES [dbo].[Personnel] ([ID_EMPLOYE])
GO
ALTER TABLE [dbo].[Personnel_Formation] CHECK CONSTRAINT [FK_Personnel_Formation_Personnel]
GO