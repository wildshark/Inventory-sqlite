# Inventory Database

This is an SQLite inventory database designed to support various aspects of product management, warehousing, and transactions. The database includes tables to store information about product categories, groups, generic products, brands, suppliers, warehouses, and more. It also supports features such as product instances with serial numbers, lot control with batch numbers, pack size, and unit of measure (UOM) conversion.

## Features

- Comprehensive support for product categorization and grouping
- Generic product management with specific brand variants
- Color / size / model (CSM) support for products like footwear, apparel, etc.
- Product instances with unique serial numbers for items like TVs, Refrigerators, etc.
- Lot control / Batch control with serial numbers for products with expiry dates
- Pack size management and support for different unit of measure conversions
- Manufacturer and brand management, along with supplier information
- Example transaction table for Purchase Orders

## Database Schema

The database schema includes the following tables:

- **Sites**: Stores information about different sites (locations) where warehouses are located.
- **Warehouse**: Contains information about the warehouses associated with each site.
- **Item_Category**: Stores item categories to categorize products.
- **Item_Group**: Represents item groups to further group products within categories.
- **Generic_Product**: Holds information about generic products (e.g., "Table Clock").
- **Product**: Contains detailed information about specific products. It references various other tables such as `Item_Category`, `Item_Group`, `Brand`, and `Generic_Product`.
- **Product_Attribute_Type**: Defines different types of attributes that a product can have.
- **Product_Attribute**: Associates product instances with attributes defined in `Product_Attribute_Type`.
- **Product_Attribute_Value**: Stores attribute values for product instances.
- **Product_Instance**: Contains information about specific instances of products, such as serial numbers and associated attributes.
- **Product_Lot**: Stores information about product lots or batches, including attributes and expiry dates.
- **Brand**: Represents different brands, associated with manufacturers in the `Brand_Manufacturer` table.
- **Brand_Manufacturer**: Contains manufacturer information associated with brands.
- **Stock**: Tracks the inventory of products in different warehouses and their locations. It has references to `Product`, `Warehouse`, and `Product_Attribute_Value`.
- **Product_Price_Records**: Records historical price changes for products.
- **Purchase_Order_Header**: Stores information about purchase orders, including supplier details.
- **Purchase_Order_Line**: Contains details of products ordered in each purchase order, linked to `Purchase_Order_Header` and `Product` tables.
- **Supplier**: Holds information about suppliers.
- **Product_UOM**: Represents units of measure for products.
- **Product_UOM_Conversion**: Defines conversion rules between different units of measure.

## Getting Started

1. Clone this repository to your local machine.
2. Execute the SQLite script provided in `database_script.sql` to create the inventory database.

Feel free to use this inventory database as a foundation for managing your products, warehouses, and transactions efficiently. If you have any questions or need further information, please don't hesitate to reach out.

## License

This project is licensed under the [MIT License](LICENSE).
