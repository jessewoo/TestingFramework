// BiologicalProcessTree Search for biological adhesion
		queries.put("search/smartSubquery.do?smartSearchSubtype=TreeEntityQuery&t=4&n=22610",mins[0]);
		
		// CellComponentTree Search for cell junction
		queries.put("search/smartSubquery.do?smartSearchSubtype=TreeEntityQuery&t=5&n=30054",mins[1]);
		
		// MolecularFunctionTree Search for antioxidant activity
		queries.put("search/smartSubquery.do?smartSearchSubtype=TreeEntityQuery&t=6&n=16209",mins[2]);

		// EnzymeClassificationTree Search for 1: Oxidoreductase (node #1) because other node numbers are NOT immutable
		queries.put("search/smartSubquery.do?smartSearchSubtype=TreeEntityQuery&t=3&n=1",mins[3]);

		// TcdbTree Search for 1: Channels/Pores
		queries.put("search/smartSubquery.do?smartSearchSubtype=TreeQuery&t=16&n=1",mins[4]);

		// MeshTree Search for A01: Body Regions
		queries.put("search/smartSubquery.do?smartSearchSubtype=TreeQuery&t=15&n=1746",mins[5]);

		// TaxonomyTree Search for Viruses
		queries.put("search/smartSubquery.do?smartSearchSubtype=TreeEntityQuery&t=1&n=10239",mins[6]);

		// GenomeTree Search for anything in the ontology, because node numbers are NOT immutable
		queries.put("search/smartSubquery.do?smartSearchSubtype=TreeEntityQuery&t=13&n=1",mins[7]);

		// ScopTree Search for Peptides
		queries.put("search/smartSubquery.do?smartSearchSubtype=TreeQuery&t=11&n=58231",mins[8]);

		// CathTree Search for Few Secondary Structures (4)
		queries.put("search/smartSubquery.do?smartSearchSubtype=TreeQuery&t=12&n=3760",mins[9]);
		
		// MembraneTree Search for ALPHA-HELICAL
		queries.put("search/smartSubquery.do?smartSearchSubtype=TreeQuery&t=19&n=149",mins[10]);

		// AtcTree Search for R: RESPIRATORY SYSTEM
		queries.put("search/smartSubquery.do?smartSearchSubtype=TreeQuery&t=18&n=4638", mins[11]);

		// SymmetryTree Search for Icosahedral
		queries.put("search/smartSubquery.do?smartSearchSubtype=TreeQuery&t=20&n=17", mins[12]);