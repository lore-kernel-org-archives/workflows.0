Received: from mail.hallyn.com (mail.hallyn.com [178.63.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC8872618;
	Sat, 10 Jan 2026 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.66.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768058740; cv=none; b=EI18hw8Z1a33NR70a/13fA8xDWuLAQ8gY+LV5zXGWx7woL6LyUCBkC448zdbRmBhb8HudVzD21h78cx/BJgWr8IG+HXvmLaQyx3zP5K40camHd2hpBuRDXCQrf5RO9zUpW1WdI+HJH46Cjy8tMNIPULGulL23X/AXJ9nz3tMfHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768058740; c=relaxed/simple;
	bh=GOVLc+V9uCrd4Ib9TQou2TuPjktHIDmK/dtgNf2HQDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sc9uVT3IjB02WRfHby/ohvzaZWRm+NdnJXGOFJitY6+DlRhWm4C9miOcRm1QyBSxHxD+TD2xkbWaSego0DvTR9km3wSnQz1/6bnblQWYaE47Id8kF1qELx8HF8sUugFMMqd0xXlxCHcNTjxPUj4960qGlJdlj9vv2NDM4TwkQB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hallyn.com; spf=pass smtp.mailfrom=mail.hallyn.com; dkim=pass (2048-bit key) header.d=hallyn.com header.i=@hallyn.com header.b=tZyUqEyW; arc=none smtp.client-ip=178.63.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hallyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.hallyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hallyn.com header.i=@hallyn.com header.b="tZyUqEyW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hallyn.com; s=mail;
	t=1768058736; bh=GOVLc+V9uCrd4Ib9TQou2TuPjktHIDmK/dtgNf2HQDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZyUqEyWf+QaCyixvnvMB0aofKb/UCTU3iitdaV0HdwHMo1+H7okMOCVDpTJlMG6G
	 tz+ynBO9SOXQsFwak8IUePmgawO10MTOSrTudy5BW5ImwFmY+BNVqHNlXS13NVqJLR
	 PRI+2Nr9sVfaieSepacIpZevAlPjRCBH35rnwAyS2wm/aP3NAUikBIMAqZCbR0EGur
	 m0Q8E65fZLMMefcVhzeiej9z+JuTJ91QPVFVQeyh+punUspp2bF83ED5IKOrjGWMV/
	 7/qNZTsV1m2R8qfJsFIEFwcvw+XGcykOiWDA7olY9PAUdO3C65fNFnYGK5YRd03OPC
	 FhPjXGLpaFntw==
Received: by mail.hallyn.com (Postfix, from userid 1001)
	id 34352BEF; Sat, 10 Jan 2026 09:25:36 -0600 (CST)
Date: Sat, 10 Jan 2026 09:25:36 -0600
From: "Serge E. Hallyn" <serge@hallyn.com>
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
Message-ID: <aWJvcPeV5ziCt5Du@mail.hallyn.com>
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
Content-Type: text/plain; charset=us-ascii
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

I just don't think the word "slop" should be used, because while it may
be very clear to you, and may be clearly defined in some communities, me,
I'm just guessing what you mean by it.
