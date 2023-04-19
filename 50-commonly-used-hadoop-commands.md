Here are 50 commonly used Hadoop commands that can help you manage Hadoop distributed file system (HDFS) and MapReduce jobs:

hadoop fs -ls: List files and directories in the HDFS.

hadoop fs -put: Copy files from local file system to HDFS.

hadoop fs -get: Copy files from HDFS to local file system.

hadoop fs -copyFromLocal: Similar to hadoop fs -put, but with more options.

hadoop fs -copyToLocal: Similar to hadoop fs -get, but with more options.

hadoop fs -cat: View the content of a file in HDFS.

hadoop fs -mkdir: Create a directory in HDFS.

hadoop fs -rm: Delete a file or directory from HDFS.

hadoop fs -chmod: Change the permission of a file or directory in HDFS.

hadoop fs -chown: Change the owner of a file or directory in HDFS.

hadoop fs -chgrp: Change the group of a file or directory in HDFS.

hadoop fs -du: Display the size of a file or directory in HDFS.

hadoop fs -count: Count the number of files and directories in HDFS.

hadoop fs -mv: Move or rename a file or directory in HDFS.

hadoop fs -touchz: Create an empty file in HDFS.

hadoop fs -setrep: Set the replication factor of a file in HDFS.

hadoop fs -test: Test file or directory accessibility in HDFS.

hadoop fs -tail: View the last kilobyte of a file in HDFS.

hadoop jar: Run a MapReduce job using a JAR file.

hadoop job -list: List all MapReduce jobs.

hadoop job -kill: Kill a running MapReduce job.

hadoop job -history: View the history of a completed MapReduce job.

hadoop dfsadmin -report: Display the HDFS cluster status.

hadoop dfsadmin -safemode: Turn on or off the safe mode in HDFS.

hadoop dfsadmin -metasave: Save the current namespace image into a file.

hadoop dfsadmin -refreshNodes: Refresh the list of datanodes in HDFS.

hadoop dfsadmin -setBalancerBandwidth: Set the maximum network bandwidth for the HDFS balancer.

hadoop dfs -expunge: Empty the trash folder in HDFS.

hadoop dfs -getmerge: Merge files in HDFS into a single file on the local file system.

hadoop dfs -test -d: Test if a path is a directory.

hadoop dfs -test -f: Test if a path is a file.

hadoop dfs -test -e: Test if a path exists.

hadoop dfs -du -h: Display the size of a file or directory in human-readable format.

hadoop dfs -du -s: Display the summary of a file or directory size.

hadoop dfs -du -h -s: Display the summary of a file or directory size in human-readable format.

hadoop dfs -getfacl: Display the Access Control List (ACL) for a file or directory in HDFS.

