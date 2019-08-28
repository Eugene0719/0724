
CREATE TABLE IF NOT EXISTS product(
	p_id VARCHAR(10) NOT NULL,
	p_name VARCHAR(10),
	p_unitPrice INTEGER,
	p_description TEXT,
	p_category VARCHAR(20),
	p_manufacturer VARCHAR(20),
	p_nutisInStock LONG,
	p_condition VARCHAR(20),
	p_fileName VARCHAR(20),
	PRIMARY KEY (p_id)
)default CHARSET=utf8;

desc product;

select * from product;

INSERT INTO product VALUES('P1234','iPhones 6s', 800000,'1334X750 RENINA HD display, 8-megapixel iSight Vamera', 'Smart Phone','Apple',1000, 'new', 'P1234.png');

INSERT INTO product VALUES('P1235','LG PC gram', 1500000, '3.3-inch,IPS LED display, 5rd Generation Intel Core processors', 'Notebook','LG',1000, 'new','P1235.png');

INSERT INTO product VALUES('P1236','Galaxy Tab S',900000,'3.3-inch, 212.8*125.6*6.6mm, Super AMOLED display, Octa-Core processor','Tablet','Samsung',1000,'new','P1236.png');


alter table product change p_name p_name VARCHAR(20);

alter table product change p_nutisInStock p_unitsInStock Long;


