Class shvarov.csvtest
{

ClassMethod Run() As %Status
{
    set fn="/irisdev/app/data/game_of_thrones_deaths_collecti.csv"
    set status=##class(community.csvgen).Generate(fn,",",1,,.tResults)
    return status
}

}
