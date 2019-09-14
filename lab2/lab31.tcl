set ns [new Simulator]

set nf [open sim1.nam w]
set nt [open ag.tr w]

$ns namtrace-all $nf
$ns trace-all $nt

set n0 [$ns node]
set n1 [$ns node]

$ns duplex-link $n0 $n1 1Mb 8ms DropTail

set tcp [new Agent/TCP]
$ns attach-agent $n0 $tcp

set sink [new Agent/TCPSink]
$ns attach-agent $n1 $sink

$ns connect $tcp $sink

set ftp [new Application/FTP]
$ftp attach-agent $tcp

proc finish {} {
	global ns nf nt
	$ns flush-trace
	close $nf
	close $nt
	exec nam sim1.nam &
	exit 0
}

$ns at 0.1ms "$ftp start"
$ns at 4ms exit
$ns run
