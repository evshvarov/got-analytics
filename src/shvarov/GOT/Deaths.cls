Class shvarov.GOT.Deaths Extends %Library.Persistent [ Not Abstract, DdlAllowed, Not LegacyInstanceContext, ProcedureBlock ]
{

Property name As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 2 ];

Property allegiance As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 3 ];

Property season As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 4 ];

Property episode As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 5 ];

Property location As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 6 ];

Property killer As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 7 ];

Property killershouse As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 8, SqlFieldName = killers_house ];

Property method As %Library.String(MAXLEN = 250) [ SqlColumnNumber = 9 ];

Property deathno As %Library.Integer(MAXVAL = 2147483647, MINVAL = -2147483648) [ SqlColumnNumber = 10, SqlFieldName = death_no ];

ClassMethod ImportData(fn) As %Integer
{
	if $g(fn)="" set fn="/irisdev/app/data/game_of_thrones_deaths_collecti.csv"
    d ..Import(1,fn,",",,1,.rc)
	Quit rc
}

ClassMethod Import(pSelectMode As %Library.Integer = {$zu(115,5)}, pFileName As %Library.String(MAXLEN=""), pDelimiter As %String = ",", pQuote As %String = """", pHeaders As %Integer = 0, ByRef pRecordCount As %Integer) As %Library.Integer [ SqlProc ]
{
	set tStatementId = $SYSTEM.Util.CreateGUID(), tCounter = 0, pRecordCount = 0
	set tPreparedStatement = ##class(%SQL.DynamicStatement).Prepare(tStatementId,..#ROWTYPE,pDelimiter,pQuote,,,0,"CSV")
	if $Isobject(tPreparedStatement) {
		set tImporter = tPreparedStatement.%New(tPreparedStatement,,pFileName,pDelimiter,pQuote)
		if $Isobject(tImporter) {
			do ..%DeleteExtent(,.tDeleted,.tInstances,1)
				// burn the column headers
			for tPtr = 1:1:pHeaders { do tImporter.%Next() }
			while tImporter.%Next() {
				set tMe = ..%New()
				if 'pSelectMode {
					set tMe.name = tImporter.%GetData(1)
					set tMe.allegiance = tImporter.%GetData(2)
					set tMe.season = tImporter.%GetData(3)
					set tMe.episode = tImporter.%GetData(4)
					set tMe.location = tImporter.%GetData(5)
					set tMe.killer = tImporter.%GetData(6)
					set tMe.killershouse = tImporter.%GetData(7)
					set tMe.method = tImporter.%GetData(8)
					set tMe.deathno = tImporter.%GetData(9)
				}
				elseif pSelectMode = 1 {
					set tMe.name = $s('$system.CLS.IsMthd("nameOdbcToLogical"):tImporter.%GetData(1),1:tMe.nameOdbcToLogical(tImporter.%GetData(1)))
					set tMe.allegiance = $s('$system.CLS.IsMthd("allegianceOdbcToLogical"):tImporter.%GetData(2),1:tMe.allegianceOdbcToLogical(tImporter.%GetData(2)))
					set tMe.season = $s('$system.CLS.IsMthd("seasonOdbcToLogical"):tImporter.%GetData(3),1:tMe.seasonOdbcToLogical(tImporter.%GetData(3)))
					set tMe.episode = $s('$system.CLS.IsMthd("episodeOdbcToLogical"):tImporter.%GetData(4),1:tMe.episodeOdbcToLogical(tImporter.%GetData(4)))
					set tMe.location = $s('$system.CLS.IsMthd("locationOdbcToLogical"):tImporter.%GetData(5),1:tMe.locationOdbcToLogical(tImporter.%GetData(5)))
					set tMe.killer = $s('$system.CLS.IsMthd("killerOdbcToLogical"):tImporter.%GetData(6),1:tMe.killerOdbcToLogical(tImporter.%GetData(6)))
					set tMe.killershouse = $s('$system.CLS.IsMthd("killershouseOdbcToLogical"):tImporter.%GetData(7),1:tMe.killershouseOdbcToLogical(tImporter.%GetData(7)))
					set tMe.method = $s('$system.CLS.IsMthd("methodOdbcToLogical"):tImporter.%GetData(8),1:tMe.methodOdbcToLogical(tImporter.%GetData(8)))
					set tMe.deathno = $s('$system.CLS.IsMthd("deathnoOdbcToLogical"):tImporter.%GetData(9),1:tMe.deathnoOdbcToLogical(tImporter.%GetData(9)))
				}
				elseif pSelectMode = 2 {
					set tMe.name = $s('$system.CLS.IsMthd("nameDisplayToLogical"):tImporter.%GetData(1),1:tMe.nameDisplayToLogical(tImporter.%GetData(1)))
					set tMe.allegiance = $s('$system.CLS.IsMthd("allegianceDisplayToLogical"):tImporter.%GetData(2),1:tMe.allegianceDisplayToLogical(tImporter.%GetData(2)))
					set tMe.season = $s('$system.CLS.IsMthd("seasonDisplayToLogical"):tImporter.%GetData(3),1:tMe.seasonDisplayToLogical(tImporter.%GetData(3)))
					set tMe.episode = $s('$system.CLS.IsMthd("episodeDisplayToLogical"):tImporter.%GetData(4),1:tMe.episodeDisplayToLogical(tImporter.%GetData(4)))
					set tMe.location = $s('$system.CLS.IsMthd("locationDisplayToLogical"):tImporter.%GetData(5),1:tMe.locationDisplayToLogical(tImporter.%GetData(5)))
					set tMe.killer = $s('$system.CLS.IsMthd("killerDisplayToLogical"):tImporter.%GetData(6),1:tMe.killerDisplayToLogical(tImporter.%GetData(6)))
					set tMe.killershouse = $s('$system.CLS.IsMthd("killershouseDisplayToLogical"):tImporter.%GetData(7),1:tMe.killershouseDisplayToLogical(tImporter.%GetData(7)))
					set tMe.method = $s('$system.CLS.IsMthd("methodDisplayToLogical"):tImporter.%GetData(8),1:tMe.methodDisplayToLogical(tImporter.%GetData(8)))
					set tMe.deathno = $s('$system.CLS.IsMthd("deathnoDisplayToLogical"):tImporter.%GetData(9),1:tMe.deathnoDisplayToLogical(tImporter.%GetData(9)))
				}
				set tStatus = tMe.%Save()
				if $$$ISOK(tStatus) { set tCounter = tCounter + 1 }
				if $$$ISERR(tStatus) $$$ThrowStatus(tStatus)
			}
		}
	}
	set %sqlcontext.%SQLCODE = 0
	set %sqlcontext.%ROWCOUNT = tCounter
	set pRecordCount = tCounter
	quit tCounter
}

ClassMethod GrantSQLAccess() As %Status
{
     &sql(GRANT SELECT,UPDATE ON shvarov_GOT.Deaths,shvarov_GOT_BI_GOTDeaths.Listing TO UnknownUser)
	 if SQLCODE < 0 throw ##class(%Exception.SQL).CreateFromSQLCODE(%SQLCODE,"Grant roles")
     q $$$OK
}

Parameter ROWTYPE = "name VARCHAR(250),allegiance VARCHAR(250),season INTEGER,episode INTEGER,location VARCHAR(250),killer VARCHAR(250),killers_house VARCHAR(250),method VARCHAR(250),death_no INTEGER";

Storage Default
{
<Data name="DeathsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>allegiance</Value>
</Value>
<Value name="4">
<Value>season</Value>
</Value>
<Value name="5">
<Value>episode</Value>
</Value>
<Value name="6">
<Value>location</Value>
</Value>
<Value name="7">
<Value>killer</Value>
</Value>
<Value name="8">
<Value>killershouse</Value>
</Value>
<Value name="9">
<Value>method</Value>
</Value>
<Value name="10">
<Value>deathno</Value>
</Value>
</Data>
<DataLocation>^shvarov.GOT.DeathsD</DataLocation>
<DefaultData>DeathsDefaultData</DefaultData>
<IdLocation>^shvarov.GOT.DeathsD</IdLocation>
<IndexLocation>^shvarov.GOT.DeathsI</IndexLocation>
<StreamLocation>^shvarov.GOT.DeathsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
