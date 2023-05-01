CREATE TABLE client (
_id INT NOT NULL AUTO_INCREMENT,
user VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
passcode VARCHAR(255) NOT NULL,
PRIMARY KEY (_id),
UNIQUE KEY client_user_unique (user),
UNIQUE KEY client_email_unique (email)
);

CREATE TABLE vehicle (
_id INT NOT NULL AUTO_INCREMENT,
clientId INT NOT NULL,
name VARCHAR(255) NOT NULL,
description TEXT NOT NULL,
date DATE NOT NULL,
PRIMARY KEY (_id),
CONSTRAINT vehicle_clientid_foreign FOREIGN KEY (clientId) REFERENCES client(_id) ON DELETE CASCADE
);

CREATE TABLE professional (
_id INT NOT NULL AUTO_INCREMENT,
user VARCHAR(255) NOT NULL,
passcode VARCHAR(255) NOT NULL,
PRIMARY KEY (_id),
UNIQUE KEY professional_user_unique (user)
);

CREATE TABLE repair (
_id INT NOT NULL AUTO_INCREMENT,
budget VARCHAR(255) NOT NULL,
description TEXT NOT NULL,
confirmation TINYINT NOT NULL,
date DATE NOT NULL,
professionalId INT NOT NULL,
vehicleId INT NOT NULL,
PRIMARY KEY (_id),
CONSTRAINT repair_vehicleid_foreign FOREIGN KEY (vehicleId) REFERENCES vehicle(_id) ON DELETE CASCADE,
CONSTRAINT repair_professionalid_foreign FOREIGN KEY (professionalId) REFERENCES professional(_id) ON DELETE CASCADE
);