// Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
// Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

db.confirmed_unwind.drop()
db.confirmed.aggregate([
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
   
    { $out: "confirmed_unwind" }
])

db.deaths_unwind.drop()
db.deaths.aggregate([
    // Group all observations in a single array "observations"
    { $addFields: { observations: { $concatArrays: [ "$france", "$regions", "$departements"] }}},
    { $project: {
        // Remove _id to avoid duplicate keys
        _id: 0,
        france: 0, regions: 0, departements: 0, 
        nom: 0, unite: 0, unite_short: 0, trendType: 0
    }},
    { $unwind: { path: "$observations" }},
    { $project: {
        // Remove _id to avoid duplicate keys
        _id: 0,
        "observations.last_value": 0, "observations.last_date": 0, 
        "observations.evol": 0, "observations.evol_percentage": 0, "observations.evol_color": 0
    }},  
    { $unwind: { path: "$observations.values" }},
    { $out: "deaths_unwind" }
])

db.hospitalized_unwind.drop()
db.hospitalized.aggregate([
    // Group all observations in a single array "observations"
    { $addFields: { observations: { $concatArrays: [ "$france", "$regions", "$departements"] }}},
    { $project: {
        // Remove _id to avoid duplicate keys
        _id: 0,
        france: 0, regions: 0, departements: 0, 
        nom: 0, unite: 0, unite_short: 0, trendType: 0
    }},
    { $unwind: { path: "$observations" }},
    { $project: {
        // Remove _id to avoid duplicate keys
        _id: 0,
        "observations.last_value": 0, "observations.last_date": 0, 
        "observations.evol": 0, "observations.evol_percentage": 0, "observations.evol_color": 0
    }},  
    { $unwind: { path: "$observations.values" }},
    { $out: "hospitalized_unwind" }
])

db.intensive_care_unwind.drop()
db.intensive_care.aggregate([
    // Group all observations in a single array "observations"
    { $addFields: { observations: { $concatArrays: [ "$france", "$regions", "$departements"] }}},
    { $project: {
        // Remove _id to avoid duplicate keys
        _id: 0,
        france: 0, regions: 0, departements: 0, 
        nom: 0, unite: 0, unite_short: 0, trendType: 0
    }},
    { $unwind: { path: "$observations" }},
    { $project: {
        // Remove _id to avoid duplicate keys
        _id: 0,
        "observations.last_value": 0, "observations.last_date": 0, 
        "observations.evol": 0, "observations.evol_percentage": 0, "observations.evol_color": 0
    }},  
    { $unwind: { path: "$observations.values" }},
    { $out: "intensive_care_unwind" }
])



db.prop_variant_A_unwind.drop()
db.prop_variant_A.aggregate([
    // Group all observations in a single array "observations"
    { $addFields: { observations: { $concatArrays: [ "$france", "$regions", "$departements"] }}},
    { $project: {
        // Remove _id to avoid duplicate keys
        _id: 0,
        france: 0, regions: 0, departements: 0, 
        nom: 0, unite: 0, unite_short: 0, trendType: 0
    }},
    { $unwind: { path: "$observations" }},
    { $project: {
        // Remove _id to avoid duplicate keys
        _id: 0,
        "observations.last_value": 0, "observations.last_date": 0, 
        "observations.evol": 0, "observations.evol_percentage": 0, "observations.evol_color": 0
    }},  
    { $unwind: { path: "$observations.values" }},
    { $out: "prop_variant_A_unwind" }
])

db.prop_variant_B_unwind.drop()
db.prop_variant_B.aggregate([
    // Group all observations in a single array "observations"
    { $addFields: { observations: { $concatArrays: [ "$france", "$regions", "$departements"] }}},
    { $project: {
        // Remove _id to avoid duplicate keys
        _id: 0,
        france: 0, regions: 0, departements: 0, 
        nom: 0, unite: 0, unite_short: 0, trendType: 0
    }},
    { $unwind: { path: "$observations" }},
    { $project: {
        // Remove _id to avoid duplicate keys
        _id: 0,
        "observations.last_value": 0, "observations.last_date": 0, 
        "observations.evol": 0, "observations.evol_percentage": 0, "observations.evol_color": 0
    }},  
    { $unwind: { path: "$observations.values" }},
    { $out: "prop_variant_B_unwind" }
])

db.prop_variant_C_unwind.drop()
db.prop_variant_C.aggregate([
    // Group all observations in a single array "observations"
    { $addFields: { observations: { $concatArrays: [ "$france", "$regions", "$departements"] }}},
    { $project: {
        // Remove _id to avoid duplicate keys
        _id: 0,
        france: 0, regions: 0, departements: 0, 
        nom: 0, unite: 0, unite_short: 0, trendType: 0
    }},
    { $unwind: { path: "$observations" }},
    { $project: {
        // Remove _id to avoid duplicate keys
        _id: 0,
        "observations.last_value": 0, "observations.last_date": 0, 
        "observations.evol": 0, "observations.evol_percentage": 0, "observations.evol_color": 0
    }},  
    { $unwind: { path: "$observations.values" }},
    { $out: "prop_variant_C_unwind" }
])
