We can query metadata about data in database like:
    1. data_directory: location in local machine
    2. information about database between raw one and informative one
    3. metadata of every database like: oid, datname
    4. heap (data file), tuple (row), block (page)
    
We can create index for column to fast retrieve via block and index mechanism

Benchmark before and after applying index with EXPLAIN ANALYZE
