What is a relational database?
------------------------------


How are these different to non-relational databases?
----------------------------------------------------


What are the benefits of a relational database?  
-----------------------------------------------



What are the risks of a relational database?  
--------------------------------------------
There are many (see: http://insideanalysis.com/2009/02/is-the-relational-database-doomed/).  However, one key issue explored by Tony Bain (http://blog.tonybain.com/tony_bain/2009/05/the-problem-with-the-relational-database-part-1-the-deployment-model.html), is that of maintenance:

 - when co-located independant databases are stored on a single server - the dynamic nature of the query load (in terms of data volume and nature) makes managing capacity a complicated and time-consuming task, as such the database to server ratio is usually capped at 10:1

 - this then leads to a follow-on problem of resource inefficiency and ineffective distribution, as a company wthi 100 database servers could have 70% of those underutilized, 20% being utilised optimally and 10% suffering from poor performance as a result of bottlenecks

 - to manage this, a Database Administrator (DBA) has to monitor the servers to keep current query demands as optimal as possible, continually staying one-step ahead of the requirements being placed on the database(s) - multiply this across hundreds of servers and the cost of maintenance becomes significant

This has led to the concern 'is the relational database doomed...'.  According to Robin Boor (http://insideanalysis.com/2009/02/is-the-relational-database-doomed/), the answer is 'not really....  The only thing that is doomed is the idea that a relational model offers an effective general solution to the problem of storing data in a convenient and accessible form.  It never did and it will never do.''
