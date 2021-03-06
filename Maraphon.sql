USE [master]
GO
/****** Object:  Database [maraphon]    Script Date: 30.11.2021 23:16:35 ******/
CREATE DATABASE [maraphon]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [maraphon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [maraphon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [maraphon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [maraphon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [maraphon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [maraphon] SET ARITHABORT OFF 
GO
ALTER DATABASE [maraphon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [maraphon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [maraphon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [maraphon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [maraphon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [maraphon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [maraphon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [maraphon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [maraphon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [maraphon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [maraphon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [maraphon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [maraphon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [maraphon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [maraphon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [maraphon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [maraphon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [maraphon] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [maraphon] SET  MULTI_USER 
GO
ALTER DATABASE [maraphon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [maraphon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [maraphon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [maraphon] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [maraphon] SET DELAYED_DURABILITY = DISABLED 
GO
USE [maraphon]
GO
/****** Object:  Table [dbo].[Charity]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Charity](
	[CharityId] [int] IDENTITY(1,1) NOT NULL,
	[CharityName] [nvarchar](100) NOT NULL,
	[CharityDescription] [nvarchar](2000) NULL,
	[CharityLogo] [nvarchar](50) NULL,
 CONSTRAINT [pk_Charity] PRIMARY KEY CLUSTERED 
(
	[CharityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryCode] [nchar](3) NOT NULL,
	[CountryName] [nvarchar](100) NOT NULL,
	[CountryFlag] [nvarchar](100) NOT NULL,
 CONSTRAINT [pk_Country] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventId] [nchar](6) NOT NULL,
	[EventName] [nvarchar](50) NOT NULL,
	[EventTypeId] [nchar](2) NOT NULL,
	[MarathonId] [tinyint] NOT NULL,
	[StartDateTime] [datetime] NULL,
	[Cost] [decimal](10, 2) NULL,
	[MaxParticipants] [smallint] NULL,
 CONSTRAINT [pk_Event] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventType]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventType](
	[EventTypeId] [nchar](2) NOT NULL,
	[EventTypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [pk_EventType] PRIMARY KEY CLUSTERED 
(
	[EventTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Gender] [nvarchar](10) NOT NULL,
 CONSTRAINT [pk_Gender] PRIMARY KEY CLUSTERED 
(
	[Gender] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marathon]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marathon](
	[MarathonId] [tinyint] IDENTITY(1,1) NOT NULL,
	[MarathonName] [nvarchar](80) NOT NULL,
	[CityName] [nvarchar](80) NULL,
	[CountryCode] [nchar](3) NOT NULL,
	[YearHeld] [smallint] NULL,
 CONSTRAINT [pk_Marathon] PRIMARY KEY CLUSTERED 
(
	[MarathonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[PositionId] [smallint] IDENTITY(1,1) NOT NULL,
	[PositionName] [varchar](50) NULL,
	[PositionDescription] [varchar](1000) NULL,
	[PayPeriod] [varchar](10) NULL,
	[Payrate] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RaceKitOption]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RaceKitOption](
	[RaceKitOptionId] [nchar](1) NOT NULL,
	[RaceKitOption] [nvarchar](80) NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
 CONSTRAINT [pk_RaceKitOption] PRIMARY KEY CLUSTERED 
(
	[RaceKitOptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[RegistrationId] [int] IDENTITY(1,1) NOT NULL,
	[RunnerId] [int] NOT NULL,
	[RegistrationDateTime] [datetime] NOT NULL,
	[RaceKitOptionId] [nchar](1) NOT NULL,
	[RegistrationStatusId] [tinyint] NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[CharityId] [int] NOT NULL,
	[SponsorshipTarget] [decimal](10, 2) NOT NULL,
 CONSTRAINT [pk_Registration] PRIMARY KEY CLUSTERED 
(
	[RegistrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationEvent]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationEvent](
	[RegistrationEventId] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationId] [int] NOT NULL,
	[EventId] [nchar](6) NOT NULL,
	[BibNumber] [smallint] NULL,
	[RaceTime] [int] NULL,
 CONSTRAINT [pk_RegistrationEvent] PRIMARY KEY CLUSTERED 
(
	[RegistrationEventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationStatus]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationStatus](
	[RegistrationStatusId] [tinyint] IDENTITY(1,1) NOT NULL,
	[RegistrationStatus] [nvarchar](80) NOT NULL,
 CONSTRAINT [pk_RegistrationStatus] PRIMARY KEY CLUSTERED 
(
	[RegistrationStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [nchar](1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [pk_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Runner]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Runner](
	[RunnerId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[CountryCode] [nchar](3) NOT NULL,
 CONSTRAINT [pk_Runner] PRIMARY KEY CLUSTERED 
(
	[RunnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sponsorship]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsorship](
	[SponsorshipId] [int] IDENTITY(1,1) NOT NULL,
	[SponsorName] [nvarchar](150) NOT NULL,
	[RegistrationId] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
 CONSTRAINT [pk_Sponsorship] PRIMARY KEY CLUSTERED 
(
	[SponsorshipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](80) NOT NULL,
	[LastName] [varchar](80) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[PositionId] [smallint] NOT NULL,
	[Comments] [varchar](2000) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timesheet]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timesheet](
	[TimesheetId] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NOT NULL,
	[StartDateTime] [datetime] NULL,
	[EndDateTime] [datetime] NULL,
	[PayAmount] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Timesheet] PRIMARY KEY CLUSTERED 
(
	[TimesheetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](80) NULL,
	[LastName] [nvarchar](80) NULL,
	[RoleId] [nchar](1) NOT NULL,
 CONSTRAINT [pk_User] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volunteer]    Script Date: 30.11.2021 23:16:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteer](
	[VolunteerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](80) NULL,
	[LastName] [nvarchar](80) NULL,
	[CountryCode] [nchar](3) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
 CONSTRAINT [pk_Volunteer] PRIMARY KEY CLUSTERED 
(
	[VolunteerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_EventType] FOREIGN KEY([EventTypeId])
REFERENCES [dbo].[EventType] ([EventTypeId])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_EventType]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Marathon] FOREIGN KEY([MarathonId])
REFERENCES [dbo].[Marathon] ([MarathonId])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Marathon]
GO
ALTER TABLE [dbo].[Marathon]  WITH CHECK ADD  CONSTRAINT [FK_Marathon_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Marathon] CHECK CONSTRAINT [FK_Marathon_Country]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Charity] FOREIGN KEY([CharityId])
REFERENCES [dbo].[Charity] ([CharityId])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Charity]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_RaceKitOption] FOREIGN KEY([RaceKitOptionId])
REFERENCES [dbo].[RaceKitOption] ([RaceKitOptionId])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_RaceKitOption]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_RegistrationStatus] FOREIGN KEY([RegistrationStatusId])
REFERENCES [dbo].[RegistrationStatus] ([RegistrationStatusId])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_RegistrationStatus]
GO
ALTER TABLE [dbo].[RegistrationEvent]  WITH CHECK ADD  CONSTRAINT [FK_RegistrationEvent_Event] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([EventId])
GO
ALTER TABLE [dbo].[RegistrationEvent] CHECK CONSTRAINT [FK_RegistrationEvent_Event]
GO
ALTER TABLE [dbo].[RegistrationEvent]  WITH CHECK ADD  CONSTRAINT [FK_RegistrationEvent_Registration] FOREIGN KEY([RegistrationId])
REFERENCES [dbo].[Registration] ([RegistrationId])
GO
ALTER TABLE [dbo].[RegistrationEvent] CHECK CONSTRAINT [FK_RegistrationEvent_Registration]
GO
ALTER TABLE [dbo].[Runner]  WITH CHECK ADD FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Runner]  WITH CHECK ADD FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Runner]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[Runner]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[User] ([Email])
GO
ALTER TABLE [dbo].[Runner]  WITH CHECK ADD FOREIGN KEY([Gender])
REFERENCES [dbo].[Gender] ([Gender])
GO
ALTER TABLE [dbo].[Runner]  WITH CHECK ADD FOREIGN KEY([Gender])
REFERENCES [dbo].[Gender] ([Gender])
GO
ALTER TABLE [dbo].[Sponsorship]  WITH CHECK ADD FOREIGN KEY([RegistrationId])
REFERENCES [dbo].[Registration] ([RegistrationId])
GO
ALTER TABLE [dbo].[Sponsorship]  WITH CHECK ADD  CONSTRAINT [FK_Sponsorship_Registration] FOREIGN KEY([RegistrationId])
REFERENCES [dbo].[Registration] ([RegistrationId])
GO
ALTER TABLE [dbo].[Sponsorship] CHECK CONSTRAINT [FK_Sponsorship_Registration]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Position] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Position] ([PositionId])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Position]
GO
ALTER TABLE [dbo].[Timesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timesheet_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[Timesheet] CHECK CONSTRAINT [FK_Timesheet_Staff]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Volunteer]  WITH CHECK ADD FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Volunteer]  WITH CHECK ADD FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Volunteer]  WITH CHECK ADD FOREIGN KEY([Gender])
REFERENCES [dbo].[Gender] ([Gender])
GO
ALTER TABLE [dbo].[Volunteer]  WITH CHECK ADD FOREIGN KEY([Gender])
REFERENCES [dbo].[Gender] ([Gender])
GO
USE [master]
GO
ALTER DATABASE [maraphon] SET  READ_WRITE 
GO
