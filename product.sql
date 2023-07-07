Use UserManagement

CREATE TABLE tblProduct(
	productID nvarchar(50) NOT NULL primary key,
	[name] [nvarchar](50) NULL,
	[price] [decimal](18, 2) NULL,
	[quantity] [int] NULL,
	[image] nvarchar(255)
)

CREATE TABLE tblOrder(
	orderID int identity(1,1) NOT NULL primary key,
	userID nvarchar(50) NOT NULL FOREIGN KEY REFERENCES tblUsers(userID),
	[date] date,
	total decimal(18,2)
)

CREATE TABLE tblOrderDetail(
	orderDetailID int identity(1,1) NOT NULL,
	productID nvarchar(50) NOT NULL FOREIGN KEY REFERENCES tblProduct(productID),
	orderID int NOT NULL FOREIGN KEY REFERENCES tblOrder(orderID),
	price decimal(18,2),
	quantity int
)

INSERT INTO tblProduct (productID, [name], [price], [quantity], [image])
VALUES ('T01', 'Assam Milk Tea', 3, 10, './assets/img/image1'),
       ('T02', 'British Milk Tea', 3, 10, './assets/img/image2'),
       ('T03', 'Boba Tea', 4, 10, './assets/img/image3'),
       ('T04', 'Butterfly Flower Pea Milk Tea', 4, 10, './assets/img/image4'),
       ('T05', 'Chai Milk Tea', 3, 10, './assets/img/image5'),
       ('T06', 'Classic Milk Tea', 3, 10, './assets/img/image6'),
       ('T07', 'Hojicha Latte', 4, 10, './assets/img/image7'),
       ('T08', 'Hokkaido Milk Tea', 4, 10, './assets/img/image8'),
       ('T09', 'Hong Kong Milk Tea', 3, 10, './assets/img/image9'),
       ('T10', 'London Fog Tea Latte', 4, 10, './assets/img/image10'),
       ('T11', 'Matcha Latte', 4, 10, './assets/img/image11'),
       ('T12', 'Nidashi Milk Tea', 3, 10, './assets/img/image12'),
       ('T13', 'Okinawa Milk Tea', 4, 10, './assets/img/image13'),
       ('T14', 'Panda Milk Tea', 4, 10, './assets/img/image14'),
       ('T15', 'Rooibos Latte', 3, 10, './assets/img/image15'),
       ('T16', 'Royal Milk Tea', 3, 10, './assets/img/image16'),
       ('T17', 'Tea Latte', 3, 10, './assets/img/image17'),
       ('T18', 'Tiger Milk Tea', 4, 10, './assets/img/image18'),
       ('T19', 'Taro Milk Tea', 4, 10, './assets/img/image19'),
       ('T20', 'Thai Milk Tea', 3, 10, './assets/img/image20'),
       ('T21','Earl Grey Milk Tea' ,3 ,10 ,'./assets/img/image21' ),
       ('T22','Alisan Milk Tea' ,3 ,10 ,'./assets/img/image22' ),
       ('T23','Oolong Milk Tea' ,3 ,10 ,'./assets/img/image23' ),
       ('T24','Pu’ Er Milk Tea' ,3 ,10 ,'./assets/img/image24' ),
       ('T25','Osmanthus Milk Tea' ,3 ,10 ,'./assets/img/image25' ),
       ('T26','Chamomile Milk Tea' ,3 ,10 ,'./assets/img/image26' ),
       ('T27','Jasmine Milk Tea' ,3 ,10 ,'./assets/img/image27' ),
       ('T28','Rose Tea' ,3 ,10 ,'./assets/img/image28' ),
       ('T29','Matcha Green Tea Latte' ,4 ,10 ,'./assets/img/image29' ),
       ('T30','Hokkaido Caramel Milk Tea' ,4 ,10 ,'./assets/img/image30');
