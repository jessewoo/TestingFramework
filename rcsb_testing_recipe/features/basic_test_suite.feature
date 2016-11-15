Feature: Basic Test Suite for RCSB.org
     
  Scenario: Homepage Header Check
    Given connect to "http://www.rcsb.org"
    And check, browser "title" contains "RCSB Protein Data Bank - RCSB PDB"
    And check, browser "url" contains "http://www.rcsb.org/pdb/home/home.do"
    And check element by "id" "CurrentStructureCount", value ">" "123456"

  Scenario: Homepage Panel Slides Check
    Given connect to "http://www.rcsb.org"
    And in section "id" "homepage_panelslides", click on link with "href" "#Category-search"
    And check element by "id" "search_drilldown_panel", content contains "Explore the PDB Archive"
    And in section "id" "homepage_panelslides", click on link with "href" "#Subcategory-search_sequences"
    And check element by "id" "search_sequences_panel", content contains "Search by Sequences"
    And in section "id" "homepage_panelslides", click on link with "href" "#Category-analyze"
    And check element by "id" "analyze_sequences_panel", content contains "Sequence & Structure Alignment"
    And in section "id" "homepage_panelslides", click on link with "href" "#Category-deposit"
    And check element by "id" "deposit_prepare_panel", content contains "Deposition Preparation Tools"

  Scenario: Homepage Welcome Panel Directed to MOTM Page
    Given connect to "http://www.rcsb.org"
    And check element by "id" "welcome_rcsb_panel", content contains "A Structural View of Biology"
    And click on image with "alt" "RCSB PDB Molecule of the Month"
    And check, browser "url" contains "http://pdb101.rcsb.org/motm"

  Scenario: Homepage Search Panel Drilldown
    Given connect to "http://www.rcsb.org"
    And in section "id" "homepage_panelslides", click on link with "href" "#Category-search"
    And check element by "id" "search_drilldown_panel", content contains "Explore the PDB Archive"
    And in section "id" "drilldown_options", click on element with "text" "Taxonomy" using onclick-JS
    And in section "id" "drilldown_options", click on element with "text" "Polymer Type" using onclick-JS
    And in section "id" "drilldown_options", click on element with "text" "Release Date" using onclick-JS
    And in section "id" "drilldown_options", click on element with "text" "Organism" using onclick-JS
    And in section "id" "drilldown_results", click on link that containing text "Homo sapiens"
    And check, browser "title" contains "RCSB PDB - Search Results"
    And check, browser "url" contains "results/results.do"
    And check element by "id" "SearchParameterText", content contains "Homo sapiens"
 
  Scenario: Homepage Middle Section Check
    Given connect to "http://www.rcsb.org"
    And check element by "id" "lateststructure", content contains "Latest Entries"
    And check element by "id" "seeAllStructures", content contains "Tuesday"
    And check element by "id" "news", content contains "News"
    And check element by "id" "newfeatures", content contains "Features & Highlights"

  Scenario: Homepage Statistics Check
    Given connect to "http://www.rcsb.org"
    And check element by "id" "footer_statistics", content contains "PDB at a Glance"
    And check element by "href" "/pdb/browse/uniprot.do?hasPDB=true", value ">" "38000"
    And in section "id" "footer_statistics", click on link with "href" "/pdb/browse/uniprot.do?hasPDB=true"
    And check, browser "title" contains "RCSB PDB - Browse UniProt Entries"

  Scenario: Homepage Footer Check
    Given connect to "http://www.rcsb.org"
    And in section "id" "footer_main", click on link with "text" "About Us"
    And check, browser "url" contains "/about_pdb/index.html"
    And go back
    And in section "id" "footer_main", click on link with "text" "Publications"
    And check, browser "url" contains "news_publications/index.jsp"

  Scenario: Search Results For All Structures
    Given connect to "http://www.rcsb.org"
    And check element by "id" "CurrentStructureCount", value ">" "123456"
    And in section "id" "header", click on link with "id" "CurrentStructureCount"
    And check element by "id" "SearchParameterText", content contains "Holdings : All Structures"

  Scenario: Advanced Search
    Given connect to "http://www.rcsb.org"
    And in section "id" "header", click on link with "text" "Advanced Search"
    And check, browser "title" contains "RCSB PDB - Advanced Search"
    And select option with "value" "StructureIdQuery" in dropdown with "id" "smartSearchSubtype_0"
    And wait for element "td" with "class" "smartMain" to appear
    And fill in text input "name" "structureIdList_0" with "4hhb, 1stp"
    And click on button with "id" "doSearch"
    And check element by "id" "SearchParameterText", content contains "4hhb, 1stp"

  Scenario: Search Results for Text
    Given connect to "http://www.rcsb.org"
    And fill in text input "id" "autosearch_SearchBar" with "Collagen"
    And click on button with "id" "searchbutton"
    And check, browser "title" contains "RCSB PDB - Search Results"
    And check, browser "url" contains "results/results.do"
    And check element by "id" "SearchParameterText", content contains "Collagen"
    And fill in text input "id" "autosearch_SearchBar" with "HIV"
    And click on button with "id" "searchbutton"
    And check element by "id" "SearchParameterText", content contains "HIV"

  Scenario: Structure Summary Page
    Given connect to "http://www.rcsb.org"
    And search for "1STP"
    And check, browser "url" contains "explore/explore.do"
    And check element by "id" "Carousel-BiologicalUnit1", content contains "Biological Assembly 1"
    And in section "id" "carousel-structuregallery", click on link with "class" "right"
    And in section "id" "carousel-structuregallery", click on link with "class" "right"
    And check element by "id" "structureID", content contains "1STP"
    And check element by "id" "structureTitle", content contains "BINDING TO STREPTAVIDIN"
    And click on button with "text" "Download Primary Citation"
    And scroll to element "id" "literaturepanel"
    And in section "id" "literaturepanel", click on link with "text" "Download Endnote"
    And scroll to element "id" "macromoleculespanel"
    And check element by "id" "macromoleculespanel", content contains "biotin binding protein"
    And click on button with "id" "togglePFV"
    And check element by "class" "macromoleculeRow", content contains "Streptavidin"
    And scroll to element "id" "ligandspanel"
    And check element by "id" "ligandspanel", content contains "Small Molecules"
    And scroll to element "id" "experimentaldata-validation"
    And check element by "id" "experimentaldata-validation", content contains "Experimental Data & Validation"
    And check element by "id" "experimentaldatabottom", content contains "X-Ray Diffraction"
    And scroll to element "id" "structuretabs"

  Scenario: Structure Summary Page Tabs
    Given connect to "http://www.rcsb.org"
    And search for "3J3Q"
    And in section "id" "structuretabs", click on link with "text" "3D View"
    And check, browser "title" contains "NGL Viewer for 3J3Q"
    And check, browser "url" contains "ngl/ngl.do"
    And take screenshot of "3J3Q"
    And in section "id" "structuretabs", click on link with "text" "Annotations"
    And check, browser "title" contains "Macromolecules Report Page"
    And check, browser "url" contains "explore/macroMoleculeData.do"
    And in section "id" "structuretabs", click on link with "text" "Sequence"
    And check, browser "title" contains "Remediated Sequence"
    And check, browser "url" contains "explore/remediatedSequence.do"
    And in section "id" "structuretabs", click on link with "text" "Sequence Similarity"
    And check, browser "title" contains "Sequence Similarity"
    And check, browser "url" contains "explore/sequenceCluster.do"
    And in section "id" "structuretabs", click on link with "text" "Structure Similarity"
    And check, browser "title" contains "Structure Cluster"
    And check, browser "url" contains "explore/structureCluster.do"
    And in section "id" "structuretabs", click on link with "text" "Experiment"
    And check, browser "title" contains "Methods Report Page"
    And check, browser "url" contains "explore/materialsAndMethods.do"

  Scenario: Navigation and Download Structures
    Given connect to "http://www.rcsb.org"
    And hover "Download" navigation, click on link with "href" "/pdb/download/download.do#Structures"
    And fill in text input "id" "structureIdList" with "4hhb, 1stp"
    And in section "id" "download_structures_panel", checkbox with "name" "doPdb", mark as "checked"
    And in section "id" "download_structures_panel", select radio button with "name" "compressed"
    And in section "id" "download_structures_panel", click on button with "class" "btn-primary"



