Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE8818C38;
	Sat, 13 Jul 2024 16:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720886851; cv=none; b=cTSlVR9Mc8zvPPuph3I5BIvkCZvzuITKXJBltEavZaoYyGtMeiCq/MWhiPZUo70ouTgfk+ggZ6CKnrSJpkMKnW/R27+do9ICWd8hMlOnnC7MOJtWOWM0ldgYlRiYzA9+I4QSoSYTraiiyHxK73+XbYmVTOPsTZXbkZ4OJpMbNsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720886851; c=relaxed/simple;
	bh=PWvmxgKjj1D3AF0vQs5mzbcaGMlbhae522A9PeBSmkA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RuYzW7vCCTaLYPDwZy5v27hESQ8GMkUhKF4LMYFZk4khhUOnAKn7jCqRnoQIfLKINB0KverbWEP21tqI2+slNP7CqLxxQ8bpc2Lm2xDmJIw4+16vKEF7TP83vMJ/J5inSjN9sb8SzqJO88vtRNTC8R155QhQIItZuVPDIHMUh40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIkaN5bf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIkaN5bf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7057DC32781;
	Sat, 13 Jul 2024 16:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720886851;
	bh=PWvmxgKjj1D3AF0vQs5mzbcaGMlbhae522A9PeBSmkA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MIkaN5bfI/BgGdRvV4rTeOMcaGE8vpEECKwJE+X2cXpmGfpXtrLi2C4nWdLxBDIMC
	 VuRZBFnSwb66cAUdScYhy0BMYmKomX0B1hFf32pKzlw5LaHyyipygvxT4JdpnGxKvc
	 CKGi+7H5VGR+kTuIgcZqrrd5g3j07ZyiSeQyiswI31ZjtyxZrkyjuKOy5igIWVa7z1
	 iWfqW30g0aFpJxGtxspG0YOeLJVvT6zS1DO8LTqFgkaa6eig+thlPQSYVw83EKuRR+
	 WIwwUYrQYduBh1NfX9YFQYVM/H1s3pM+TlVsG8QSYXAB3bAPwCr/xCUG8F9hVoN6Z/
	 QSV2iMjzKQM6Q==
Date: Sat, 13 Jul 2024 18:07:25 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>, corbet@lwn.net,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <20240713180725.32972358@foz.lan>
In-Reply-To: <20240713141956.GH10946@pendragon.ideasonboard.com>
References: <20240712144903.392284-1-kuba@kernel.org>
	<669179424b589_1a77429479@dwillia2-xfh.jf.intel.com.notmuch>
	<20240712170558.50c89238@kernel.org>
	<20240713101328.72734cb0@foz.lan>
	<20240713141956.GH10946@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 13 Jul 2024 17:19:56 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> On Sat, Jul 13, 2024 at 10:13:28AM +0200, Mauro Carvalho Chehab wrote:
> > Em Fri, 12 Jul 2024 17:05:58 -0700 Jakub Kicinski escreveu:  
> > > On Fri, 12 Jul 2024 11:43:14 -0700 Dan Williams wrote:  
> > > > This reads as a vague ambiguous quasi-threat with no actionable way to
> > > > enforce it. In contrast, successful maintainers already have a sense of
> > > > the benefits of pushing discussions to the list as much as possible.
> > > > 
> > > > For new and growing maintainers, which I assume are the audience for
> > > > this guidance, that are unaware of the pitfalls of taking conversations
> > > > off-list, they likely need help understanding the *benefits* of open
> > > > development.    
> > > 
> > > I don't think so. If your boss comes to you and says "Dan, from now on
> > > try not to reply to customers on the list, open a ticket first and only
> > > reply once tickets is resolved". Is it more useful to you to be able to
> > > extol the benefits of open source process; or to tell them "this is not
> > > allowed, here's a link to a quasi-threat"?  
> > 
> > No matter what you write, between your text and their boss's directive,
> > I bet the latter will be a lot more effective.  
> 
> I don't agree with this. I have found clear written rules valuable
> personally when discussing with management. Being able to point to
> upstream policies and tell "this is not allowed" helped change internal
> processes. It will obviously not have a 100% success rate, but it's not
> useless.

That's basically what I said: such things happen top/down and not at
developer/maintainer level. Sure having it documented somewhere, on
some document that management would actually read can be useful on
discussions, specially when companies hire a third party company to
help with their upstream process.

The point is: a developer-focused document - or even a submission
document process won't affect how companies do their inner source
development: companies that have internally heavy development teams
will basically keep running their own internal development cycle,
being concerned about upstream only when their product managers
authorize them to publicly disclosure patches.

If the goal is to create a management awareness about how to better
cope with upstream, then my suggestion is to write a new document
from scratch [1] focusing specifically on that, containing a list of
best practices with focus on orienting management inside companies 
about how to deal with developers and maintainers working on
upstream.

[1] there is a document there already that seems to be focused at
    management style, but it doesn't cover any best practices
    with regards to innersource/upstream:

	Documentation/process/management-style.rst

> > > > So if this goes in as is, so be it, but it feels like a missed
> > > > opportunity to extoll the virtues of open development. The benefits are
> > > > in the same vector as the "release early, release often" guidance where
> > > > the urge to polish a solution in private is a common trait of newcomers.
> > > > Lets document some tribal knowledge of how one moves past that first
> > > > instinct.    
> > > 
> > > Hm, the disconnect may be that you think this happens with maintainers
> > > without upstream experience. So we can train them up to be better.  
> > 
> > No, that's the case where you can still "fix" maintainer's behaviors.
> >   
> > > In most cases it happens to folks with experience who are good
> > > maintainers. They just get 2 orders of magnitudes more patches from
> > > inside the company that outside. Then a contribution comes from outside,
> > > the maintainer is overworked, and tries to shoehorn the patch into the
> > > existing, internal-only process.  
> > 
> > It seems unavoidable that internal patches have higher priorities even
> > if the maintainer is not overloaded.
> > 
> > Even on a perfect world, the degree of confidence on internal patches is 
> > usually orders of magnitude higher, as internal devs have access to internal
> > product documentation, future line of products that will re-use the same
> > driver and, on larger projects, will also be already tested by internal
> > CI-based regression tests.
> > 
> > The external patches won't have that, so they need to be reviewed by
> > an internal developer, checked against internal docs and then submitted to 
> > the company's internal CI regression test infra to achieve the same degree
> > of confidence.  
> 
> We don't seem to live in the same (perfect or imperfect) world. In my
> experience, contributions from external kernel developers are often
> better than patches originating from within a company. External
> contributors are more used to follow proper upstream review processes.

It is not about being better/worse. It is about fitting inside the
innersource processes related to quality ensurance (QA). 

Vendors that see their Linux driver as part of their product delivery have 
such processes and won't be willing to accept patches that don't pass on
their processes.

So, all patches (internal or external ones) need to be submitted to
their QA processes, effectively meaning that someone inside such 
companies should be responsible for reviewing the patch.

Heh, you can see this even on distributions like Debian, Ubuntu, 
Fedora, openSUSE - and even on open source userspace projects:
if you submit a bug report or a patch, someone will handle
the ticket, reviewing your patch and/or writing their own patches
to solve the issues.

Inside companies (in special big ones), it usually means that a 
manager or a triage team will pick the bug report/issue and then 
delegate it to an internal developer, who will be internally
owning the upstream patch set, doing tests, reviews and running
it on the company's CI tools.

Smaller companies, companies that are starting now with their
upstream process and companies where Linux is not their main focus
usually delegate it to third party companies, who will be handling
it on their behalf or have small open source teams. Those are the
ones where changing processes are easier. 

Bigger companies have more complex development processes. Among those,
there are the ones where Linux is part of their products. They
are usually responsible for a vast amount of Kernel patches[1].
Changing their process is hard and takes a lot of time/efforts.

[1] Looking at https://lwn.net/Articles/972605/, it can be seen
that: 7.4% is unknown, 6.8% is none and 2.0% consulting, meaning
that more than 80% is credited to "direct" contribution.
Granted, part of those were actually be done by third parties
(or with their help). Still, just the top 17 companies listed there
are responsible for more than 50% of the upstream changes. I bet
that almost all of those (if not all) have their own internal 
innersource processes, and patches are only accepted once the
company developers/maintainers handled external patches and have
them passed though their QA systems.

Thanks,
Mauro
