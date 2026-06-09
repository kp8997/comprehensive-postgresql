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

Inside the index heap file
    root node and its direct children is page 3 (pg_page_items('users_username_idx', 3))
    the first node of other page is routing node (x, 1) has no data and point to the first node of next page. E.g
        pg_page_items('users_username_idx', 1)
            (82,1) data: 'Alyson.Romaguera57
        pg_page_items('users_username_idx', 2)
            (101,1) data: Austin_Rath
            (82,30) data: 'Alyson.Romaguera57
        pg_page_items('users_username_idx', 4)
            (70,1) data: Brown.Barton
            (101,5) data: Austin_Rath
        pg_page_items('users_username_idx', 1)
            (1,0) empty
            (2,1) data: 'Alyson.Romaguera57
            (4,1) data: Austin_Rath
            
We can also query the most common metadata about a single table by pg_stats and tablename

How the costs are calculated when explain:
    Parameter                   Default Cost    What it Measures
    seq_page_cost	            1.0	            Disk fetch cost for a single page sequentially.
    random_page_cost	        4.0	            Disk fetch cost for a single page non-sequentially (random I/O).
    cpu_tuple_cost	            0.01	        CPU effort required to process a single row (tuple).
    cpu_index_tuple_cost	    0.005	        CPU effort required to process a single index entry during a scan.
    cpu_operator_cost	        0.0025	        CPU effort to evaluate an operator or function (e.g., in a WHERE clause).

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
