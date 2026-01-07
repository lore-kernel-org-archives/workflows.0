Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24393A0B24;
	Wed,  7 Jan 2026 21:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767823084; cv=none; b=ML5pArMY8Y11HXZJt2eiUOhfoZq3SPBOM0qapysKlKrRrbvSr80vvSF8TyPnSJ13ootVVzV8bHtEpNRMtVB8P0IxrL8VUvlS4QnAIZTeGlfRjRuMbfCQQ+CvwVFgbeTWP8eyFQBVtrESapVLdXkm9bG6UqFHRWdfVUEjdOiFpvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767823084; c=relaxed/simple;
	bh=JJO5kWnaei7ijEhgZgHPCsjQC625UrrHLkCl9hEQPHU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OnnKcm8vPZP84U3IGV87Bzkd/hvEf4nxj7N6Dlomn1WzzO5tdWOYuv1GHpCwwP1X/i3k9xfp9iafbfIacIpPt/BI+gusGKd8SJFh43k6p6nihBVnXKWbJr+MkbKkarlLO0P1goB7VPsCmmoWa6MpZYC7gtlLdpulA0uQ4KQHeoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 08F491404EC;
	Wed,  7 Jan 2026 21:57:53 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id 5FE0480014;
	Wed,  7 Jan 2026 21:57:50 +0000 (UTC)
Date: Wed, 7 Jan 2026 16:58:16 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Kees Cook
 <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel
 Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, SeongJae
 Park <sj@kernel.org>, Dan Williams <dan.j.williams@intel.com>, NeilBrown
 <neilb@ownmail.net>, Theodore Ts'o <tytso@mit.edu>, Sasha Levin
 <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka
 <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20260107165816.63ff25ac@gandalf.local.home>
In-Reply-To: <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
	<1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local>
	<93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
	<1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: axp8tf5o8qzschpeddo69zibwc9er41z
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 5FE0480014
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19rfwLI8uaQI467DWLEXVO6z4HZ/iKYS2A=
X-HE-Tag: 1767823070-627189
X-HE-Meta: U2FsdGVkX1/DqoTanVxpacoQiJW+uM39c5DHlqVmWh+HXz4ULQ9jUR2XZ+nOzqhV58wpyibW1aBMQj4nmJpabGcIUAkOK9x6PgnatyqaUC8EfvxJebAsQbhbQwbgjW6jYO6SEDsuhbMbAyOCHfoJOZPWjAobwzudOjhletszLd1NJk/X5ddymW1q30pCOf96iVBSsabeZxJGQGyD/WD6Zdw3aFyaOpeAmHJcYqpLnFyjykGXPROotKHvdq3XERLs1JiZQzAwmOsWxdz/nUQKCo4y62YaWO5tQIgi8tEFGA9eEEPxQaIeI++hFvSXukux7QWN8krXvI3uPJgQ6P+MBmo7RXMwpbSk

On Wed, 7 Jan 2026 21:15:17 +0000
Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:


> I would simply argue that LLMs are not another tool on the basis of the
> drastic negative impact its had in very many areas, for which you need only
> take a cursory glance at the world to observe.
> 
> Thinking LLMs are 'just another tool' is to say effectively that the kernel
> is immune from this. Which seems to me a silly position.

But has this started to become a real problem with the kernel today?

> 
> >
> > Let's look at it another way: What we all *want* for the kernel is
> > simplicity. Simple rules, simple documentation, simple code. The
> > simplest way to deal with the LLM onslaught is to pray that our existing
> > rules will suffice.  
> 
> I'm not sure we really have rules quite as clearly as you say, as
> subsystems differ greatly in what they do.
> 
> For one mm merges patches unless averse review is received. Which means a
> sudden influx of LLM series is likely to lead to real problems. Not all
> subsystems are alike like this.

But has this happened yet?

> 
> One rule that seems consistent is that arbitrary dismissal of series is
> seriously frowned upon.

If it is AI slop coming in, you can say, "unless you can prove to me that
you understand this series and there's nothing wrong with it, I'm rejecting
it"

If the series looks good then what's the issue. But if it's AI slop and
it's obvious the person behind the code doesn't understand what they are
submitting, that could even be rationale for sending that person to your
/dev/null folder.

> 
> The document claims otherwise.
> 
> >
> > For now, I think the existing rules are holding. We have the luxury of  
> 
> We're noticing a lot more LLM slop than we used to. It is becoming more and
> more of an issue.

Are you noticing this in submissions?

> 
> Secondly, as I said in my MS thread and maybe even in a previous version of
> this one (can't remember) - I fear that once it becomes public that we are
> open to LLM patches, the floodgates will open.

This document is not about addressing anything that we fear will happen. It
is only to state our current view of how things work today.

If the floodgates do open and we get inundated with AI slop, then we can
most definitely update his document to have a bit more teeth.

But one thing I learned about my decade on the TAB, is don't worry about
things you are afraid might happen, just make sure you address what is
currently happening. Especially when it's easy to update the rules.


> 
> The kernel has a thorny reputation of people pushing back, which probably
> plays some role in holding that off.
> 
> And it's not like I'm asking for much, I'm not asking you to rewrite the
> document, or take an entirely different approach, I'm just saying that we
> should highlight that :
> 
> 1. LLMs _allow you to send patches end-to-end without expertise_.

Why does this need to be added to the document. I think we should only be
addressing how we handle tool generated content.

> 
> 2. As a result, even though the community (rightly) strongly disapproves of
>    blanket dismissals of series, if we suspect AI slop [I think it's useful
>    to actually use that term], maintains can reject it out of hand.
> 
> Point 2 is absolutely a new thing in my view.

I don't believe that is necessary. I reject patches outright all the time.
Especially checkpatch "fixes" on code that is already in the tree. I just
say: "checkpatch is for patches, not accepted content. If it's not a real
bug, don't use checkpatch."

If the AI code is decent, why reject it? If it's slop, then yeah, you have
a lot of reasons to reject it.

> 
> > treating LLMs like any other tool. That could change any day because
> > some new tool comes along that's better at spamming patches at us. I
> > think that's the point you're trying to make is that the dam might break
> > any day and we should be prepared for it.
> >
> > Is that what it boils down to?  
> 
> I feel I've answered that above.
> 
> >  
> > >> +As with all contributions, individual maintainers have discretion to
> > >> +choose how they handle the contribution. For example, they might:
> > >> +
> > >> + - Treat it just like any other contribution.
> > >> + - Reject it outright.  
> > >
> > > This is really not correct, it's simply not acceptable in the community to
> > > reject series outright without justification. Yes perhaps people do that,
> > > but it's really not something that's accepted.  
> >
> > I'm not quite sure how this gives maintainers a new ability to reject
> > things without justification, or encourages them to reject
> > tool-generated code in a new way.
> >
> > Let's say something generated by "checkpatch.pl --fix" that's trying to
> > patch arch/x86/foo.c lands in my inbox. I personally think it's OK for
> > me as a maintainer to say: "No thanks, checkpatch has burned me too many
> > times in foo.c and I don't trust its output there." To me, that's
> > rejecting it outright.
> >
> > Could you explain a bit how this might encourage bad maintainer behavior?  
> 
> I really don't understand your question or why you're formulating this to
> be about bad maintainer behaviour?
> 
> It's generally frowned upon in the kernel to outright reject series without
> technical justification. I really don't see how you can say that is not the
> case?

If it's AI slop, then I'm sure you could easily find lots of technical
justifications for rejecting it. Why do we need to explicitly state it
here?.

> 
> LLM generated series won't be a trivial checkpatch.pl --fix change, you've
> given a trivially identifiable case that you could absolutely justify.

Is it trivial just because it's checkpatch? I gave another example above
too. But if AI slop is coming in, I'm sure there's lots of reasons to
reject it.

Are you saying that if there's good AI code coming in (I wouldn't call it
slop then) that you want to outright reject it too?

> 
> Again, I'm not really asking for much here. As a maintainer I am (very)
> concerned about the asymmetry between what can be submitted vs. review
> resource.
> 
> And to me being able to reference this document and to say 'sorry this
> appears to be AI slop so we can't accept it' would be really useful.

Then why not come up with a list of reasons AI slop is bad and make a
boiler plate and send that every time. Basically states that if you submit
AI code, the burden is on the submitter to prove that they understand the
code. Or would you like that explicitly stated in this document? Something
like:

- If you submit any type of tool generated code, then it is the
  responsibility of the submitter to prove to the maintainer that they
  understand the code that they are submitting. Otherwise the maintainer
  may simply reject the changes outright.

?

> 
> Referencing a document that tries very hard to say 'NOP' isn't quite so
> useful.

I don't think this document's goal was to be a pointer to show people why
you are rejecting AI submissions. This is just a guideline to how tool
generated code should be submitted.

It's about how things work today. It's not about how things will work going
forward with AI submissions. That document is for another day.

-- Steve
