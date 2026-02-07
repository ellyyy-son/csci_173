/* Getting started with pig */
/* wyu@ateneo.edu */

/*
Pre-requisites for running:
1. Download pig: https://downloads.apache.org/pig/latest/pig-0.17.0.tar.gz
2. Environment set for interactive mode: "export HADOOP_HOME="/home/wyy/hadoop-3.3.0". Make sure Hadoop is started.
3. grab some TSV data from "aws s3 ls s3://amazon-reviews-pds/tsv/sample_us.tsv" and put it in your HDFS local directory. You should remember how to do this right?
4. load pig via "pig"
*/

/* load data via pig. this also works on CSV files */
A = LOAD 'sample_us.tsv' AS (marketplace:chararray, customer_id:chararray, review_id:chararray, product_id:chararray, product_parent:chararray, product_title:chararray, product_category:chararray, star_rating:int, helpful_votes:int, total_votes:int, vine:chararray, verified_purchase:chararray, review_headline:chararray, review_body:chararray, review_date:chararray);

/* display data loaded. pls note pig is case sensitive */
DUMP A;

/* test filtering */
B = FILTER A BY product_category MATCHES 'Toys';
DUMP B;

C = FILTER A BY star_rating >= 5;
DUMP C;

/* test grouping */
D = GROUP A BY star_rating;
E = FOREACH D GENERATE group as grp, COUNT(A.review_id);
DUMP E;

/* sorting output */
F = ORDER E BY grp DESC;
DUMP F;
