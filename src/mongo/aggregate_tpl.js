// Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
// Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

db.{{collection}}_unwind.drop()
db.{{collection}}.aggregate([
    // Group all observations in a single array "observations"
    { $addFields: { observations: { $concatArrays: [ "$france", "$regions", "$departements"] }}},
    { $project: {
        _id: 0, // Remove _id to avoid duplicate keys
        france: 0, regions: 0, departements: 0, 
        nom: 0, unite: 0, unite_short: 0, trendType: 0 
    }},
    { $unwind: { path: "$observations" }},
    { $project: {
        _id: 0, // Remove _id to avoid duplicate keys
        "observations.last_value": 0, "observations.last_date": 0, 
        "observations.evol": 0, "observations.evol_percentage": 0, "observations.evol_color": 0
    }},  
    { $unwind: { path: "$observations.values" }},
   
    { $out: "{{collection}}_unwind" }
])
