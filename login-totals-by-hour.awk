BEGIN{
	FS="\t"
}
{
	records += 1
	ts = substr($6, index($6, "T")+1, 2)
	mins[ts] += 1
	if(!((ts, $2) in users)){
		hourUniqueTotals[ts] += 1
	}
	users[ts, $2] = $2
}
END{
	printf("\n")
	for (h = 0; h < 24; h += 1){
		h = sprintf("%02d", h)

		if(top < mins[h]){
			top = mins[h]
		}

		if(hourUniqueMax < hourUniqueTotals[h]){
			hourUniqueMax = hourUniqueTotals[h]
		}

		uniques += hourUniqueTotals[h]

	}
	printf("** total logins per hour **\n\n")
	printf("|      time |    unique |    logins |\n")
	printf("|-----------|-----------|-----------|\n")

	for (h = 0; h < 24; h += 1){
		h = sprintf("%02d", h)

		dots = 0
		if(top > 0){
			dots = (mins[h] / top) * 100
		}

		hs = h

		# central daylight time
		hs -= 6

		if( hs < 0 ){ hs += 24 }
		printf("|     %02d:00 | %9s | %9s | ", hs, hourUniqueTotals[h], mins[h])

		for(i = 0; i < dots; i += 1){
			printf("#")
		}

		printf( "\n" )
	}
	printf("|-----------|-----------|-----------|\n")
	printf("|           | %9d | %9d |\n", uniques, records)
	printf("\n")

}


