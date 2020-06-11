/// 
Class shvarov.GOT.BI.GOTDeaths Extends %DeepSee.CubeDefinition [ DependsOn = shvarov.GOT.Deaths, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="GOTDeaths" displayName="GOTDeaths" disabled="false" abstract="false" sourceClass="shvarov.GOT.Deaths" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="killershouse" disabled="false" hasAll="false" allCaption="All killershouse" allDisplayName="killershouse" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="killershouse" disabled="false" sourceProperty="killershouse" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="killer1" disabled="false" hasAll="false" allCaption="All killer1" allDisplayName="killer1" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="killer" disabled="false" sourceProperty="killer" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="location" disabled="false" hasAll="false" allCaption="All location" allDisplayName="location" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="location" disabled="false" sourceProperty="location" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="method" disabled="false" hasAll="false" allCaption="All method" allDisplayName="method" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="method" disabled="false" sourceProperty="method" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="season" disabled="false" hasAll="false" allCaption="All season" allDisplayName="season" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="season" disabled="false" sourceExpression="&quot;S&quot;_%source.season" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="6">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="allegiance" disabled="false" hasAll="false" allCaption="All allegiance" allDisplayName="allegiance" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="allegiance" disabled="false" sourceProperty="allegiance" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="7">
      </level>
    </hierarchy>
  </dimension>
  <listing name="New_listing1" disabled="false" listingType="table" fieldList="name,allegiance,death_no,episode,killer,killers_house,location,method,season">
  </listing>
</cube>
}

Parameter DOMAIN;

}
