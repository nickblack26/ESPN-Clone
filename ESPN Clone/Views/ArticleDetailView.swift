//
//  ArticleDetailView.swift
//  ESPN Clone
//
//  Created by Nick on 9/14/23.
//

import SwiftUI

struct ArticleDetailView: View {
	var title: String
	var story: String
	
    var body: some View {
		ScrollView {
			Text(title)
				.font(.title)
				.fontWeight(.semibold)
			
			Text(html: story)
				.padding()
		}
    }
}

#Preview {
	NavigationStack {
		ArticleDetailView(title: "Awaiting timeline, Diontae Johnson admits injury 'frustrating'", story: "<p>PITTSBURGH -- <a href=\"http://www.espn.com/nfl/team/_/name/pit/pittsburgh-steelers\">Steelers</a> wide receiver <a href=\"http://www.espn.com/nfl/player/_/id/3932905/diontae-johnson\">Diontae Johnson</a> says he is remaining positive and level-headed amid an unclear timeline for his return from a hamstring injury.</p>\n<p>\"It sucks,\" Johnson said Thursday, adding that no decision has been made about placing him on injured reserve. \"It's the first game, didn't get to really do what I wanted to do out there, but it's frustrating.</p>\n<p>\"But at the same time, my teammates keep me up, my little son keeps me up. I can't just be in a bad mood; that's not going to do nothing about the situation. All I can do is just keep being a leader from our group, just coming in with a positive energy or a smile on my face and just keep attacking this rehab.\"</p>\n<p><alsosee></p>\n<p>The injury occurred early in the third quarter Sunday against the <a href=\"https://www.espn.com/nfl/team/_/name/sf/san-francisco-49ers\">San Francisco 49ers</a> as Johnson tried to make a cut after picking up a first down at the end of a 26-yard gain. A source told ESPN's Adam Schefter on Tuesday that Johnson is expected to be sidelined for \"a few weeks.\"</p>\n<p>\"I just put my foot in the ground,\" Johnson said. \"Fluke incident, it just gave out on me. I can't do nothing about that.\"</p>\n<p>Johnson said he hadn't experienced any issues with the hamstring during the preseason and that he came out of training camp healthy.</p>\n<p>The Steelers will likely be without Johnson for Monday night's game against the <a href=\"http://www.espn.com/nfl/team/_/name/cle/cleveland-browns\">Cleveland Browns</a>, coach Mike Tomlin said Tuesday, meaning second-year wide receiver <a href=\"http://www.espn.com/nfl/player/_/id/4243389/calvin-austin\">Calvin Austin III</a> could take on an expanded role in the offense. Austin, who missed his rookie season with a foot injury, caught all six targets for 37 yards in his NFL debut. Although he is a smaller receiver, listed at 5-foot-9, 162 pounds, Austin spent most of his time on the outside, running 23 routes and catching five passes from out wide compared with just four routes in the slot.</p>\n<p>\"He's smart, so he knows what he's doing,\" Johnson said of Austin. \"He knows the playbook well, so it's like when he gets out there, it's not like he hasn't seen the formation or the playcall before, haven't heard anything. We've been doing this since training camp, so I'm pretty sure he's going to be real comfortable out there.\"</p>\n\n\n\n\n")
	}
}
