BEGIN{
	FS="\t"
	OFS="\t"
}
{
	mins[$2] += 1
	users[$2] = $2
}
END{
	for(u in users){
		if(mins[u] > 50){
			print("user", u, "totals", mins[u])
		}
	}
}
