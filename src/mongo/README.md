This folder provides tools to download the raw JSON files and import them into MongoDB.


Script `download.sh` downloads the JSON files into folder dump.

Then, script `import.sh` loads the files as separate MongoDB collections and creates derived collections using the `aggregate.js` file.
