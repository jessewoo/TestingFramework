# Elements COMMON on all Structure Summary Page
module StructurePageCommon
  include PageObject
      
  # Structure Summary Navigation        
  link(:tab_structure, :id => "structuresummarytab")
	link(:tab_3d, :id => "3dviewtab")
	link(:tab_annotations, :id => "macromoleculetab")
	link(:tab_sequence, :id => "MoreOptions-SequenceDisplay")
	link(:tab_sequencesimilarity, :id => "MoreOptions-SequenceSimilarity")
	link(:tab_structuresimilarity, :id => "MoreOptions-StructureSimilarity")
	link(:tab_experiment, :id => "MoreOptions-Method")
	link(:tab_literature, :id => "MoreOptions-DataMentions")    

	h1(:structure_pdbid, :id => 'structureID')
  h4(:structure_title, :id => 'structureTitle')

end