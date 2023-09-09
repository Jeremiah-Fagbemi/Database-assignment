//  3 (a) Creating Entities
db.createCollection('Items');
db.createCollection('Users');
db.createCollection('Category');
db.createCollection('Customer');
db.createCollection('Deliver');
db.createCollection('Deliver_Details');
db.createCollection('Item_Stock');
db.createCollection('Role');
db.createCollection('Supplier');
db.createCollection('Users_Items');
db.createCollection('Order_Items');
db.createCollection('Users_Order_Item');
db.createCollection('Items_User_Item');
db.createCollection('Order_Items');
// 3 (b) Inserting Records
// Users Entity

db.Users.insertMany([
	{
		_id: 1,
		Name: 'John',
		Address: 'Jos',
		Password: 'john',
		Email: 'john@gmail.com',
		Created_at: Date(),
		Phone_number: '07033751434',
		Sex: 'Male',
	},
	{
		_id: 1,
		Name: 'Peter',
		Address: 'Kogi',
		Password: 'Peter',
		Email: 'peter@gmail.com',
		Created_at: Date(),
		Phone_number: '07033751439',
		Sex: 'Female',
	},
]);
// Role Entity
db.Role.insertOne({ _id: 1, Role: 'Admin', Created_at: Date() });
db.Role.insertOne({ _id: 2, Role: 'User', Created_at: Date() });
//  Items Entity
db.Items.insertMany([
	{
		_id: 1,
		Name: 'Shirt',
		Price: 200,
		Size: 'small',
		Description: 'Silk material ',
		Created_at: Date(),
	},
	{
		_id: 1,
		Name: 'Sleeveless',
		Price: 240,
		Size: 'Large',
		Description: 'Cotton material ',
		Created_at: Date(),
	},
]);
// Users_Items Entity
db.Users_Items.insertOne({
	_id: 1,
	Users_id: 2,
	Items_id: 1,
	Created_at: Date(),
});
db.Users_Items.insertOne({
	_id: 2,
	Users_id: 1,
	Items_id: 2,
	Created_at: Date(),
});
// Category Entity
db.Category.insertMany([
	{ _id: 1, Category: 'Silk', Items_id: 1, Created_at: Date() },
	{ _id: 2, Category: 'Cotton', Items_id: 2, Created_at: Date() },
]);
// Item_Stock Entity
db.Item_Stock.insertOne({
	_id: 1,
	Item_Quantity: '200pcs',
	Category_id: 2,
	Created_at: Date(),
});
db.Item_Stock.insertOne({
	_id: 2,
	Item_Quantity: '400pcs',
	Category_id: 1,
	Created_at: Date(),
});
// Order_Item Entity
db.Order_Item.insertMany([
	{
		_id: 1,
		Order_Date: '2023-09-09',
		Updated_at: Date(),
		Users_id: 1,
		Items_id: 2,
	},
	{
		_id: 2,
		Order_Date: '2023-09-09',
		Updated_at: Date(),
		Users_id: 2,
		Items_id: 1,
	},
]);
// User_Order_item Entity
db.User_Order_item.insertMany([
	{ _id: 1, Order_item_id: 2, Users_id: 1 },
	{ _id: 2, Order_item_id: 1, Users_id: 2 },
]);
// Item_User_item Entity
db.Item_User_item.insertMany([
	{ _id: 1, Order_item_id: 2, Items_id: 1 },
	{ _id: 2, Order_item_id: 1, Items_id: 2 },
]);
// Order_Details Entity

db.Order_Details.insertOne({
	_id: 1,
	Order_Quantity: 20,
	Expected_Date: '2023-10-02',
	Order_Item_id: 1,
	Users_Id: 1,
});
db.Order_Details.insertOne({
	_id: 2,
	Order_Quantity: 20,
	Expected_Date: '2023-10-02',
	Order_Item_id: 2,
	Users_Id: 1,
});

// Supplier Entity
db.Supplier.insertOne({
	_id: 1,
	Name: 'James',
	Address: 'Jos',
	Order_Details_id: 2,
});
db.Supplier.insertOne({
	_id: 2,
	Name: 'Peter',
	Address: 'Edo',
	Order_Details_id: 1,
});

// Deliver Entity

db.Deliver.insertOne({ _id: 1, Deliver_Date: '2023-09-23', Item_Id: 1 });
db.Deliver.insertOne({ _id: 2, Deliver_Date: '2023-19-23', Item_Id: 1 });

// Deliver_Details Entity
db.Deliver_Details({
	_id: 1,
	Deliver_Quantities: 23,
	Deliver_Date: '2023-11-23',
	Deliver_id: 2,
	Created_at: Date(),
});
db.Deliver_Details({
	_id: 2,
	Deliver_Quantities: 523,
	Deliver_Date: '2023-12-23',
	Deliver_id: 1,
	Created_at: Date(),
});

// Customer Entity

db.Customer.insertOne({
	_id: 1,
	Name: 'Job',
	Address: 'Kogi',
	Deliver_Details_Id: 1,
	Users_Id: 2,
});
db.Customer.insertOne({
	_id: 2,
	Name: 'Kriss',
	Address: 'Jos',
	Deliver_Details_Id: 2,
	Users_Id: 1,
});

//  3 (c) Getting Records from Entities
// Get single record
db.Customer.findOne({ _id: 2 });
// Get All
db.Users.find();

// 3 (d) Update Records

db.Customer.updateOne({ _id: 1 }, { $set: { Name: 'Jack' } });
db.Supplier.updateMany(
	{ _id: 1 },
	{ $set: { Name: 'Johnson', Address: 'Jos' } }
);

// 3 (e) Deleting Record

db.Role.deleteOne({ _id: 1 });
db.Deliver.deleteMany({ _d: 1 });
