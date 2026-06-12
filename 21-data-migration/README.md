Data migration might take a bunch of hours to complete, depends on the amount of data. Should not do the same time at Schema migration. 

When copying with millions records, in the meantime, insertion still happen. When it merges back the new column will be null. We will lost data from old columns of the new records
=> Update in batches, we can divide many batches to update during period of time for the whole migration
