//
//  main.swift
//  IR
//
//  Created by 양창엽 on 2018. 5. 29..
//  Copyright © 2018년 Yang-Chang-Yeop. All rights reserved.
//

import Foundation

// MARK: - Typealies
private typealias DocumentPair = (words: [Substring], docLTC: LTC)

// MARK: - Structure
private struct DocumentInfo {
    let totalDocument:  Int = 10
    let totalQuery:     Int = 5
    let numberTerm:     Int = 40
}
private struct LTC {
    var tf:     Int
    var ltf:    Double
    var df:     Int
    var idf:    Double
    var tf_idf: Double
}

// MARK: - Variables
private var documents       = [String: DocumentPair]()
private var score           = [(Score: Double, DocName: String, QryName: String)]()
private let documentInfo    = DocumentInfo()
private let documentFiles   = ["words1.txt", "words2.txt", "words3.txt", "words4.txt", "words5.txt", "words6.txt", "words7.txt", "words8.txt", "words9.txt", "words10.txt"]
private let queryFiles      = ["query1.txt", "query2.txt", "query3.txt", "query4.txt", "query5.txt"]

// MARK: - Method
private func countingTF(term: Substring, lists: [Substring]) -> Int {
    
    var count: Int = 0
    for find in lists {
        count += (find == term) ? 1 : 0
    }
    
    return count
}
private func readFromFile(fileNames: [String], dir: URL) {
    for file in fileNames {
        let fileURL:    URL     = dir.appendingPathComponent(file)
        let text:       String  = try! String(contentsOf: fileURL, encoding: .utf8)
        documents[file] = (text.split(separator: "\n"), LTC(tf: 0, ltf: 0.0, df: 0, idf: 0.0, tf_idf: 0.0))
    }
}
private func calculateIDF(termDF: Int, total: Int) -> Double {
    let idf: Double = Double(total) / Double(termDF)
    return log10(idf)
}
private func calculateLTF(termTF: Int) -> Double {
    return termTF > 0 ? 1 + log10(Double(termTF)) : 0.0
}

// MARK: Read File from Document
if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
    
    // Read Document File
    readFromFile(fileNames: documentFiles, dir: dir)
    
    // Read Query File
    readFromFile(fileNames: queryFiles, dir: dir)
}

for file in documentFiles {
    
    var termLTC               = [Substring: (Query: LTC, Document: LTC)]()
    var totalWords            = Set<Substring>()
    var cosineSum: Double     = 0.0
    
    print("==================== \(file) ====================")

    // MARK: Create Document Posting List
    guard let words: [Substring] = documents[file]?.words else { break }
    for term in words {
        totalWords.insert(term)
        termLTC[term] = (LTC(tf: 0, ltf: 0.0, df: 0, idf: 0.0, tf_idf: 0.0), LTC(tf: 0, ltf: 0.0, df: 0, idf: 0.0, tf_idf: 0.0))
    }
    
    for word in totalWords {
        for key in documentFiles {
            guard let wordlist: [Substring] = documents[key]?.words else { break }
            if wordlist.contains(word) { termLTC[word]?.Document.df += 1; continue }
        }
        
        for key in queryFiles {
            guard let wordlist: [Substring] = documents[key]?.words else { break }
            if wordlist.contains(word) { termLTC[word]?.Query.df += 1; continue }
        }
    }
    
    // MARK: Iterate Counting Current Document and Query TF
    for queryFileName in queryFiles {
        
        print("==================== \(queryFileName) ====================")
        
        // MARK: Caculate Query and Document TF
        for word in totalWords {
            
            // MARK: Count Document TF
            if let terms: [Substring] = documents[file]?.words {
                termLTC[word]?.Document.tf += countingTF(term: word, lists: terms)
            }
            
            // MARK: Count Query TF
            if let terms: [Substring] = documents[queryFileName]?.words {
                termLTC[word]?.Query.tf += countingTF(term: word, lists: terms)
                
            }
        }
        
        // MARK: Iterate Caculate Log-Frequency, IDF
        for word in totalWords {
            
            guard let document = termLTC[word]?.Document, let query = termLTC[word]?.Query else {
                continue
            }
            
            // MARK: Calculate Log-Frequency
            termLTC[word]?.Document.ltf     = calculateLTF(termTF: document.tf)
            termLTC[word]?.Query.ltf        = calculateLTF(termTF: query.tf)
            
            // MARK: - Calculate idf Weight
            termLTC[word]?.Document.idf     = calculateIDF(termDF: document.df + 1, total: documentInfo.totalDocument)
            termLTC[word]?.Query.idf        = calculateIDF(termDF: query.df + 1, total: documentInfo.totalQuery)
        }
        
        // MARK: Iterate Caculate TF-IDF
        for word in totalWords {
            
            guard let docTFIDF = termLTC[word]?.Document, let query = termLTC[word]?.Query else {
                continue
            }
            
            // MARK: - Calculate TF-IDF
            termLTC[word]?.Document.tf_idf = docTFIDF.idf * docTFIDF.ltf
            termLTC[word]?.Query.tf_idf = query.idf * query.ltf
        }
        
        // MARK: - Print Cosine (Query, Document) and Ranking
        for word in termLTC.keys {
            
            guard let docLTC = termLTC[word]?.Document, let queryLTC = termLTC[word]?.Query else {
                continue
            }
            
            // Caculate Cosine Score
            cosineSum += docLTC.tf_idf * queryLTC.tf_idf
            
            print("- \(word) => Document: \(docLTC)")
            print("- \(word) => Query: \(queryLTC)")
        }
        
        score.append((cosineSum, file, queryFileName))
    }
}

score.sort(by: { $0.Score > $1.Score })
for rank in score {
    print("⌘ MATCH RANK -> \(rank.DocName) - \(rank.QryName) \(String(format: "%.3f", rank.Score))")
}
