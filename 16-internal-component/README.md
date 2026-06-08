We can query metadata about data in database like:
    1. data_directory: location in local machine
    2. information about database between raw one and informative one
    3. metadata of every database like: oid, datname
    4. heap (data file), tuple (row), block (page)
    
We can create index for column to fast retrieve via block and index mechanism

Benchmark before and after applying index with EXPLAIN ANALYZE

Downside: if we create index for every columns of every tables
    1. it will be slower when insert/update/delete/ due to need to update index as well
    2. consume space for index file
    3. index is not actually used


---------
My own statement for mechanism of stored file;

A stored file on hard disk of those database called heap file. each database is a heap file. Inside a heap file,
there are many blocks, each blocks contain many tuples (rows) and some data of the file:
    1. A page header/metadat
    2. Free space contains:
        3. Line pointers/offset to locate where tuple is (the index number point to this). Save in downward direction
        4. Tuples (real data in rows) with upward direction saving
    5. Special Section for linking before and after sibling of the current block    
    
A index file also has similar structure with heap file (called leaf node), but inside instead of tuples is data, it stores index of tuple in heap file called ctid (block_id, index_number). Index number point to Line pointers/offset section in heap file. And line pointers point to the real data of the row
