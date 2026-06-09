With as alias_name ( 
	query
)

Select
	(function + column) column as alias
	aggregate
	subquery
	distinct
	utility: 
		greatest, 
		least, 
		case when … then … when … then … end 

From 
	table
	subquery

Where
	condition: >, >=, <, <=, =, <>, IN, NOT IN, LIKE
	subquery

Join
	table1 ON field1 = field2
	join table2
		on field1 = field2 and field3 =field 4

Group by
	column

Order by
	column

Limit 
	number

Offset
	number

Subquery (
	Select
	
	From

	Where

	Join

	Group by
	
	Order by

	Limit 

	Offset
)