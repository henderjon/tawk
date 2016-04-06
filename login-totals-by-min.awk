BEGIN{
	FS="\t"
}
{
	records += 1
	split($6, DT, "T")
	split(DT[2], T, ":")
	ts = sprintf("%02d:%02d", T[1], T[2])
	mins[ts] += 1
}
END{
	printf("\n")
	for(h = 0; h < 24; h += 1){
		for(m = 0; m < 60; m += 1){
			ts = sprintf("%02d:%02d", h, m)

			if(top < mins[ts]){
				top = mins[ts]
			}
		}
	}
	printf("** total logins per mintue **\n\n")
	printf("|      time |    logins |\n")
	printf("|-----------|-----------|\n")

	for(h = 0; h < 24; h += 1){
		for(m = 0; m < 60; m += 1){
			ts = sprintf("%02d:%02d", h, m)

			dots = 0
			if(top > 0){
				dots = (mins[ts] / top) * 100
			}

			# central daylight time
			hs = h - 6
			if( hs < 0 ){ hs += 24 }
			cts = sprintf("%02d:%02d", hs, m)

			printf("| %9s | %9s | ", cts, (mins[ts] > 0 ? mins[ts] : "n/a"))

			for(i = 0; i < dots; i += 1){
				printf("#")
			}

			printf( "\n" )
		}
	}

	printf("|-----------|-----------|\n")
	printf("|           | %9d |\n", records)
	printf("\n")
}


