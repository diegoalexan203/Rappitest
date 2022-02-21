//
//  DbHelper.swift
//  rappitestDiego8a
//
//  Created by Diego on 20/02/22.
//

import Foundation
import SQLite

class DbHelper {
    var moviesDB: Connection!
    var path: String = "MoviesDB.sqlite3"
    let moviesTable = Table("movies")

    let id = Expression<Int>("id")
    let backdropPath = Expression<String>("backdropPath")
    let originalTitle = Expression<String>("originalTitle")
    let overview = Expression<String>("overview")
    let posterPath = Expression<String>("posterPath")
    let releaseDate = Expression<String>("releaseDate")
    let title = Expression<String>("title")
    let video = Expression<Bool?>("video")

    init() {
        moviesDB = createDatabase()
        createTablePosts()
    }

    func createDatabase() -> Connection! {
        do {
            let filepath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathExtension(path)

            let db = try Connection(filepath.path)
            print("database created with path \(filepath.path)")
            return db
        } catch {
            print(error)
            return nil
        }
    }

    func createTablePosts() {
        let tableToCreate = moviesTable.create { table in
            table.column(id)
            table.column(backdropPath)
            table.column(originalTitle)
            table.column(overview)
            table.column(posterPath)
            table.column(releaseDate)
            table.column(title)
            table.column(video)
        }

        do {
            try moviesDB.run(tableToCreate)
            print("table created hellyeah")
        } catch {
            print(error)
        }
    }

    func moviesTableHasData() -> Bool {
        var validate = false
        let listMovies = getMoviesList()
        if listMovies.count > 0 {
            validate = true
        }
        return validate
    }

    func create(movies: MoviesEntity) {
        let userToInsert = moviesTable.insert(id <- movies.id!, backdropPath <- movies.backdropPath!, originalTitle <- movies.originalTitle!, overview <- movies.overview!, releaseDate <- movies.releaseDate!, title <- movies.title!, video <- movies.video)

        do {
            try moviesDB.run(userToInsert)

            print("user registered successfully")
        } catch {
            print(error)
        }
    }

    func getMoviesList() -> [MoviesEntity] {
        var moviesArray = [MoviesEntity]()

        do {
            let movies = try moviesDB.prepare(moviesTable)

            for movie in movies {
                let movieScoped = MoviesEntity(backdropPath: movie[backdropPath], id: movie[id], originalTitle: movie[originalTitle],
                                               overview: movie[overview], posterPath: movie[posterPath], releaseDate: movie[releaseDate], title: movie[title], video: movie[video] ?? false)

                moviesArray.append(movieScoped)
            }
            return moviesArray
        } catch {
            print(error)
            return moviesArray
        }
    }

    func getMovieById(idMovie: Int) -> MoviesEntity? {
        let movieFromDb = moviesTable.filter(id == idMovie)
        var movie: MoviesEntity?
        do {
            for movieGetted in try moviesDB.prepare(movieFromDb) {
                movie = MoviesEntity( backdropPath: movieFromDb[backdropPath], id: movieFromDb[id], originalTitle: movieFromDb[originalTitle],
                                     overview: movieFromDb[overview], posterPath: movieFromDb[posterPath], releaseDate: movieFromDb[releaseDate], title: movieFromDb[title], video: movieFromDb[video])

                return movie
            }

        } catch {
            print(error)
        }
        return movie
    }

    func deleteAll() {
        let moviesDelete = moviesTable.delete()
        do {
            try moviesDB.run(moviesDelete)
        } catch {
            print(error)
        }
    }
}
