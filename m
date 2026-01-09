Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46A1354AD8;
	Fri,  9 Jan 2026 08:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767948923; cv=none; b=jtp4w5k3TZHlLc0szHn/7lwfZeC4VLDSs8nu5KOVaL9JCekiafpuuVhDNkpuLxeylM871B8b4SbGi+U2pPtC0PMHGfI80UJIuesomT9n7opZNz3AT7EnrDzqXpSt0wdL68kvTVvZWWywovqjx/UJa75alFGA0+m7aUBf+b0rEy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767948923; c=relaxed/simple;
	bh=/DH86oEU4jaLO5QsM18oXASbn5kgHpDZa2mzmyvtiRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWO/yg66a7TE/it6uGWiSN/mAuD0IPOvhTQZ5P2UzwHDm9Mqc9VnBiMbdaFUULkRCVGz9RRI6kkbytm7IsNd8N7kh91OYEzFYZh2mNC70NG3RCf7rqArEZRniiMthTQA+qrKXNwfeSvOxjDJaRB7GcbEqTfzVfnnZltH7Cs/DOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EEoha4qT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EEoha4qT"
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4391D6DF;
	Fri,  9 Jan 2026 09:54:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767948883;
	bh=/DH86oEU4jaLO5QsM18oXASbn5kgHpDZa2mzmyvtiRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EEoha4qTP9QUlXkZ8Kk2KZoWJu+RKVlS9Ib42SNTrgrIQy2+ijNZSld7vfIqwocEz
	 1dJz5tNlqCk57ZeToproWZNH0cvw2Xp7VUtPGuOI/ZRSwaXNPM99PjAuABMIccRX4p
	 AUrQy8qwE7n18CSFqCkEFvX7YS6B0meEwuhb7ARk=
Date: Fri, 9 Jan 2026 10:54:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Jens Axboe <axboe@kernel.dk>, Dave Hansen <dave.hansen@intel.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Dave Hansen <dave@sr71.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>, NeilBrown <neilb@ownmail.net>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20260109085446.GA9782@pendragon.ideasonboard.com>
References: <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
 <85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
 <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
 <a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
 <6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
 <f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
 <711d9e37-6fe7-4783-8ac4-5269279bb9fe@kernel.dk>
 <3xf3f4b3vegssexoid746y7isuswwsgmac5hy2hm4ipisdcxaf@nbi67byycwj5>
 <aWCSVh6NocePMvp8@stanley.mountain>
 <0b9a8f99-5cc4-40e8-a0e6-4887d1e1a796@lucifer.local>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0b9a8f99-5cc4-40e8-a0e6-4887d1e1a796@lucifer.local>

On Fri, Jan 09, 2026 at 07:54:31AM +0000, Lorenzo Stoakes wrote:
> On Fri, Jan 09, 2026 at 08:29:58AM +0300, Dan Carpenter wrote:
> > On Thu, Jan 08, 2026 at 04:04:39PM -0500, Liam R. Howlett wrote:
> > > * Jens Axboe <axboe@kernel.dk> [260108 15:54]:
> > > > On 1/8/26 12:23 PM, Lorenzo Stoakes wrote:
> > > > >> @@ -95,3 +95,8 @@ choose how they handle the contribution. For example, they might:
> > > > >>   - Ask the submitter to explain in more detail about the contribution
> > > > >>     so that the maintainer can feel comfortable that the submitter fully
> > > > >>     understands how the code works.
> > > > >> +
> > > > >> +Finally, always be prepared for tooling that produces incorrect or
> > > > >> +inappropriate content. Make sure you understand and to be able to
> > > > >> +defend everything you submit. If you are unable to do so, maintainers
> > > > >> +may choose to reject your series outright.
> > > > >>
> > > > >
> > > > > I feel like this formulation waters it down so much as to lose the emphasis
> > > > > which was the entire point of it.
> > > > >
> > > > > I'm also not sure why we're losing the scrutiny part?
> > > > >
> > > > > Something like:
> > > > >
> > > > > +If tools permit you to generate series entirely automatically, expect
> > > > > +additional scrutiny.
> > > > > +
> > > > > +As with the output of any tooling, the result maybe incorrect or
> > > > > +inappropriate, so you are expected to understand and to be able to defend
> > > > > +everything you submit. If you are unable to do so, maintainers may choose
> > > > > +to reject your series outright.
> > > >
> > > > Eh, why not some variant of:
> > > >
> > > > "If you are unable to do so, then don't submit the resulting changes."
> > > >
> > > > Talking only for myself, I have ZERO interest in receiving code from
> > > > someone that doesn't even understand what it does. And it'd be better to
> > > > NOT waste my or anyone elses time if that's the level of the submission.
> > >
> > > Yes, agreed.
> > >
> >
> > Yeah.  Me too.
> >
> > > If I cannot understand it and the author is clueless about the patch,
> > > then I'm going to be way more grumpy than the wording of that statement.
> > >
> > > I'd assume the submitter would just get the ai to answer it anyways
> > > since that's fitting with the level of the submission.
> >
> > Yes.  That has happened to me.  I asked the submitter how do you know
> > this is true? And the v2 had a long AI generated explanation which quoted
> > a spec from an AI hallucination.
> >
> > I like Dave's document but the first paragraph should be to not send AI
> > slop.
> 
> This is the entire point of my push back here :)
> 
> I'd prefer us to be truly emphatic with a 'NO SLOP PLEASE' as the opener and
> using that term, but I'm compromising because... well you saw Linus's position
> right?
> 
> I do find it... naive to think that we won't experience this. For one it's
> already started, for another people working on open source projects like
> Postgres may have something to say e.g. [0]...
> 
> [0]:https://mastodon.social/@AndresFreundTec/115860496055796941
> 
> Do we really want to provide a milquetoast document that is lovely and agreeable
> and reading it doesn't explicitly say no slop that _will_ be reported on like that?
> 
> Note that Linus's position on this has been reported as essentially 'Linus says
> AI tools are like other tools and you are STUPID if you think otherwise they are
> FINE' - which is not what he said, but does that matter?
> 
> Do we really truly think doing that is going to have no impact on people sending
> us crap? There are a bunch of well-meaning but less-talented people who try to
> do kernel stuff, we've all seen it and dealt with it. These same people _will_
> pay attention to this kind of thing and try it on.
> 
> Yes we can't do anything about bad faith people who'll ignore everything. But in
> that case being able to point at the doc will make life practically _easier_.
> 
> Either way I think it's important we have something vaguely emphatic there.
> 
> Which is why I'm tiring myself out with this thread when I have a lot of other
> things to do :)

Thank you for that. As a lurker in this mail thread, I really appreciate
your efforts as they're saving the time I would need to argue as
strongly as you do :-)

While I agree with the argument that kernel documentation should not
cover every single hypothetical case that one could come up with, the
issue at hand here is real (based on the multiple people who have
replied saying they have seen it happen), and I don't think anyone
expects the problem to disappear magically given the industry trend.

It is also absolutely true that actors with questionable ethics will not
care about the documentation. I do see value in being able to point
developers acting in good faith to the rules, but an even more important
point in my opinion is the message your proposal gives to maintainers.

On a side note, I wonder if this is symptomatic of an erosion of trust
in this conflictual world, with some maintainers increasingly fearing
they will be forced or overridden.

-- 
Regards,

Laurent Pinchart
