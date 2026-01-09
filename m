Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840F4313276;
	Fri,  9 Jan 2026 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973142; cv=none; b=Vgrkca8zrXLz6VRFyWuZyewMkuH6lrNyrUTTa+7I1AXwEKij+xuinKFF9jOvRaUHzxmx4mp2Ha5rlC4hsmLqbHP2hcSxDXF95H9Iz6I2TNDaOvDIuZqD02pNxVjuZ22RLDFWAQMzZ6CC0pLsYQP0qL+GeB7+qYuBrSmPuMBR63w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973142; c=relaxed/simple;
	bh=RszALjxB4ZN1s8O/LUyf5seOvu1i+XtehNaqK/hVpf4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JXNkCm9Jv90bhT6LZqvTPvhJprl909VJM9gj8KGkZGTGC5SXFEiDYPJFxJY2e6ThNhlqkPu0rjQK9w5b6pwBOLKICaeGB0+8rwfCTj36I+cjMO9Cl1P0Q24vOH9xPZTM/u983KWq8LsSC+VQahtQzsVUB5tzHQl5beQiFJuAIXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 13BECB70ED;
	Fri,  9 Jan 2026 15:38:58 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id A6D8817;
	Fri,  9 Jan 2026 15:38:53 +0000 (UTC)
Date: Fri, 9 Jan 2026 10:39:24 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Dave Hansen <dave@sr71.net>,
 Dave Hansen <dave.hansen@intel.com>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Shuah Khan
 <shuah@kernel.org>, Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, Dan
 Williams <dan.j.williams@intel.com>, NeilBrown <neilb@ownmail.net>,
 Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
 workflows@vger.kernel.org, ksummit@lists.linux.dev, Jens Axboe
 <axboe@kernel.dk>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20260109103924.3de6fb4d@gandalf.local.home>
In-Reply-To: <d6dc605e-2f33-4db2-99d9-4c3c83051ae3@lucifer.local>
References: <a60e0e566edbcbd70176045ae077176444ca25a9.camel@HansenPartnership.com>
	<85614f7f-f217-47e5-a9f7-0a012f6e6ecd@lucifer.local>
	<e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
	<a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
	<6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
	<f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
	<5a301272-31ea-44b8-9518-8151edca6c06@sr71.net>
	<20260108151437.3188cd53@gandalf.local.home>
	<cfb8bb96-e798-474d-bc6f-9cf610fe720f@lucifer.local>
	<aWDf1zlLTKmw9xnq@stanley.mountain>
	<d6dc605e-2f33-4db2-99d9-4c3c83051ae3@lucifer.local>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: A6D8817
X-Stat-Signature: nwnseby69nwk1fzfwpfbymka8mpgjuj9
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1++FHE0n0ozRQ+P9Vo+kbtRsxf5L40tO6o=
X-HE-Tag: 1767973133-695648
X-HE-Meta: U2FsdGVkX198fbUCo9RmyhVw7ey2oTTVY8Fj9KeK4lupiclYOgEMcTO7RV6VrGjPjAjI0IYOR6PHM/6+oddZCnWnxkBKZ5kAm/6LBkEJ4yB+qMFTbLBgdU6eIl/7ghGViOKVkMMwPFR8pv/8Hka1CV5euzUi8rN3f8d0cXVmySDCV6JiIWgChDo11xvWJ38x37W36YQz+RhX2480wmhtTBWgRlD52j57lC9VL+I6S4TE5/SPxSU21+fIBhsRbxR/Aud5F2jyw60zF7LWvK7FHprh/Nef4kW8yJFKWjIksjN4QCWmcwf1IwHoHiYuudQNY0lCyC/PC3Z3Zau9hfFiKc1O2OTsG3K1tjZDw90c3m2H9TDnjUJaopkuvruANcvPitlRef/QGP0vDbc3pLEwy/yZQTnyNKcZ3jZSM4bkSxA=

On Fri, 9 Jan 2026 11:25:57 +0000
Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> > > I don't really read that as grumpy, I understand wanting to be agreeable
> > > but sometimes it's appropriate to be emphatic, which is the entire purpose
> > > of this amendment.
> > >
> > > Taking into account Jens's input too:
> > >
> > > +If tools permit you to generate series automatically, expect
> > > +additional scrutiny in proportion to how much of it was generated.
> > > +
> > > +As with the output of any tooling, the result maybe incorrect or
> > > +inappropriate, so you are expected to understand and to be able to defend
> > > +everything you submit. If you are unable to do so, then don't submit the
> > > +resulting changes.
> > > +
> > > +If you do so anyway, maintainers are entitled to reject your series without
> > > +detailed review.  

I like it.

> >
> > This is too subtle.  In real life if we suspect a patchset is AI Slop,
> > then we're going to reject the whole thing immediately.  No one is
> > going to review all fifteen patches one by one as if we're searching
> > through monkey poo for edible grains of corn.  

I'll repeat here what I mentioned in my other email. Those that send the
slop are NOT GOING TO READ THIS. The ones that are going to read this are
the ones trying to do the right thing.

I don't think this is too subtle. It basically tells honest contributors
what to expect. It doesn't have to be a "Do this or else!" document.

> 
> I'm trying to compromise as the general direction on this document is to be
> very soft (see the suggested edits so far).
> 
> I get why, but the entire purpose of this amendment is to put emphasis and
> really to stand up as a community and to say clearly this isn't something
> we want.

As I mentioned before. This is to clarify what we expect. Some people may
be harsher on AI slop than others. We don't need to make this document at
the tone of those that hate AI slop the most.

I want the tone to be aimed at people who want to know how to submit
something. Not a tone at those that are going to be doing it wrong *because
they didn't read any documents*.

> 
> >
> > The AI slop patches I've seen were not bad actors.  Someone saw a
> > TODO in the file and thought that AI could solve it.  The patch
> > compiled, it was formatted correctly and the commit message sounded
> > confident so they sent it.  
> 
> Yes exactly this. Exactly.
> 
> I've said it elsewhere, but:
> 
> a. People who have good intentions who will take this as a green light to
>    just send out fully LLM generated stuff.

I'm pretty sure this document does not express that. Even when being more "soft".


> b. Press coverage (it's already happening) will essentially signal it's a
>    green light on this.
> 
> For e.g.:
> https://www.phoronix.com/news/Torvalds-Linux-Kernel-AI-Slop
> https://www.theregister.com/2026/01/08/linus_versus_llms_ai_slop_docs/?td=rt-3a

Reading the comments appears to show that most people think AI is mostly
over hyped.

> >
> > To me the audience for this is maybe a team working on AI and they
> > don't have any kernel developers on staff so they assume they're being
> > helpful sending unreviewed patches.  The message should be that every
> > patch needs to be reviewed carefully before it is sent upstream.  I've
> > been asked to review patches like this in the past.  Get outside help
> > if you need to, but every patch needs to be reviewed.  

And those people are exactly who will likely not read this document!

> 
> Yes exactly.
> 
> But also it's useful when dealing even with bad actors to point at the
> community _actually taking a postiion_.

As I stated before. This wasn't the purpose of the document.


> 
> And frankly on waiting for it to 'get worse' (i.e. to get like basically
> the rest of open source) - I have little faith the document really will be
> updated to say anything forthright at least at any speed, and by then it'll
> be too little too late.

Honestly, if it gets worse, I would suggest creating a separate document
specifically about AI. This document is just writing down the unwritten
rules we already have with tool-generated content. This document includes
coccinelle and checkpatch.

If we need a "AI slop go away!" document, that should be a separate one.

Feel free to create that and submit an RFC ;-)

-- Steve

> 
> The idea the kernel community taking a position doesn't have any impact is
> simply false.
> 
> I think far too much thinking in terms of how computers are going on here,
> and too little about how people are.

