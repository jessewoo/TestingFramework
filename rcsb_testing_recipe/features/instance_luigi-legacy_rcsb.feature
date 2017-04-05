Feature: Instance Luigi Setup for Legacy RCSB site

  Background:
    Given connect to "ENV['URL']"

  Scenario: Precondition Check
    Given connect to domain: "ENV['URL']", with specific page: "pdb/status.do"
    And check HTML "body" element, content contains "Status : Available"

  Scenario: Homepage Header Check
    And check, browser "title" contains "RCSB Protein Data Bank"
    And check, browser "url" contains "/pdb/home/home.do"
    And check element by "id" "CurrentStructureCount", value ">" "123456"