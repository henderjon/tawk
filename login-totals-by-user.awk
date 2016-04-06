BEGIN{
	FS="\t"
}
{
	records += 1
	mins[$2] += 1
	users[$2] = $2
}
END{
	printf("\n")
	for (i in mins){
		if(top < mins[i]){
			top = mins[i]
		}
	}
	printf("** total logins (>=30) by user **\n\n")
	printf("|      user |    logins |\n")
	printf("|-----------|-----------|\n")

	for (i in mins){
		if(mins[i] < 30){
			continue
		}
		over30 += 1
		dots = 0
		if(top > 0){
			dots = (mins[i] / top) * 100
		}

		printf("| %9d | %9s | ", i, mins[i])

		for(j = 0; j < dots; j += 1){
			printf("#")
		}

		printf( "\n" )
	}
	printf("|-----------|-----------|\n")
	printf("|           | %9d |\n", over30)
	printf("\n")

	for (i in users){
		unique += 1
	}

	printf("\n")
	printf("** total unique users **\n\n")
	printf("|    logins |    unique |      % |\n")
	printf("|-----------|-----------|--------|\n")
	printf("| %9d | %9d |  %5.2f |\n", records, unique, (unique / records) * 100)
	printf("\n")

}
