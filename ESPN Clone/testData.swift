//
//  testData.swift
//  ESPN Clone
//
//  Created by Nick on 9/18/23.
//

import Foundation

let testSituations: [SituationModel] = [
	.init(
		shortDownDistanceText: "3rd & 1",
		possessionText: "PSU 39",
		possession: "213"
	)
]

let testPlays: [PlayModel] = []

let testCompetitionStatuses: [CompetitionStatusModel] = [
	.init(
		clock: 256.0,
		displayClock: "0:00",
		period: 4
	)
]

let testBroadcasts: [BroadcastModel] = [.init(market: "national", names: ["FOX"])]

let testTeams: [TeamModel] = [
	.init(
		id: "213",
		location: "Penn State",
		name: "Nittany Lions",
		logo: "https://a.espncdn.com/i/teamlogos/ncaa/500/213.png"
	),
	.init(
		id: "356",
		location: "Illinois",
		name: "Fighting Illini",
		logo: "https://a.espncdn.com/i/teamlogos/ncaa/500/356.png"
	)
]

let testRecords: [RecordModel] = [
	.init(
		name: "overall",
		abbreviation: "overall",
		type: "total",
		summary: "3-0"
	),
	.init(
		name: "overall",
		abbreviation: "overall",
		type: "total",
		summary: "2-0"
	)
]

let testCuratedRanks: [CuratedRankModel] = [.init(current: 99), .init(current: 7)]

let testScoreboards: [ScoreboardModel] = [
	.init(events: testEvents)
]

let testCompetitors: [CompetitorModel] = [
	.init(
		id: "356",
		order: 0,
		homeAway: "home",
		winner: false,
		team: testTeams[1],
		score: "13",
		curatedRank: testCuratedRanks[0],
		records: [testRecords[1]], statistics: []
	),
	.init(
		id: "213",
		order: 1,
		homeAway: "away",
		winner: true,
		team: testTeams[0],
		score: "30",
		curatedRank: testCuratedRanks[1],
		records: [testRecords[0]], statistics: []
	)
]

let testEvents: [EventModel] = [
	.init(
		id: UUID().uuidString,
		date: Date().ISO8601Format(),
		name: "Florida State Seminoles at Boston College Eagles",
		shortName: "FSU @ BC",
		competitions: testCompetitions
	)
]

let testCompetitions: [CompetitionModel] = [
	.init(
		id: UUID().uuidString,
		competitors: testCompetitors,
		situation: testSituations[0],
		status: testCompetitionStatuses[0],
		broadcasts: [testBroadcasts[0]]
	)
]

let testArticles: [ArticleModel] = [
	.init(
		description: "Steelers wide receiver Diontae Johnson said he is remaining positive and level-headed amid an unclear timeline for his return from a hamstring injury.",
		type: .HeadlineNews,
		premium: false,
		headline: "Awaiting timeline, Diontae Johnson admits injury 'frustrating'",
		byline: "Brooke Pryor",
		published: Date(),
		lastModified: Date(),
		images: [
			.init(
				id: 34478042,
				url: "https://a.espncdn.com/photo/2022/0828/r1054264_600x400_3-2.jpg",
				name: "Diontae Johnson [600x400]"
			)
		]
	),
	.init(
		description: "Steelers wide receiver Diontae Johnson said he is remaining positive and level-headed amid an unclear timeline for his return from a hamstring injury.",
		type: .HeadlineNews,
		premium: false,
		headline: "Awaiting timeline, Diontae Johnson admits injury 'frustrating'",
		byline: "Brooke Pryor",
		published: Date(),
		lastModified: Date(),
		images: [
			.init(
				id: 34478043,
				url: "https://a.espncdn.com/combiner/i?img=%2Fphoto%2F2023%2F0912%2Fr1223540_1296x518_5%2D2.jpg&w=1256&h=502&scale=crop&cquality=40&location=center&format=jpg",
				name: "Diontae Johnson [600x400]"
			)
		]
	)
]
