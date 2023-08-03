-- Create Sites table
CREATE TABLE Sites (
  id INTEGER PRIMARY KEY,
  site_code TEXT,
  Site_name TEXT,
  Warehouse INTEGER
);

-- Create Warehouse table
CREATE TABLE Warehouse (
  id INTEGER PRIMARY KEY,
  site_id INTEGER,
  warehouse_code TEXT,
  warehouse_name TEXT,
  FOREIGN KEY (site_id) REFERENCES Sites (id)
);

-- Create Item Category table
CREATE TABLE Item_Category (
  id INTEGER PRIMARY KEY,
  category_code TEXT,
  category_name TEXT
);

-- Create Item Group table
CREATE TABLE Item_Group (
  id INTEGER PRIMARY KEY,
  group_code TEXT,
  group_name TEXT
);

-- Create Generic Product table
CREATE TABLE Generic_Product (
  id INTEGER PRIMARY KEY,
  generic_name TEXT
);

-- Create Product table
CREATE TABLE Product (
  id INTEGER PRIMARY KEY,
  product_code TEXT,
  category_id INTEGER,
  group_id INTEGER,
  brand_id INTEGER,
  generic_id INTEGER,
  model_id INTEGER,
  part_id INTEGER,
  product_name TEXT,
  product_description TEXT,
  product_price REAL,
  has_instances TEXT,
  has_lots TEXT,
  has_attributes TEXT,
  default_uom TEXT,
  pack_size INTEGER,
  average_cost REAL,
  single_unit_product_code TEXT,
  dimension_group INTEGER,
  lot_information TEXT,
  warranty_terms TEXT,
  is_active TEXT,
  deleted TEXT,
  product_attribute_type_id INTEGER,
  FOREIGN KEY (category_id) REFERENCES Item_Category (id),
  FOREIGN KEY (group_id) REFERENCES Item_Group (id),
  FOREIGN KEY (brand_id) REFERENCES Brand (id),
  FOREIGN KEY (generic_id) REFERENCES Generic_Product (id)
);

-- Create Product Attribute Type table
CREATE TABLE Product_Attribute_Type (
  id INTEGER PRIMARY KEY,
  attribute_name TEXT
);

-- Create Product Attribute table
CREATE TABLE Product_Attribute (
  id INTEGER PRIMARY KEY,
  product_id INTEGER,
  attribute_id INTEGER,
  FOREIGN KEY (product_id) REFERENCES Product (id),
  FOREIGN KEY (attribute_id) REFERENCES Product_Attribute_Type (id)
);

-- Create Product Attribute Value table
CREATE TABLE Product_Attribute_Value (
  id INTEGER PRIMARY KEY,
  product_attribute_id INTEGER,
  value TEXT,
  FOREIGN KEY (product_attribute_id) REFERENCES Product_Attribute (id)
);

-- Create Product Instance table
CREATE TABLE Product_Instance (
  id INTEGER PRIMARY KEY,
  product_id INTEGER,
  instance_name TEXT,
  serial_number TEXT,
  brand_id INTEGER,
  stock_id INTEGER,
  lot_information TEXT,
  warranty_terms TEXT,
  product_attribute_value_id INTEGER,
  FOREIGN KEY (product_id) REFERENCES Product (id),
  FOREIGN KEY (brand_id) REFERENCES Brand (id),
  FOREIGN KEY (stock_id) REFERENCES Stock (id),
  FOREIGN KEY (product_attribute_value_id) REFERENCES Product_Attribute_Value (id)
);

-- Create Product Lot table
CREATE TABLE Product_Lot (
  id INTEGER PRIMARY KEY,
  lot_code TEXT,
  date_manufactured TEXT,
  date_expiry TEXT,
  product_attribute_value_id INTEGER,
  FOREIGN KEY (product_attribute_value_id) REFERENCES Product_Attribute_Value (id)
);

-- Create Brand table
CREATE TABLE Brand (
  id INTEGER PRIMARY KEY,
  manufacturer_id INTEGER,
  brand_code TEXT,
  brand_name TEXT,
  FOREIGN KEY (manufacturer_id) REFERENCES Brand_Manufacturer (id)
);

-- Create Brand Manufacturer table
CREATE TABLE Brand_Manufacturer (
  id INTEGER PRIMARY KEY,
  manufacturer_name TEXT
);

-- Create Stock table
CREATE TABLE Stock (
  id INTEGER PRIMARY KEY,
  product_id INTEGER,
  warehouse_id INTEGER,
  zone_id INTEGER,
  level_id INTEGER,
  rack_id INTEGER,
  quantity_in_hand INTEGER,
  product_attribute_value_id INTEGER,
  FOREIGN KEY (product_id) REFERENCES Product (id),
  FOREIGN KEY (warehouse_id) REFERENCES Warehouse (id),
  FOREIGN KEY (zone_id) REFERENCES Zone (id),
  FOREIGN KEY (level_id) REFERENCES Level (id),
  FOREIGN KEY (rack_id) REFERENCES Rack (id),
  FOREIGN KEY (product_attribute_value_id) REFERENCES Product_Attribute_Value (id)
);

-- Create Product Price Records table
CREATE TABLE Product_Price_Records (
  product_id INTEGER,
  from_date TEXT,
  product_price REAL,
  FOREIGN KEY (product_id) REFERENCES Product (id)
);

-- Create Purchase Order Header table
CREATE TABLE Purchase_Order_Header (
  id INTEGER PRIMARY KEY,
  supplier_id INTEGER,
  purchase_date TEXT,
  total_amount REAL,
  FOREIGN KEY (supplier_id) REFERENCES Supplier (id)
);

-- Create Purchase Order Line table
CREATE TABLE Purchase_Order_Line (
  id INTEGER PRIMARY KEY,
  po_id INTEGER,
  product_id INTEGER,
  unit_price REAL,
  quantity INTEGER,
  FOREIGN KEY (po_id) REFERENCES Purchase_Order_Header (id),
  FOREIGN KEY (product_id) REFERENCES Product (id)
);

-- Create Supplier table
CREATE TABLE Supplier (
  id INTEGER PRIMARY KEY,
  supplier_code TEXT,
  supplier_name TEXT,
  supplier_type TEXT
);

-- Create Product UOM table
CREATE TABLE Product_UOM (
  id INTEGER PRIMARY KEY,
  uom_name TEXT
);

-- Create Product UOM Conversion table
CREATE TABLE Product_UOM_Conversion (
  id INTEGER PRIMARY KEY,
  from_uom_id INTEGER,
  to_uom_id INTEGER,
  conversion_rule TEXT,
  FOREIGN KEY (from_uom_id) REFERENCES Product_UOM (id),
  FOREIGN KEY (to_uom_id) REFERENCES Product_UOM (id)
);
