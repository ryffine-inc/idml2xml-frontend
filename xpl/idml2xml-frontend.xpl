<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
  xmlns:c="http://www.w3.org/ns/xproc-step" 
  xmlns:idml2xml="http://transpect.io/idml2xml"
  version="1.0">
  
  <p:documentation>
    Frontend pipeline which implements the idml2xml library. 
    This step takes an IDML file from InDesign and transform it 
    to Hub XML.
  </p:documentation>
  
  <p:output port="result"/>
  
  <p:serialization port="result" indent="true" omit-xml-declaration="false"/>
  
  <p:option name="idml"/>
  <p:option name="debug" select="'no'"/>
  <p:option name="debug-dir-uri" select="'yes'"/>
  <p:option name="status-dir-uri" select="'status'"/>
  <!-- RYFFINE: expose srcpaths so callers can request per-phrase source provenance
       (used by the heading-boundary post-process to detect Story boundaries).
       Defaults to 'no' so existing callers are unaffected. -->
  <p:option name="srcpaths" select="'no'"/>

  <p:import href="http://transpect.io/idml2xml/xpl/idml2hub.xpl"/>

  <idml2xml:hub name="idml2xml">
    <p:with-option name="idmlfile" select="$idml"/>
    <p:with-option name="debug" select="$debug"/>
    <p:with-option name="debug-dir-uri" select="$debug-dir-uri"/>
    <p:with-option name="status-dir-uri" select="$status-dir-uri"/>
    <p:with-option name="srcpaths" select="$srcpaths"/>
  </idml2xml:hub>
  
</p:declare-step>