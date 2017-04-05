Feature: BIRDS and Ligands for RCSB.org
# Using the most visited Ligand and BIRDs ids from Google Analytics

  Scenario: Ping Ligands REST Services
    Given connect to "http://rest.rcsb.org/rest/ligands/ping"
    And check HTML "body" element, content contains "RESTful Ligands Service is running."

  Scenario: Ping BIRDS REST Services
    Given connect to "http://rest.rcsb.org/rest/birds/ping"
    And check HTML "body" element, content contains "RESTful Birds Service is running."

  Scenario: Ping Drugs REST Services
    Given connect to "http://rest.rcsb.org/rest/drugs/ping"
    And check HTML "body" element, content contains "RESTful Drugs Service is running."

  Scenario: Ping Drug Targets REST Services
    Given connect to "http://rest.rcsb.org/rest/drugtargets/ping"
    And check HTML "body" element, content contains "RESTful Drug Targets service is running."

  @check_redirects @failing
  Scenario: Go to Sierra, gets redirected to www.rcsb.org production site
    Given connect to "http://www4.rcsb.org"
    And check, browser "url" contains "www.rcsb.org"

  @check_redirects @failing
  Scenario: Direct link from www.rcsb.org/ligand/BTN should be redirected to www4.rcsb.org/ligand/BTN
    Given connect to "http://www.rcsb.org/ligand/BTN"
    And check, browser "url" contains "www4.rcsb.org/ligand/BTN"

  @check_redirects
  Scenario: Click on static pages links in the footer
    Given connect to "http://www4.rcsb.org/ligand/XXC"
    And check, browser "url" contains "www4.rcsb.org/ligand/XXC"
    And in section "id" "footer_main", click on link with "text" "About Us"
    And check, browser "url" contains "http://www.rcsb.org/pdb/static.do?p=general_information/about_pdb/index.html"
    And go back
    And in section "id" "footer_main", click on link with "text" "Publications"
    And check, browser "url" contains "http://www.rcsb.org/pdb/static.do?p=general_information/news_publications/index.jsp"

  @check_redirects
  Scenario: Click on static pages links in the navigation - Download Submenu
    Given connect to "http://www4.rcsb.org/ligand/CXX"
    And check, browser "url" contains "www4.rcsb.org/ligand/CXX"
    And hover "Download" navigation, click on link with "href" "/pdb/download/download.do#Structures"
    And check, browser "url" contains "/pdb/download/download.do"

  @check_redirects
  Scenario Outline: Click on static pages links in the navigation
    Given connect to "http://www4.rcsb.org/ligand/CXX"
    And check, browser "url" contains "www4.rcsb.org/ligand/CXX"
    And hover "<nav>" navigation, click on link with "href" "<href>"
    And check, browser "url" contains "http://www.rcsb.org<href>"

    Examples:
      | nav   | href |
      | More  | /pdb/home/contactUs.do |
      | More  | /pdb/static.do?p=general_information/news_publications/index.jsp |
      | More  | /pdb/static.do?p=general_information/about_pdb/contact/pdb_members.html |
      | Download  | /pdb/static.do?p=download/ftp/index.html |

  @check_redirects
  Scenario Outline: Go from RCSB.org autosuggest to BTN Summary Page (www3)
    Given connect to "<url>"
    And check, browser "title" contains "RCSB Protein Data Bank"
    And check, browser "url" contains "<url>"
    And check element by "id" "CurrentStructureCount", value ">" "<structurecount>"
    And fill in text input "id" "autosearch_SearchBar" with "BTN"
    And wait for element "div" with "id" "autosearch_SearchBar_querySuggest" to appear
    And in section "id" "autosearch_SearchBar_querySuggest", click on link that containing text "BTN"
    And check, browser "url" contains "https://www3.rcsb.org/ligand/BTN"
    And check, browser "title" contains "RCSB PDB - Ligand Summary Page"
    And check HTML "h1" element, content contains "BTN"

    Examples:
      | url  | structurecount |
      | http://www.rcsb.org/       | 127350 |


  Scenario: Go to Sierra www.rcsb.org/ligand/BTN
    Given connect to "http://www4.rcsb.org/ligand/BTN"
    And check, browser "url" contains "www4.rcsb.org/ligand/BTN"


  Scenario Outline: Go to several Ligand Summary Page, click on ligand image
    Given connect to "http://www4.rcsb.org/ligand/<ligandid>"
    And click on image with "src" "//cdn.rcsb.org/images/ligands/<imageurl>-270.png"

    Examples:
      | ligandid  | imageurl |
      | CXX       | C/CXX/CXX |
      | NXX       | N/NXX/NXX |
      | XXC       | X/XXC/XXC |
      | XNZ       | X/XNZ/XNZ |
      | KZI       | K/KZI/KZI |

  Scenario Outline: Go to several Ligand Summary Page, check header section and view CIF file
    Given connect to "http://www4.rcsb.org/ligand/<ligandid>"
    And check, browser "url" contains "www4.rcsb.org/ligand/<ligandid>"
    And check HTML "h1" element, content contains "<ligandid>"
    And check element by "class" "col-md-4" with index "2", content contains "<name>"
    And click on button with "id" "downloadfiles"
    And click on link with "href" "//files.rcsb.org/ligands/view/<ligandid>.cif"

    Examples:
      | ligandid  | name |
      | HEM       | PROTOPORPHYRIN IX CONTAINING FE |
      | RET       | RETINAL                         |
      | LIG       | 3-PYRIDIN-4-YL-2,4-DIHYDRO-INDENO[1,2-.C.]PYRAZOLE |
      | SUC       | SUCROSE                                            |
      | TOP       | TRIMETHOPRIM                                       |
      | AZI       | AZIDE ION                                          |
      | GLC       | ALPHA-D-GLUCOSE                                    |

  Scenario Outline: Go to Ligand Summary Page, go to Ligand Depot page
    Given connect to "http://www4.rcsb.org/ligand/<ligandid>"
    And click on link with "href" "http://ligand-expo.rcsb.org/reports/<urlfragment>/index.html"
    And go to browser window with title: "Ligand Depot Graph Search Summary"
    And check, browser "url" contains "http://ligand-expo.rcsb.org/reports/<urlfragment>/index.html"
    And check, browser "title" contains "Ligand Depot Graph Search Summary"
    And wait for element "div" with "id" "myApp1_appletinfotablediv" to appear
    And close browser window with "url" contains "http://ligand-expo.rcsb.org/reports/<urlfragment>/index.html"

    Examples:
      | ligandid  | urlfragment |
      | HEM       | H/HEM |
      | SUC       | S/SUC |
      | RET       | R/RET |


  Scenario Outline: Check Header for BIRDS that are also ligands, single molecule entry
    Given connect to "http://www4.rcsb.org/bird/<birdsid>"
    And check, browser "url" contains "www4.rcsb.org/bird/<birdsid>"
    And click on image with "src" "//cdn.rcsb.org/images/ligands/<imageurl>/<ligandid>-270.png"
    And check HTML "h1" element, content contains "<ligandid>/<birdsid>"
    And in section "id" "maincontentcontainer", check element by "class" "col-md-4" with index "2", content contains "<name>"
    And in section "id" "maincontentcontainer", check element by "class" "col-md-4" with index "2", content contains "single molecule entry"
    And click on button with "id" "downloadfiles"
    And click on link with "href" "//files.rcsb.org/ligands/view/<ligandid>_ideal.sdf"
    And go back
    And click on button with "id" "downloadfiles"
    And click on link with "href" "//files.rcsb.org/birds/view/<birdsid>.cif"
    And go back
    And click on button with "id" "downloadfiles"
    And click on link with "href" "//files.rcsb.org/ligands/view/<ligandid>.cif"

    Examples:
      | birdsid     | ligandid    | imageurl | name  |
      | PRD_000803  | EEA         | E/EEA   | N-{3-[3-(3'-chlorobiphenyl-4-yl)isoxazol-5-yl]propanoyl}-L-alpha-glutamyl-L-alpha-glutamyl-amide |
      | PRD_000830  | R47         | R/R47    | N-[(2S)-3-[(S)-(4-bromophenyl)(hydroxy)phosphoryl]-2-{[3-(3'-chlorobiphenyl-4-yl)-1,2-oxazol-5-yl]methyl}propanoyl]-L-alpha-glutamyl-L-alpha-glutamine  |


  Scenario Outline: Check Header for BIRDS that is a polymer entry
    Given connect to "http://www4.rcsb.org/bird/<birdsid>"
    And check, browser "url" contains "www4.rcsb.org/bird/<birdsid>"
    And click on image with "src" "//cdn.rcsb.org/images/birds/<birdsid>-270.png"
    And check HTML "h1" element, content contains "<birdsid>"
    And in section "id" "maincontentcontainer", check element by "class" "col-md-4" with index "2", content contains "<name>"
    And in section "id" "maincontentcontainer", check element by "class" "col-md-4" with index "2", content contains "polymer entry"
    And click on button with "id" "downloadfiles"
    And click on link with "href" "//files.rcsb.org/birds/view/<birdsid>.cif"
    And go back
    And click on button with "id" "downloadfiles"
    And click on link with "href" "//files.rcsb.org/birds/view/<birdsid_cc>.cif"

    Examples:
      | birdsid     | birdsid_cc | name  |
      | PRD_000771  | PRDCC_000771 | Peptide aldehyde inhibitor Ac-NSTSQ-H |
      | PRD_000810  | PRDCC_000810 | 3-(1-benzothiophen-2-yl)propanoyl-derivatized DPPLHSpTA peptide |


  Scenario Outline: Check Chemical Component Summary Table on BIRDS Summary Page
    Given connect to "http://www4.rcsb.org/bird/<birdsid>"
    And check, browser "url" contains "www4.rcsb.org/bird/<birdsid>"
    And check HTML "h1" element, content contains "<fullname>"
    And check table by "class" "table-ligandsummary", content contains "<name>" in cell with row "1", column "1"

    Examples:
      | birdsid     | fullname          | name  |
      | PRD_000803  | EEA/PRD_000803    | N-{3-[3-(3'-chlorobiphenyl-4-yl)isoxazol-5-yl]propanoyl}-L-alpha-glutamyl-L-alpha-glutamyl-amide |
      | PRD_000771  | PRD_000771    | Peptide aldehyde inhibitor Ac-NSTSQ-H |
      | PRD_000810  | PRD_000810        | 3-(1-benzothiophen-2-yl)propanoyl-derivatized DPPLHSpTA peptide |
      | PRD_000246  | PRD_000246        | N~2~-acetyl-N~5~-[amino(iminio)methyl]-L-ornithyl-L-alpha-glutamyl-N-[(1S)-5-amino-1-(chloroacetyl)pentyl]-N~5~- [amino(iminio)methyl]-L-ornithinamide |
      | PRD_000771  | PRD_000771        | Peptide aldehyde inhibitor Ac-NSTSQ-H |
      | PRD_000830  | R47/PRD_000830    | N-[(2S)-3-[(S)-(4-bromophenyl)(hydroxy)phosphoryl]-2-{[3-(3'-chlorobiphenyl-4-yl)-1,2-oxazol-5-yl]methyl}propanoyl]-L-alpha-glutamyl-L-alpha-glutamine  |

  Scenario Outline: Check Drug Summary Table on BIRDS/Ligands Summary Page
    Given connect to "http://www4.rcsb.org/<type>/<id>"
    And check HTML "h1" element, content contains "<id>"
    And check table by index of "2", content contains "<drug>" in cell with row "1", column "1"

    Examples:
      | type    | id            | drug        |
      | bird    | PRD_000803    | none        |
      | ligand  | DIF           | Diclofenac  |
      | ligand  | 001           | FKB-001  |
      | ligand  | NXX           | Deamido-Nad+  |
      | ligand  | XXC           | none  |
      | bird    | PRD_000771    | none        |

  Scenario Outline: Check Drug Targets Table on BIRDS/Ligands Summary Page
    Given connect to "http://www4.rcsb.org/<type>/<id>"
    And check table by "id" "LigandsDrugTargetTable", content contains "<drugtarget>" in cell with row "1", column "0"
    Examples:
      | type    | id            | drugtarget        |
      | ligand  | DIF           | Sodium channel protein type 4 subunit alpha        |
      | ligand  | 001           | Peptidyl-prolyl cis-trans isomerase FKBP1A        |
      | ligand  | NXX           | Nicotinate-nucleotide adenylyltransferase        |
      | ligand  | XXC           | none        |
      | ligand  | KZI           | none        |
      | ligand  | B41           | Sodium-dependent dopamine transporter |
