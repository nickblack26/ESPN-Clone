//
//  BoxscoreStatLine.swift
//  ESPN Clone
//
//  Created by Nick on 11/27/23.
//

import SwiftUI

struct BoxscoreStatView: View {
	var statistic: StatisticModel
	var opossingStatistic: StatisticModel
	
	init(_ statistic: StatisticModel, _ opossingStatistic: StatisticModel) {
		self.statistic = statistic
		self.opossingStatistic = opossingStatistic
	}
	
    var body: some View {
		GeometryReader {
			let size = $0.size
			let regStat = Double(statistic.displayValue) ?? 0
			let oppStat = Double(opossingStatistic.displayValue) ?? 0
			let totalStat = Double(regStat + oppStat)
			let capsuleSize = size.width / totalStat
			
			VStack {
				HStack {
					Text(statistic.displayValue)
						.font(.caption)
					
					Spacer()
					
					Text(statistic.label ?? statistic.name)
						.font(.caption2)
						.foregroundStyle(.secondary)
					
					Spacer()
					
					Text(opossingStatistic.displayValue)
						.font(.caption)
				}
				.fontWeight(.medium)
				
				if (regStat >= totalStat / 2) {
					ZStack(alignment: .leading) {
						Capsule()
							.frame(height: 4)
							.opacity(0.1)
						
						Capsule()
							.fill(.secondary)
							.frame(height: 4)
							.frame(maxWidth: capsuleSize * regStat)
					}
					.frame(maxWidth: .infinity, alignment: .trailing)
				} else {
					ZStack(alignment: .trailing) {
						Capsule()
							.frame(height: 4)
							.opacity(0.1)
						
						Capsule()
							.fill(.secondary)
							.frame(height: 4)
							.frame(maxWidth: capsuleSize * oppStat)
					}
					.frame(maxWidth: .infinity, alignment: .trailing)
				}
			}
		}
		.frame(maxWidth: .infinity)
    }
}

#Preview {
	BoxscoreStatView(StatisticModel.examples()[0], StatisticModel.examples()[1])
}
