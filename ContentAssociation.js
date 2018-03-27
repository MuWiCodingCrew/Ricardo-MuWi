// Das Ranking basiert auf der Annahme, dass der am besten passendste Inhalt nur Tags enthält, die alle zur durchsuchten Liste gehören + die meisten Tags enthält + die Tags des Inhalts häufig in der Liste vorkommen

const databaseHandler = require('./databaseHandler');
const _ = require('underscore');

var ContentAssociation = {};

//Content erschaffen und Ähnlichkeit ausrechnen
function Content(id, tags){
    this.id = id;
    this.tags = _.uniq(tags);
    this.similarity;
    this.setSimilarity = function(tagList){
        var tagFreq = 0;
        for (let e of this.tags){
            for (let e2 of tagList){
                if(e == e2){
                    tagFreq ++
                }
            }
        }
        //gesamtzahl der tags - Anzahl der nicht übereinstimmenden Tags/gesamtzahl der Tags --> Übereinstimmung * Häufigkeitsfaktor
        this.similarity = ((this.tags.length - _.difference(this.tags,tagList).length)/this.tags.length)*tagFreq;
    }
    this.getSimilarity = function(){
        return this.similarity
    }
}

//Liste der verglichenen Contents sortieren nach Ähnlichkeit & Anzahl der passenden Tags
var matchSort = function(a,b){
    if (a.getSimilarity() < b.getSimilarity()){
        return 1;
    }else if (a.getSimilarity() > b.getSimilarity()){
        return -1;
    }else if (a.getSimilarity() == b.getSimilarity()){
        //ziemlich sicher, dass es mathematisch unmöglich ist, die gleiche Ähnlichkeit und mehr treffende tags zu haben aber insgesamt weniger tags hat
        if (a.tags.length < b.tags.length) {
            return 1;
        }else if (a.tags.length > b.tags.length){
            return -1;
        }else {
            return 0;
        }
    }else {
        return 0;
    }
}

//Wrapper der Sortierfunktion
function sortArray(arr){
  arr.sort(matchSort);
}

//Zuweisung der Funktionen zum Sammelobjekt
ContentAssociation.Content = Content;
ContentAssociation.sortArray = sortArray;

//Export des Sammelobjekts
module.exports = ContentAssociation
