
CREATE TABLE VATTU (
                       MaVTU VARCHAR(10) PRIMARY KEY,
                       TenVTU NVARCHAR(100),
                       DGNhap DECIMAL(10, 2),
                       SLNhap INT
);


CREATE TABLE PHIEUXUAT (
                           SoPX VARCHAR(10) PRIMARY KEY,
                           NgayXuat DATE
);


CREATE TABLE PHIEUNHAP (
                           SoPN VARCHAR(10) PRIMARY KEY,
                           NgayNhap DATE
);


CREATE TABLE NHACC (
                       MaNCC VARCHAR(10) PRIMARY KEY,
                       TenNCC NVARCHAR(100),
                       DiaChi NVARCHAR(200),
                       SDT VARCHAR(20)
);


CREATE TABLE DONDH (
                       SoDH VARCHAR(10) PRIMARY KEY,
                       NgayDH DATE
);


CREATE TABLE CHITIETPHIEUXUAT (
                                  SoPX VARCHAR(10),
                                  MaVTU VARCHAR(10),
                                  DGXuat DECIMAL(10, 2),
                                  SLXuat INT,
                                  PRIMARY KEY (SoPX, MaVTU),
                                  FOREIGN KEY (SoPX) REFERENCES PHIEUXUAT(SoPX),
                                  FOREIGN KEY (MaVTU) REFERENCES VATTU(MaVTU)
);


CREATE TABLE CHITIETPHIEUNHAP (
                                  SoPN VARCHAR(10),
                                  MaVTU VARCHAR(10),
                                  PRIMARY KEY (SoPN, MaVTU),
                                  FOREIGN KEY (SoPN) REFERENCES PHIEUNHAP(SoPN),
                                  FOREIGN KEY (MaVTU) REFERENCES VATTU(MaVTU)
);

CREATE TABLE CHITIETDONDH (
                              SoDH VARCHAR(10),
                              MaVTU VARCHAR(10),
                              PRIMARY KEY (SoDH, MaVTU),
                              FOREIGN KEY (SoDH) REFERENCES DONDH(SoDH),
                              FOREIGN KEY (MaVTU) REFERENCES VATTU(MaVTU)
);

CREATE TABLE CUNGCAP (
                         SoDH VARCHAR(10),
                         MaNCC VARCHAR(10),
                         PRIMARY KEY (SoDH, MaNCC),
                         FOREIGN KEY (SoDH) REFERENCES DONDH(SoDH),
                         FOREIGN KEY (MaNCC) REFERENCES NHACC(MaNCC)
);
