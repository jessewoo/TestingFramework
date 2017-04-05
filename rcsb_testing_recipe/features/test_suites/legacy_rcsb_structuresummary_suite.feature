Feature: Structure Summary Page Test Suite for RCSB.org

#  CONTENT CHECKING on Structure Summary Page
  Scenario Outline: X-Ray Diffraction Structures
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And check element by "id" "Carousel-BiologicalUnit1", content contains "Biological Assembly 1"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Method: X-Ray Diffraction"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Resolution: <angstrom>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: <classification>"
    And in section "id" "summary", check element by "class" "well" with index "0", content contains "Unique protein chains: <protein_chains>"
    And scroll to element "id" "macromoleculespanel"
    And check element by "id" "macromoleculespanel", content contains "Classification: <classification>"
    Examples:
      | pdbid  | title | classification | protein_chains | angstrom |
      | 1LTI   | HEAT-LABILE ENTEROTOXIN (LT-I) COMPLEX WITH T-ANTIGEN | ENTEROTOXIN | 3 | 2.13 |
      | 1STP   | STRUCTURAL ORIGINS OF HIGH-AFFINITY BIOTIN BINDING TO STREPTAVIDIN | BIOTIN BINDING PROTEIN | 1 | 2.6 |
      | 4F88   | X-ray Crystal Structure of PlyC | Antimicrobial protein viral protein |   2   | 3.3                   |
      | 2W6E   | LOW RESOLUTION STRUCTURES OF BOVINE MITOCHONDRIAL F1-ATPASE  | HYDROLASE |  3 | 6.5 |
      | 3OE7   | Structure of four mutant forms of yeast f1 ATPase: gamma-I270T | HYDROLASE |  5 | 3.19 |
      | 4INU   | Yeast 20S proteasome in complex with the vinyl sulfone LU112 | HYDROLASE / HYDROLASE INHIBITOR | 14 | 3.1 |
      | 4D8S   | Influenza NA in complex with antiviral compound | HYDROLASE |    1 | 2.4 |
      | 4EAR   | purine nucleoside phosphorylase | TRANSFERASE / TRANSFERASE INHIBITOR |    1 | 1.7 |
      | 4IYQ   | divalent ion tolerance protein CutA1 from Ehrlichia chaffeensis | PROTEIN BINDING | 1 | 2.55 |
      | 4HHB   | HUMAN DEOXYHAEMOGLOBIN AT 1.74 ANGSTROMS RESOLUTION | OXYGEN TRANSPORT | 2  | 1.74  |
      | 2HYV   | Human Annexin A2 with heparin hexasaccharide bound | Metal Binding Protein | 1  | 1.42 |
      | 1HV4   | BAR-HEAD GOOSE HEMOGLOBIN (DEOXY FORM) | OXYGEN STORAGE / TRANSPORT |  2   | 2.8    |
      | 4NM8   | broadly neutralizing antibody CR8043 bound to H3 influenza hemagglutinin | viral protein / immune system | 4 | 4.0 |
      | 4RQY   | RE-REFINED STRUCTURE OF 1TE0 - STRUCTURAL ANALYSIS of DEGS | hydrolase | 1 | 2.2 |
      | 4P3Q   | Room-temperature WT DHFR, time-averaged ensemble | OXIDOREDUCTASE | 1 | 1.35 |
      | 4P3R   | Cryogenic WT DHFR, time-averaged ensemble | OXIDOREDUCTASE | 1 | 1.15 |

  Scenario Outline: X-Ray / EPR Structures
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And check element by "id" "Carousel-BiologicalUnit1", content contains "Biological Assembly 1"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Method: EPR, X-RAY DIFFRACTION"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Resolution: <angstrom>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: <classification>"
    And in section "id" "summary", check element by "class" "well" with index "0", content contains "Unique protein chains: <protein_chains>"
    And check element by "id" "literaturepanel", content contains "<literature_title>"
    Examples:
      | pdbid  | title | classification | protein_chains | angstrom | literature_title |
      | 4J7Z   | Thermus thermophilus DNAJ J- and G/F-DOMAINS | CHAPERONE | 1 | 1.64 | Combining crystallography and EPR: crystal and solution structures of the multidomain cochaperone DnaJ. |

  Scenario Outline: Structure Summary Page Literature Spot Check
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And scroll to element "id" "literaturepanel"
    And check element by "id" "literaturepanel", content contains "<journal>"
    And check element by "id" "literaturepanel", content contains "PubMed: <pubmed>"
    And in section "id" "literaturepanel", content contains multiple values: "<authors>"
    Examples:
      | pdbid  | title | pubmed | journal | authors |
      | 2RH1   | High resolution crystal structure of human B2-adrenergic G protein-coupled receptor. | 17962520 | (2007) Science 318: 1258-1265 | Cherezov,Rosenbaum,Hanson,Rasmussen,Thian,Kobilka,Choi,Kuhn,Weis,Kobilka,Stevens |

  Scenario Outline: NMR Structures (Solution & Solid State)
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And check element by "id" "Carousel-BiologicalUnit0", content contains "NMR Ensemble"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Method: <method>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "BMRB: <BMRB>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Selection Criteria: <selection_criteria>"
    And scroll to element "id" "macromoleculespanel"
    And check element by "id" "macromoleculespanel", content contains "Classification: <classification>"
    And scroll to element "id" "experimentaldata-validation"
    And check element by "id" "experimentaldatabottom", content contains "Method: <method>"
    Examples:
      | pdbid  | title | selection_criteria | classification | BMRB | method |
      | 2LV0       | Helix-35 Stem-loop from E. coli 23S rRNA | Target Function | RNA | 18549 | Solution NMR |
      | 2LXC       | complex between the Sgt2 homodimerization | Structures with the Lowest Energy | PROTEIN BINDING / PROTEIN BINDING | 18671 | Solution NMR |
      | 2M2W       | Ternary complex of ASFV Pol X with DNA and MgdGTP | Structures with the Lowest Energy | TRANSFERASE / DNA |  18935 | Solution NMR  |
      | 2MR3       | A subunit of 26S proteasome lid complex | Structures with the Lowest Energy |  HYDROLASE | 19219 | Solution NMR   |
      | 5IRT       | Dimerization interface of the noncrystalline HIV-1 capsid protein lattice | Structures with the Lowest Energy | VIRAL PROTEIN | 30035 | SOLID-STATE NMR  |

  Scenario Outline: Solution NMR / Solution Scattering Structures
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And check element by "id" "Carousel-BiologicalUnit0", content contains "NMR Ensemble"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Method: SOLUTION SCATTERING, SOLUTION NMR"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "BMRB: <BMRB>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Conformers Calculated: <conformers_calculated>"
    Examples:
      | pdbid  | title | conformers_calculated | BMRB |
      | 2N5T       | phosphoenolpyruvate-Enzyme I complex from the bacterial hosphotransferase system | 200 | 25731 |



  Scenario Outline: NMR Structures without BMRB link
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And check element by "id" "Carousel-BiologicalUnit0", content contains "NMR Ensemble"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Method: Solution NMR"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: <classification>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Selection Criteria: <selection_criteria>"
    And in section "id" "carousel-structuregallery", check element by "class" "active", content contains "Protein Symmetry: Asymmetric"
    And in section "id" "carousel-structuregallery", check element by "class" "active", content contains "Protein Stoichiometry: Monomer"
    Examples:
      | pdbid  | title | selection_criteria | classification |
      | 1G03       | NMR STRUCTURE OF N-TERMINAL DOMAIN OF HTLV-I CA1-134 | Structures with the Lowest Energy | Viral protein |
      | 2BKD       | STRUCTURE OF THE N-TERMINAL DOMAIN OF FRAGILE X MENTAL RETARDATION PROTEIN | Least Energy and Least Restraint Violation | NUCLEAR PROTEIN |


  Scenario Outline: EM Structures
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Method: ELECTRON MICROSCOPY"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "EMDataBank: <em_databank>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Resolution: <resolution>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Aggregation State: <aggregation_state>"
    Examples:
      | pdbid  | title | em_databank | resolution | aggregation_state |
      | 3IYD   | Three-dimensional EM structure of an intact activator-dependent transcription initiation complex | EMD-5127 | 19.8 | particle |


  Scenario Outline: EM / Solid State NMR Structures
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Method: ELECTRON MICROSCOPY, SOLID-STATE NMR"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: <classification>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "EMDataBank: <em_databank>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Conformers Calculated: <conformers_calculated>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "wwPDB Validation report is not available for this NMR entry."
    Examples:
      | pdbid  | title | classification | em_databank | conformers_calculated |
      | 2MME   | Hybrid structure of the Shigella flexneri MxiH Type three secretion system needle | PROTEIN TRANSPORT | EMD-5352 | 5000 |
      | 3ZPK   | quadruplet cross-beta amyloid fibril | PROTEIN FIBRIL | EMD-2323 EMD-2324 EMD-5590 | -- |


  Scenario Outline: Neutron Diffraction Structures
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: <classification>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Expression System: <expression_system>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Method: NEUTRON DIFFRACTION"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Currently <pdbid> does not have a wwPDB validation report."
    Examples:
      | pdbid  | title | classification | expression_system |
      | 4AR3   | perdeuterated Pyrococcus furiosus rubredoxin | ELECTRON TRANSPORT | ESCHERICHIA COLI |
      | 4Q49 | neutron crystal structure of apo human carbonic anhydrase | LYASE | Escherichia coli |


  Scenario Outline: X-Ray / Neutron Diffraction Structures
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: <classification>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Expression System: <expression_system>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Method: X-RAY DIFFRACTION, NEUTRON DIFFRACTION"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Currently <pdbid> does not have a wwPDB validation report."
    Examples:
      | pdbid  | title | classification | expression_system |
      | 4JEC   | per-deuterated HIV-1 protease in complex with clinical inhibitor amprenavir | HYDROLASE / HYDROLASE INHIBITOR | Escherichia coli |
      | 4PVM   | Neutron structure of human transthyretin (TTR) at room temperature | TRANSPORT PROTEIN | Escherichia coli |
      | 4NY6   | Neutron structure of leucine and valine methyl protonated type III antifreeze | ANTIFREEZE PROTEIN | Escherichia coli |


  Scenario Outline: Fiber Diffraction Structures
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: <classification>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Organism: <organism>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Method: FIBER DIFFRACTION"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Currently <pdbid> does not have a wwPDB validation report."
    Examples:
      | pdbid  | title | classification | organism |
      | 3PDM   | Hibiscus Latent Singapore virus | VIRUS | Hibiscus latent Singapore virus |


  Scenario Outline: Solution Scattering Structures
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: <classification>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Organism: <organism>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Method: SOLUTION SCATTERING"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Currently <pdbid> does not have a wwPDB validation report."
    Examples:
      | pdbid  | title | classification | organism |
      | 3K2S   | Solution structure of double super helix model | LIPID BINDING PROTEIN | Homo sapiens |
#      No images on the left side
      | 3IRL   | Solution Structure of Heparin dp36 | CARBOHYDRATE | Bos taurus |

  Scenario Outline: Electron Crystallography Structures
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: <classification>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Organism: <organism>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Method: ELECTRON CRYSTALLOGRAPHY"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "EMDataBank: <em_databank>"
    Examples:
      | pdbid  | title | classification | organism | em_databank |
      | 4UX1   | Cryo-EM structure of antagonist-bound E2P gastric H,K-ATPase | TRANSPORT PROTEIN | Sus scrofa | EMD-2759 |


  Scenario Outline: Large Structure - Ribosomes
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And check element by "id" "Carousel-BiologicalUnit1", content contains "Biological Assembly 1"
    And in section "id" "carousel-structuregallery", check element by "class" "active", content contains "View in 3D: NGL (in Browser)"
    And in section "id" "summary", check element by "class" "well" with index "0", content contains "Unique protein chains: <protein_chains>"
    And in section "id" "summary", check element by "class" "well" with index "0", content contains "Unique nucleic acid chains: <nucleic_acid_chains>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: Ribosome"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Method: <method>"
    And scroll to element "id" "macromoleculespanel"
    And check element by "id" "macromoleculespanel", content contains "Classification: Ribosome"
    Examples:
      | pdbid  | title | method | protein_chains | nucleic_acid_chains |
      | 4U26       | E. coli ribosome bound to dalfopristin and quinupristin | X-RAY DIFFRACTION  | 51 | 3 |
      | 4W2H       | Thermus thermophilus 70S ribosome in complex  | X-RAY DIFFRACTION | 49 | 6            |
      | 4U1U       | E. coli ribosome bound to quinupristin  | X-RAY DIFFRACTION | 51       | 3 |
      | 4V4X       | 70S Thermus thermophilus ribosome showing how the 16S  | X-RAY DIFFRACTION | 50 | 5 |

  Scenario Outline: Large Structure - Viruses Icosahedral
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "carousel-structuregallery", check element by "class" "active", content contains "View in 3D: NGL (in Browser)"
    And in section "id" "carousel-structuregallery", check element by "class" "active", content contains "Protein Symmetry: Icosahedral"
    And in section "id" "carousel-structuregallery", check element by "class" "active", content contains "<stoichiometry>"
    And in section "id" "summary", check element by "class" "well" with index "0", content contains "Unique protein chains: <protein_chains>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: Virus"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Method: <method>"
    And scroll to element "id" "literaturepanel"
    And check element by "id" "literaturepanel", content contains "<literature>"
    Examples:
      | pdbid | title | method | stoichiometry | protein_chains | literature |
      | 4RS5 | uncoating intermediate of a EV71 recombinant virus | X-RAY DIFFRACTION  | Hetero 180-mer - A60B60C60 | 3 | (2015) J.Biol.Chem. 290: 3198-3208 |
      | 4QYK | canine parvovirus variant | X-RAY DIFFRACTION  | Homo 60-mer - A60 | 1 | (2015) J.Virol. 89: 1909-1912 |
      | 4WM7 | Human Enterovirus D68 in Complex with Pleconaril | X-RAY DIFFRACTION  | Hetero 240-mer - A60B60C60D60 | 4 | (2015) Science 347: 71-74 |
      | 5IRE | The cryo-EM structure of Zika Virus | ELECTRON MICROSCOPY | Hetero 360-mer - A180B180 | 2  | (2016) Science 352: 467-470 |


  Scenario Outline: Other Large Structures
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: <classification>"
    And scroll to element "id" "experimentaldata-validation"
    And check element by "id" "experimentaldatabottom", content contains "Method: <method>"
    And scroll to element "id" "macromoleculespanel"
    And check element by "id" "macromoleculespanel", content contains "Classification: <classification>"
    Examples:
      | pdbid  | title | method | classification |
      | 1M4X       | PBCV-1 virus capsid, quasi-atomic model | ELECTRON MICROSCOPY | VIRUS |
      | 3J3Q       | Atomic-level structure of the entire HIV-1 capsid | ELECTRON MICROSCOPY | VIRUS |
      | 4V60       | The structure of rat liver vault | X-RAY DIFFRACTION | STRUCTURAL PROTEIN  |
      | 3J9K       | Dark apoptosome in complex with Dronc CARD domain | ELECTRON MICROSCOPY | APOPTOSIS |


  Scenario Outline: Structures with Multiple Biological Assemblies
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And add note: "Interacting with Image Carousel"
    And in section "id" "carousel-structuregallery", click on carousel arrow with "class" "left"
    And check element by "id" "Carousel-BiologicalUnit0", content contains "Asymmetric Unit"
    And in section "id" "carousel-structuregallery", click on carousel arrow with "class" "left"
    And check element by "id" "Carousel-BiologicalUnit<bioassembly_count>", content contains "Biological Assembly <bioassembly_count>"
    And in section "id" "carousel-structuregallery", click on carousel arrow with "class" "right"
    And check element by "id" "Carousel-BiologicalUnit0", content contains "Asymmetric Unit"
    Examples:
      | pdbid  | title | bioassembly_count |
      | 4V4D       | Pyrogallol-Phloroglucinol Transhydroxylase from Pelobacter acidigallici complexed with pyrogallol | 12 |
      | 5BT9       | FolM Alternative dihydrofolate reductase 1 | 5 |


  Scenario Outline: Trans-Membrane Structures
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "Carousel-TransmembraneUnit", content contains "Transmembrane View"
    And in section "id" "carousel-structuregallery", check element by "class" "active", content contains "transmembrane regions"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "Carousel-TransmembraneUnit", check image with "class" "mainImage" has source containing "<image_url>"
    And in section "id" "carousel-structuregallery", click on carousel arrow with "class" "right"
    And check element by "id" "Carousel-BiologicalUnit1", content contains "Biological Assembly 1"
    And scroll to element "id" "experimentaldata-validation"
    And check element by "id" "experimentaldatabottom", content contains "Method: <method>"
    Examples:
      | pdbid  | title | method | image_url |
      | 2XQ7 | PENTAMERIC LIGAND GATED ION CHANNEL GLIC IN COMPLEX WITH CADMIUM ION  | X-RAY DIFFRACTION | /hd/xq/2xq7/2xq7.0_chimera_tm_350_350.png |
      | 4AQ5 | Gating movement in acetylcholine receptor analysed by time-resolved | ELECTRON MICROSCOPY | hd/aq/4aq5/4aq5.0_chimera_tm_350_350.png |
      | 3ZKR | pentameric ligand gated ion channel from Erwinia chrysanthemi  | X-RAY DIFFRACTION |  /hd/zk/3zkr/3zkr.0_chimera_tm_350_350.png          |
      | 3J8H | Structure of the rabbit ryanodine receptor RyR1 in complex with FKBP12  | ELECTRON MICROSCOPY | /hd/j8/3j8h/3j8h.0_chimera_tm_350_350.png |
      | 1PRC | MODEL OF THE PHOTOSYNTHETIC REACTION CENTER FROM RHODOPSEUDOMONAS VIRIDIS | X-RAY DIFFRACTION | /hd/pr/1prc/1prc.0_chimera_tm_350_350.png |
      | 4QRY | pharaonis halorhodopsin in complex with bromide ion | X-RAY DIFFRACTION | /hd/qr/4qry/4qry.0_chimera_tm_350_350.png |



  Scenario Outline: Structures without Small Molecule Section
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And check "div" by "id" "ligandspanel" does not exist
    Examples:
      | pdbid | title |
      | 5DZL  | Crystal structure of the protein human CEACAM1 |


  Scenario Outline: Structures with Ligands
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And scroll to element "id" "ligandspanel"
    And in section "id" "LigandsTable", check table by index of "0", content contains "Ligands <ligands_count> Unique" in cell with row "0", column "0"
    And in section "id" "LigandsTable", check table by index of "0", content contains multiple values: "<multiple_ligands_name>"
    And in section "id" "LigandsTable", check table by index of "0", content contains multiple values: "<multiple_ligands_sym>"
    Examples:
      | pdbid  | title | ligands_count | multiple_ligands_sym | multiple_ligands_name |
      | 1RRV | TDP-vancosaminyltransferase GtfD as a complex with TDP | 4 | TYD,BGC,GOL,K | THYMIDINE-5'-DIPHOSPHATE,BETA-D-GLUCOSE,GLYCEROL,POTASSIUM ION |
      | 3RUN | glycopeptide antibiotic-target complexes | 8 | BGC,RER,TRS,MPD,MRD,PO4,IPA,CL | BETA-D-GLUCOSE,VANCOSAMINE,TRIS BUFFER,(4S)-2-METHYL-2,4-PENTANEDIOL |
      | 2MJQ | Structure of antimicrobial peptide anoplin in DPC micelles | 2 | DPV,UNX | UNKNOWN ATOM OR ION,dodecylphosphocholine  |
      | 4HHB | HUMAN DEOXYHAEMOGLOBIN AT 1.74 ANGSTROMS | 2 | HEM,PO4 | HEME,Phosphate Ion  |
      | 3X2Q | cyanide-bound bovine heart cytochrome c oxidase | 15 | CDL,TGL,HEA,PEK,PSC,PGV,DMU,CHD,CUA,ZN,CU,CYN,MG,NA,UNX | 3'-SN-GLYCEROL  |


  Scenario Outline: Structures with BIRDS
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "BIRDSTable", check table by index of "0", content contains "Biologically Interesting Molecules <birds_count> Unique" in cell with row "0", column "0"
    And in section "id" "BIRDSTable", check table by index of "0", content contains multiple values: "<multiple_birds_name>"
    And in section "id" "BIRDSTable", check table by index of "0", content contains multiple values: "<multiple_birds_sym>"
    Examples:
      | pdbid  | title | birds_count | multiple_birds_sym | multiple_birds_name |
      | 1RRV       | TDP-vancosaminyltransferase GtfD as a complex with TDP | 1 | PRD_000205  | DESVANCOSAMINYL |
      | 3RUN       | glycopeptide antibiotic-target complexes | 1 | PRD_000204 | VANCOMYCIN |


  Scenario Outline: Structures with Modified Residues
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "ModifiedResidueTable", check table by index of "0", content contains "Modified Residues <modified_residue_count> Unique" in cell with row "0", column "0"
    And in section "id" "ModifiedResidueTable", check table by index of "0", content contains multiple values: "<multiple_residue_name>"
    And in section "id" "ModifiedResidueTable", check table by index of "0", content contains multiple values: "<multiple_residue_sym>"
    Examples:
      | pdbid  | title | modified_residue_count | multiple_residue_sym | multiple_residue_name |
      | 3RUN       | glycopeptide antibiotic-target complexes | 2 | CCS,DAL  | L-PEPTIDE LINKING,D-PEPTIDE LINKING |
      | 2MJQ       | Structure of antimicrobial peptide anoplin in DPC micelles | 1 | NH2 | NON-POLYMER |

  Scenario Outline: Structures with only Nucleic Acids
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: <classification>"
    And in section "id" "summary", check element by "class" "well" with index "0", content contains "Unique nucleic acid chains: <nucleic_acid_chains>"
    And in section "id" "MacromoleculeTableDNA", check table by index of "0", content contains multiple values: "<macromolecule_name>"
    Examples:
      | pdbid  | title | classification | nucleic_acid_chains | macromolecule_name |
      | 2QWY   | SAM-II riboswitch bound to S-adenosylmethionine | RNA | 1 | SAM-II riboswitch |
      | 3GBI   | Self-Assembled Three-Dimensional DNA Crystal | DNA | 4 | DNA (5'-D(*GP*AP*GP*CP*AP*GP*CP*CP*TP*GP*TP*AP*CP*GP*GP*AP*CP*AP*TP*CP*A)-3'),DNA (5'-D(P*GP*GP*CP*TP*GP*C)-3') |
      | 3CE5   | human telomeric quadruplex in complex with a 3,6,9-trisubstituted acridine molecule BRACO19 | DNA | 1 | DNA (5'-D(*DTP*DAP*DGP*DGP*DGP*DTP*DTP*DAP*DGP*DGP*DGP*DT)-3') |
      | 3CGP   | pseudouridine-containing yeast spliceosomal U2 snRNA-intron | RNA | 2 | RNA (5'-R(*GP*CP*GP*CP*GP*(PSU)P*AP*GP*UP*AP*GP*C)-3'),RNA (5'-R(*CP*GP*CP*UP*AP*CP*UP*AP*AP*CP*GP*CP*G)-3') |


  Scenario Outline: DNA / Protein Complexes
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "summary", check element by "class" "well" with index "0", content contains "Unique protein chains: <protein_chains>"
    And in section "id" "summary", check element by "class" "well" with index "0", content contains "Unique nucleic acid chains: <nucleic_acid_chains>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "NDB: <ndb>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Method: <method>"
    Examples:
      | pdbid  | title | method | protein_chains | nucleic_acid_chains | ndb |
      | 1AOI       | COMPLEX BETWEEN NUCLEOSOME CORE PARTICLE (H3,H4,H2A,H2B) AND 146 BP LONG DNA FRAGMENT | X-RAY DIFFRACTION  | 4 | 1 | PD0001 |
      | 1J59       | CATABOLITE GENE ACTIVATOR PROTEIN (CAP)/DNA COMPLEX + ADENOSINE-3',5'-CYCLIC-MONOPHOSPHATE  | X-RAY DIFFRACTION | 1 | 2 | PD0299 |
      | 2M2W       | Ternary complex of ASFV Pol X with DNA and MgdGTP | SOLUTION NMR | 1  | 1 | 2M2W |



  Scenario Outline: Small Structures
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: <classification>"
    And scroll to element "id" "macromoleculespanel"
    And check element by "id" "macromoleculespanel", content contains "Total Structure Weight: <weight>"
    Examples:
      | pdbid  | title | classification | weight |
      | 4R0P   | Ifqins, an amyloid forming segment from human lysozyme spanning residues 56-61 | PROTEIN FIBRIL | 720.82 |
      | 1E9W   | macrocycle thiostrepton solved using the anomalous dispersive contribution from sulfur | ANTIBIOTIC | 1805.98 |
      | 4TUT   | Structure of a Prion peptide | MEMBRANE PROTEIN DE NOVO PROTEIN | 596.70 |
      | 4UBY   | Crystal structure of a polymorphic beta1 peptide | de novo protein membrane protein | 2258.53 |
      | 4W5M   | Prp peptide | de novo protein membrane protein | 1485.73 |
      | 1AO2   | cobalt(III)-deglycopepleomycin determined by NMR studies | INHIBITOR | 1199.23 |


  Scenario Outline: Favorite Structures Checked
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: <classification>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Method: <method>"
    Examples:
      | pdbid  | title | classification | method |
      | 1CGD   | HYDRATION STRUCTURE OF A COLLAGEN PEPTIDE | COLLAGEN | X-RAY DIFFRACTION |


#  NEED TO WORK ON
  Scenario Outline: Chimeric Protein (more than 1 Uniprot mapping per chain)
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: <classification>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "<organism>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Expression System: <expression_system>"
    Examples:
      | pdbid  | title | classification | organism | expression_system |
      | 5CGC   | Structure of the human class C GPCR metabotropic glutamate receptor 5 transmembrane | SIGNALING PROTEIN | Enterobacteria phage T4 sensu lato | Spodoptera frugiperda |


  Scenario Outline: No Protein Feature Views, only Nucleic Acids
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: <classification>"
    And in section "id" "summary", check element by "class" "well" with index "0", content contains "Unique nucleic acid chains: <nucleic_acid_chains>"
#    No Protein Feature Views Exist
    And check "tr" by "class" "ProteinFeatureViewRow" does not exist
    Examples:
      | pdbid  | title | classification | nucleic_acid_chains |
      | 279D   | CRYSTAL STRUCTURE OF THE SELF-COMPLEMENTARY 5'-PURINE START DECAMER D(GCGCGCGCGC) | DNA | 1 |


  Scenario Outline: Obsolete Structures Redirected
    Given connect to "http://www.rcsb.org/pdb/explore/explore.do?structureId=<pdbid>", redirected to "explore.do?structureId=<redirected_pdbid>"
    And check element by "id" "structureID", content contains "<redirected_pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Classification: <classification>"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "Entry <redirected_pdbid> supersedes"
    And in section "id" "summary", check element by "class" "col-md-8" with index "0", content contains "<pdbid>"
    Examples:
      | pdbid  | redirected_pdbid | title | classification |
      | 4RB5   | 4W2F             | Thermus thermophilus 70S ribosome in complex with amicoumacin, mRNA and three deacylated tRNAs | RIBOSOME / ANTIBIOTIC |
      | 3FFJ   | 3N04             | THE CRYSTAL STRUCTURE OF THE alpha-Glucosidase (FAMILY 31) FROM RUMINOCOCCUS OBEUM ATCC 29174 | HYDROLASE |

#  Using the Old Layout
  Scenario Outline: Obsolete Structure Page
    Given connect to "http://www.rcsb.org/pdb/explore/obsolete.do?obsoleteId=<pdbid>"
    And check element by "id" "se_pagetitle", content contains "<pdbid>"
    And check element by "class" "headerBox", content contains "<title>"
    And check element by "id" "se_structureSubtitle", content contains "Obsolete Structure Summary Page"
    And check element by "id" "content", content contains "<pdbid> was obsoleted on <obsoleted_date> and superseded by <superseded_pdbid>"
    Examples:
      | pdbid  | superseded_pdbid | obsoleted_date | title |
      | 4RB5   | 4W2F | 2014-12-10  | Thermus thermophilus 70S ribosome in complex with amicoumacin, mRNA and three deacylated tRNAs in the A, P and E sites|
      | 3FFJ   | 3N04  | 2010-06-23  | The crystal structure of the GLYCOSYL HYDROLASE (FAMILY 31) from Ruminococcus obeum ATCC 29174 |

  Scenario Outline: Sequence Cluster
    Given connect to "http://www.rcsb.org/pdb/explore/sequenceCluster.do?structureId=<pdbid>&entity=<entity>&seqid=<sequence_id>"
    And check element by "id" "structureID", content contains "<pdbid>"
    And check element by "id" "structureTitle", content contains "<title>"
    And in section "id" "main_content", check table by index of "<table_index>", content contains "Entity #<entity>" in cell with row "0", column "0"
    And in section "id" "main_content", check table by index of "<table_index>", content contains "Chains: <chains>" in cell with row "0", column "0"
    And in section "id" "main_content", check table by index of "<table_index>", content contains "<entity_name>" in cell with row "0", column "0"
    Examples:
      | pdbid  | title | entity | sequence_id | table_index | chains | entity_name |
      | 1IGT   | STRUCTURE OF IMMUNOGLOBULIN | 1 | 40 | 0 | A,C | IGG2A INTACT ANTIBODY - MAB231 protein |


#  Interaction with page
  Scenario: Using Image Carousel
  Scenario: Using Protein Feature View
  Scenario: Clicking on Gene View and directed to specific page
  Scenario: Downloading Primary Citation
  Scenario: Downloading File
  Scenario: Displaying Files
  Scenario: Traverse through Navigation tabs
