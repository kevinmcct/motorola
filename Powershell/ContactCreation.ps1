$file = "C:\Temp\MFF-Contacts.txt"
$Prefix = "MF"
Add-Content -Path $file -Value '<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<config>
  <category name="PCRContacts">'
For($i=0; $i -lt 201; $i++){
  $ContactNumber = $i.ToString("000")
  Add-Content -Path $file -Value "    <set name=&PCRContacts& alias=&$($Prefix)$($ContactNumber)&>
      <field name=&ContactName&>$($Prefix)$($ContactNumber)</field>
      <collection name=&MDCCalls& />
      <collection name=&QuikCallIICalls& />
      <collection name=&DigitalCalls&>
        <set name=&DigitalCalls& index=&0& key=&Private Call&>
          <field name=&DU_CALLALIAS&>$($Prefix)$($ContactNumber)</field>
          <field name=&DU_CALLLSTID&>1$($ContactNumber)</field>
          <field name=&DU_ROUTETYPE&>Regular</field>
          <field name=&DU_CALLPRCDTNEN&>Yes</field>
          <field name=&DU_RINGTYPE&>No Style</field>
          <field name=&DU_TXTMSGALTTNTP&>Repetitive</field>
          <field name=&DU_CALLTYPE&>Private Call</field>
          <field name=&DU_OVCMCALL&>No</field>
          <field name=&DU_CALLTYPEPART2&>0</field>
          <field name=&DU_UKPOTCFLG&>No</field>
          <field name=&DU_RVRTPERS_Zone&>None</field>
          <field name=&DU_RVRTPERS&>Selected</field>
          <field name=&CallType&>Digital Calls-Private Call</field>
          <field name=&PeudoCallId&>1$($ContactNumber)</field>
        </set>
      </collection>
      <collection name=&CapacityPlusCalls& />
      <collection name=&PhoneCalls& />
      <field name=&Comments&></field>
    </set>"
}
Add-Content -Path $file -Value '  </category>
</config>'
$XML = Get-Content $file
$QuotesReplaced = $XML.Replace('&','"')
Set-Content -Path $file -Value $QuotesReplaced
