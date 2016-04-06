BEGIN{
	FS="\t"
}
{
	records += 1
	browsers[$12] += 1
	browplats[$12, $10] += 1
	platforms[$10] += 1
}
END{
	printf("\n")
	for(b in browsers){
		if(top < browsers[b]){
			top = browsers[b]
		}
	}
	printf("** breakdowns by platform & browser **\n\n")
	printf("|                      |             browsers |                count |      % |\n")
	printf("|----------------------|----------------------|----------------------|--------|\n")

	for(b in browsers){

		dots = 0
		if(top > 0){
			dots = (browsers[b] / top) * 100
		}

		percent = ((browsers[b] / records) * 100)
		printf("|                      | %20s | %20d |  %5.2f |", b, browsers[b], percent)

		for(i = 0; i < dots; i += 1){
			printf("#")
		}

		printf( "\n" )
	}

	top = 0
	for(p in platforms){
		if(top < platforms[p]){
			top = platforms[p]
		}
	}

	printf("|----------------------|----------------------|----------------------|--------|\n")
	printf("|                      |            platforms |                count |      % |\n")
	printf("|----------------------|----------------------|----------------------|--------|\n")

	for(p in platforms){

		dots = 0
		if(top > 0){
			dots = (platforms[p] / top) * 100
		}

		percent = ((platforms[p] / records) * 100)
		printf("|                      | %20s | %20d |  %5.2f | ", p, platforms[p], percent)

		for(i = 0; i < dots; i += 1){
			printf("#")
		}

		printf( "\n" )
	}

	top = 0
	for(p in browplats){
		if(top < browplats[p]){
			top = browplats[p]
		}
	}

	printf("|----------------------|----------------------|----------------------|--------|\n")
	printf("|              browser |             platform |                count |      % |\n")
	printf("|----------------------|----------------------|----------------------|--------|\n")

	for(p in browplats){

		dots = 0
		if(top > 0){
			dots = (browplats[p] / top) * 100
		}

		percent = ((browplats[p] / records) * 100)
		split(p, x, SUBSEP)
		printf("| %20s | %20s | %20d |  %5.2f | ", x[1], x[2], browplats[p], percent)

		for(i = 0; i < dots; i += 1){
			printf("#")
		}

		printf( "\n" )
	}

	printf("|----------------------|----------------------|----------------------|--------|\n")
	printf("|                      |                      | %20d |        |\n", records)
	printf("\n")














}
