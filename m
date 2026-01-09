Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB98335BDB;
	Fri,  9 Jan 2026 16:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767974605; cv=none; b=Z80krVmlpkhMV01JmRdGpLHq2KazTaSYGdOtv4zHgHxlyA0CVz5+QNQv9jhpC+uwhK/ymvpUB5eehSqY2Zisj7uiuBBRNYFcoAFyJCKWM/BRrBuX5GQe7AlvARWQUwT+VMMa0waMzx2np2GAnWORzzYSgx2kidYCtVOIvq/NpxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767974605; c=relaxed/simple;
	bh=L2O0vvt9OZadiN786Bl9OjhZ8ttcNukmLp93S3fokj8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kVV4OC55w/BBgFxUUHJR4L7U/wC0Z4F8/GAyPGHw+YIkF47GnuhpRukndjqkcb5PeYkGFVI8husVjsa8rUQ9iXR7vINNqXG56/dGvxA0jvyLuYo7FNBl2gyHRO5tTB97xwEx2jDQX8SkmaRZkl69GQfrnMwbiGJ5QFLptDf/G8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 042725820E;
	Fri,  9 Jan 2026 16:03:20 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id 6E8B32000D;
	Fri,  9 Jan 2026 16:03:16 +0000 (UTC)
Date: Fri, 9 Jan 2026 11:03:47 -0500
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
Message-ID: <20260109110347.7fa1e655@gandalf.local.home>
In-Reply-To: <3ef67380-bc8c-42c6-a5f8-416440e4c445@lucifer.local>
References: <e7a2e69991943777f30743868bdc04332a52037b.camel@HansenPartnership.com>
	<a70d3156-ad96-4ad7-90ff-624fab62fe7d@lucifer.local>
	<6e9cab54-7b66-45e9-af96-e52b3eba1034@intel.com>
	<f93a5311-4689-486b-aea8-261263f4d447@lucifer.local>
	<5a301272-31ea-44b8-9518-8151edca6c06@sr71.net>
	<20260108151437.3188cd53@gandalf.local.home>
	<cfb8bb96-e798-474d-bc6f-9cf610fe720f@lucifer.local>
	<aWDf1zlLTKmw9xnq@stanley.mountain>
	<d6dc605e-2f33-4db2-99d9-4c3c83051ae3@lucifer.local>
	<20260109103924.3de6fb4d@gandalf.local.home>
	<3ef67380-bc8c-42c6-a5f8-416440e4c445@lucifer.local>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6E8B32000D
X-Stat-Signature: ptrmcoc47q9fnc6a3dxx9i7ifc9ybgc7
X-Rspamd-Server: rspamout05
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19VYFrOpzUcc4+L9LuHgoVqQ2WbfTCbdLI=
X-HE-Tag: 1767974596-227851
X-HE-Meta: U2FsdGVkX18/GLl96SRHilEsUivLDpW0NfL5+RK4pvhU2mYesczi2TY/ASZgvUkKgiiM/dNNtWS7EwnLAbNhGH9D0b02VsYJ/CLT/CrFeVARiKBWI/qNqddeCGnUznBEfboY12XPQvc4aBd1XEizlZItXLibdkwaGMlQnvSinVlvwlaDydJs7cyGrKMgkkgrxvNssQF0esGZOnFhKDwpjThAoP4wTISzEYxezwefFFkdCWrrpRwyBJ8ouIPeasQF6pIgpCCWf733ekH0cpA+v5mu9GJ7d6/HYcRdRwiCwOSkb1cJwJ/fpY5TBZWOx0zFkDlU2oPVe9AO9hIXLfRCOSr/5bUViX/h

On Fri, 9 Jan 2026 15:48:49 +0000
Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> On Fri, Jan 09, 2026 at 10:39:24AM -0500, Steven Rostedt wrote:
> > On Fri, 9 Jan 2026 11:25:57 +0000
> > Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> >  
> > > > > I don't really read that as grumpy, I understand wanting to be agreeable
> > > > > but sometimes it's appropriate to be emphatic, which is the entire purpose
> > > > > of this amendment.
> > > > >
> > > > > Taking into account Jens's input too:
> > > > >
> > > > > +If tools permit you to generate series automatically, expect
> > > > > +additional scrutiny in proportion to how much of it was generated.
> > > > > +
> > > > > +As with the output of any tooling, the result maybe incorrect or
> > > > > +inappropriate, so you are expected to understand and to be able to defend
> > > > > +everything you submit. If you are unable to do so, then don't submit the
> > > > > +resulting changes.
> > > > > +
> > > > > +If you do so anyway, maintainers are entitled to reject your series without
> > > > > +detailed review.  
> >
> > I like it.  
> 
> Hmm, you like my version but then below argue against every point I make in
> favour of it? I'm confused?

I don't see how it's contradictory to what I expressed later.

> 
> Did you mean to say you liked a suggested other revision or... really this
> one? :)

I like this one, as it relates to any automated tooling (checkpatch and
coccinelle too, not just AI). Because I do believe this is documenting
exactly what we do today and have been doing for years.

I always scrutinize tooling more than when someone wrote it. Because using
tooling myself, there's always that strange corner case that causes the
tooling to do something you didn't expect. Whereas humans usually make the
mistakes that you do expect ;-)


> 
> If so and Dave likes it too then LGTM, pending any Linus/other veto.
> 
> For the rest of your email - a lawyer would say 'asked and answered'. I've
> responded to every point of yours there about 3 times apiece across the
> thread and I don't think it's a good use of time to loop around on things!

I believe that you think I disagree more than what I actually do disagree with ;-)

-- Steve

