# RDF Dataset of the COVID-19 pandemic statistics in France

The [COVID-19 France dashboard](https://dashboard.covid19.data.gouv.fr/vue-d-ensemble?location=FRA) provides consolidated data and visualization tools of statistics about the COVID-19 pandemic in France.
Additionally, all raw data files are available [for download](https://data.widgets.dashboard.covid19.data.gouv.fr/).

The [Wimmics team](https://team.inria.fr/wimmics/) and [I3S laboratory](http://www.i3s.unice.fr/) ([University Côte d'Azur](https://univ-cotedazur.eu/), [CNRS](https://www.cnrs.fr), [Inria](https://www.inria.fr)) provide an [RDF](https://en.wikipedia.org/wiki/Resource_Description_Framework) representation of these data, comprising the daily numbers of confirmed cases, hospitalized cases, cases in intensive care, and propagation of virus mutations.
Granularity includes national, regional and departmental levels.

### SPARQL Querying

The RDF dataset is published on our Virtuoso OS SPARQL endpoint: https://covidontheweb.inria.fr/sparql, as named graph `http://ns.inria.fr/covid19/graph/datagouvfr`. It is updated daily.

As an example, you can look up the announcement http://ns.inria.fr/covid19/datagouvfr/announcement/2021-09-01/dep/75 concerning Paris (department 75) on Sept. 1st 2021, or [submit the SPARQL query below](https://covidontheweb.inria.fr/sparql?default-graph-uri=&query=select%20*%20from%20%3Chttp%3A%2F%2Fns.inria.fr%2Fcovid19%2Fdatagouvfr%2Fgraph%3E%0Awhere%20%7B%0A%20%20%20%20%3Fa%20%20a%20schema%3ASpecialAnnouncement%3B%0A%20%20%20%20%20%20%20%20schema%3AdatePosted%20%3Fdate%3B%0A%20%20%20%20%20%20%20%20schema%3AspatialCoverage%20%5B%0A%20%20%20%20%20%20%20%20%20%20%20%20a%20%20%20%20%20%20%20%20%20%20%20%20%20wd%3AQ6465%3B%20%23%20department%0A%20%20%20%20%20%20%20%20%20%20%20%20wdt%3AP2586%20%20%20%20%20%2275%22%3B%0A%20%20%20%20%20%20%20%20%5D%3B%0A%20%20%20%20%20%20%20%20schema%3AdiseaseSpreadStatistics%20%5B%0A%20%20%20%20%20%20%20%20%20%20%20%20rdfs%3Alabel%20%20%20%20%20%20%20%20%20%20%20%20%20%20%3FstatLabel%3B%0A%20%20%20%20%20%20%20%20%20%20%20%20schema%3AmeasuredValue%20%20%20%20%3FstatVal%3B%0A%20%20%20%20%20%20%20%20%20%20%20%20schema%3AmeasuredProperty%20%3FstatProp%0A%20%20%20%20%20%20%20%20%5D.%0A%7D%20order%20by%20desc(%3Fdate)&should-sponge=&format=text%2Fhtml&timeout=0&debug=on&run=+Run+Query+) that retrieves all announcements for Paris:

```sparql
select * from <http://ns.inria.fr/covid19/datagouvfr/graph>
where {
    ?a  a schema:SpecialAnnouncement;
        schema:datePosted ?date;
        schema:spatialCoverage [
            a             wd:Q6465; # department
            wdt:P2586     "75";
        ];
        schema:diseaseSpreadStatistics [
            rdfs:label              ?statLabel;
            schema:measuredValue    ?statVal;
            schema:measuredProperty ?statProp
        ].
} order by desc(?date)
```

For a visual exploration, check the associated example [Jupiter Notebook](jupyter_notebok_example.ipynb).


### RDF Data Modeling

The RDF representation is based on the [Schema.org extention](http://blog.schema.org/2020/03/schema-for-coronavirus-special.html) defined for the case of the COVID-19 pandemic.

Each daily report is an announcement ([`schema:SpecialAnnouncement`](https://schema.org/SpecialAnnouncement)) that has:
- a date ([`schema:datePosted`](https://schema.org/datePosted));
- a geographic zone where the figures apply (`schema:spatialCoverage`), whose type is one of [`schema:State`](http://schema.org/State]) and Wikidata entities [region of France](http://www.wikidata.org/entity/Q36784), [department of France](http://www.wikidata.org/entity/Q6465) or [French overseas collectivity](http://www.wikidata.org/entity/Q719487);
- a set of statistics ([`schema:diseaseSpreadStatistics`](https://schema.org/diseaseSpreadStatistics)) that are [`schema:Observation`](https://schema.org/Observation)'s reporting the numbers of cases (confirmed, hospitalized, in intensive care) and the propagation of mutations.


### Data Transformation

The _COVID-19 France dashboard_ raw provides the data as a set of JSON files updated daily.

The translation in RDF is carried out using [Morph-xR2RML](https://github.com/frmichel/morph-xr2rml/), an implementation of the [xR2RML mapping language](http://i3s.unice.fr/~fmichel/xr2rml_specification.html) [1] for MongoDB databases.
We have set up an automated process to invoke this service daily and update the graph in our SPARQL endpoint.

All scripts, configuration and mapping files are provided in directory [src](src).


## License

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />

The RDF dataset is licensed under the <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.

The code used to produce the dataset, provided in folder src, is licensed under the [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).


## References

[1] F. Michel, L. Djimenou, C. Faron-Zucker, and J. Montagnat. Translation of Relational and Non-Relational Databases into RDF with xR2RML.
In Proceedings of the *11th International Confenrence on Web Information Systems and Technologies (WEBIST 2015)*, Lisbon, Portugal, 2015.

