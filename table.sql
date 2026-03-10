-- code for create table:
CREATE Table Sellers (
    sellerID int UNIQUE NOT NULL AUTO_INCREMENT,
    firstName varchar(50) NOT NULL,
    lastName varchar(50) NOT NULL,
    email varchar(100) UNIQUE NOT NULL,
    phone varchar(50) NOT NULL,
    state varchar(2) NOT NULL,
    joinDate datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
    rating decimal(2,1),
    PRIMARY KEY(sellerID)
);


CREATE Table Cameras (
    cameraID int UNIQUE NOT NULL AUTO_INCREMENT,
    sellerID int NOT NULL,
    brand varchar(50) NOT NULL,
    model varchar(100) NOT NULL,
    filmFormat varchar(20) NOT NULL,
    releaseYear int,
    description text,
    PRIMARY KEY(cameraID),
    FOREIGN KEY (sellerID) REFERENCES Sellers(sellerID)
);


CREATE Table Listings (
    listingID int UNIQUE NOT NULL AUTO_INCREMENT,
    cameraID int NOT NULL,
    sellerID int NOT NULL,
    price decimal(10,2) NOT NULL,
    condition varchar(20) NOT NULL,
    description text,
    datePosted datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
    isSold boolean DEFAULT FALSE NOT NULL，
    PRIMARY KEY(listingID),
    FOREIGN KEY (cameraID) REFERENCES Cameras(cameraID),
    FOREIGN KEY (sellerID) REFERENCES Sellers(sellerID)
);


CREATE Table Categories (
    categoryID int UNIQUE NOT NULL AUTO_INCREMENT,
    categoryName varchar(50) UNIQUE NOT NULL,
    description text,
    PRIMARY KEY(cameraID)
);


CREATE Table ListingsCategories (
    listingID int NOT NULL,
    categoryID int NOT NULL,
    PRIMARY KEY (listingID, categoryID),
    FOREIGN KEY (listingID) REFERENCES Listings(listingID),
    FOREIGN KEY (categoryID) REFERENCES Categories(categoryID)
);
