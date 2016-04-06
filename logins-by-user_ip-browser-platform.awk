BEGIN{
	FS="\t"
	OFS="\t"
}
{
	records += 1
	ips[$8]+=1
	browplats[$8, $12, $10] += 1
}
END{
	top = 0
	for(p in browplats){
		if(top < browplats[p]){
			top = browplats[p]
		}
	}

	for(p in browplats){
		percent = ((browplats[p] / records) * 100)
		split(p, x, SUBSEP)
		print("ips", x[1], "browser", x[2], "platform", x[3], "count", browplats[p], "__percent_of_records", sprintf("%.2f", percent))
	}
}
