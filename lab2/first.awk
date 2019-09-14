BEGIN{tcp=0;ack=0}
{
if($1 == "r" && $5 == "tcp")
{
	tcp++;
}
else if($1 == "r" && $5 =="ack")
{
	ack++;
}
}
END {
printf("Total number of packets sent by TCP : %d\n",tcp);
printf("Total number of packets as acknowledgement : %d\n",ack); 
}
