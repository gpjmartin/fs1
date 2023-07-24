#The csv is expecting the 2 x columns outputed from a table of the form - select * from "gms3"."land"."page_views$partitions" ;
#This sampel is based on a Hive Table with 2 x Partition columns
import csv
with open('/Users/grahammartin/Downloads/part.csv', newline='') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        
        #print('nohup ./trino --execute \'',
        print('SELECT count(*), FROM "gms3"."land"."page_views" where ds=DATE(\'',
        row['ds'], 
        '\')',
        ' and country=\'',
        row['country'],
        '\''
        ';',
        #'\'',
        #' >> ',
        #row['ds'],row['country'],
        #'.txt;sleep 1',
        sep = '')

