﻿use QLDAXayDung
go

CREATE TABLE NhanVien 
(
	MaNV INT IDENTITY PRIMARY KEY,
	TenNV NVARCHAR(100),
	NgaySinh DATETIME,
	DiaChi	NVARCHAR(150),
	GioiTinh NVARCHAR(3),
	SDT NVARCHAR(10),
	CMND NVARCHAR(12),
	ChucVu NVARCHAR(50),
)

CREATE TABLE DuAn 
(
	MaDA NVARCHAR(10) PRIMARY KEY,
	TenDA NVARCHAR(100),
	DiaDiem NVARCHAR(150),
	NgayBatDau DATETIME,
	NgayKetThuc DATETIME,
)

CREATE TABLE NV_DA 
(
	MaNV INT,
	MaDA NVARCHAR(10),
	PRIMARY KEY (MaNV, MaDA),
	FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
	FOREIGN KEY (MaDA) REFERENCES DuAn(MaDA)
)

CREATE TABLE NhaCungCap
(
	MaNCC INT IDENTITY PRIMARY KEY,
	TenNCC NVARCHAR(100),
	DiaChi	NVARCHAR(150),
	SDT NVARCHAR(10),
	SoFax NVARCHAR(10),
	Email NVARCHAR(150),
)

CREATE TABLE VatTu
(
	MaVT INT IDENTITY PRIMARY KEY,
	TenVT NVARCHAR(100),
	SoLuong	INT,
	ĐonViTinh NVARCHAR(50),
	MaNCC INT,
	FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC),
)

CREATE TABLE VatTuTrongDuAn
(
	MaVT INT,
	MaDA NVARCHAR(10),
	SoLuong INT,
	PRIMARY KEY (MaVT, MaDA),
	FOREIGN KEY (MaVT) REFERENCES VatTu(MaVT),
	FOREIGN KEY (MaDA) REFERENCES DuAn(MaDA)
)

CREATE TABLE TienDoDA
(
	MaTD INT,
	MaDA NVARCHAR(10),
	CongViec NVARCHAR(Max),
	NgayBatDau DATETIME,
	NgayKetThuc DATETIME,
	PRIMARY KEY(MaTD, MaDA),
	FOREIGN KEY (MaDA) REFERENCES DuAn(MaDA),
)