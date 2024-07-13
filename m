Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18AE18C38;
	Sat, 13 Jul 2024 16:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720887939; cv=none; b=N5ZtgjCAZNl5rPWPpSMfooGTES7K2S9zIRU60UkR7KPnbXaTEXUdNtFuSvCw8vjiikcl3vpKWv/YFknINOWttLbDIJvNVviZnrGUFJXQa+9+17qbkWF9k4C33QaxtyUFGE+W+f8XtEcXWN3NWg4NQeg+QDE4xXoKJE3g6sl+saw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720887939; c=relaxed/simple;
	bh=U36GibEpQ7+ccoy0M1dj5OjLjmRM3/2Yit4ZWOZ9Mr4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M6FLAfSraRKvVm5egokm/0l6Q6Db+kJrZSQ98e9D5mcSPI3/AmKlEjaq6BBlud0/jMWrUZJJJhXHdXZcZOYsOzd59dcUUQaNm/v7FQG72xymuncNYkgryEBiy17Q/KdjKC3TwJN5EppvqESR8L+jcRqZJh5JKH6uiQfzzJ3szEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5t81GWU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5t81GWU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E695C32781;
	Sat, 13 Jul 2024 16:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720887938;
	bh=U36GibEpQ7+ccoy0M1dj5OjLjmRM3/2Yit4ZWOZ9Mr4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H5t81GWUz/B4OhTaQZ9hadMXaABTz6Amr9ZdkeZW9vbsY5nCJf0me7vnQsaVvaMm7
	 /AJvAh7QYc/pHPgY05U7APO7zMNl2zA2ncwODOXXIxmFFL837LgJl2UcEmvqsYKsxp
	 BMjcNoa2MMxXxNXNcvvbYRojY47Q6WLO1dyLDSWZWpr7Exsh00pDocu4eLlPkAAm6R
	 UEel1Riz1jCiavGsJh+LHvA9nmYcwJbMRtAp03CF5wG/pmh3HOmK3p4EHFBkjPd48Z
	 RllFzhxICZaynB6Y7Vvx7rgXOF0gn3NJZgzRZIwQWrGp7Lzi6EJjX2g794DMsA+j3U
	 Tm9uFvOdupJww==
Date: Sat, 13 Jul 2024 18:25:33 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <20240713182533.6aeb2eb7@foz.lan>
In-Reply-To: <70562aa0-a0bc-4a10-a2ef-6ba64245a752@gmail.com>
References: <20240712144903.392284-1-kuba@kernel.org>
	<70562aa0-a0bc-4a10-a2ef-6ba64245a752@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Sat, 13 Jul 2024 09:28:31 -0500
Carlos Bilbao <carlos.bilbao.osdev@gmail.com> escreveu:

> On 7/12/24 09:49, Jakub Kicinski wrote:
> 
> > Multiple vendors seem to prefer taking discussions off list, and
> > ask contributors to work with them privately rather than just send
> > patches to the list. I'd imagine this is because it's hard to fit in
> > time for random developers popping up with features to review into
> > packed schedule. From what I've seen "work in private" usually means
> > someone on the company side will be assigned to handle the interaction,
> > possibly months later. In worst case, the person scheduled to help
> > the contributor takes over and writes the code themselves.
> > This is not how the community is supposed to work.  
> 
> 
> So this is completely unenforceable, but as Mauro mentioned, it's an
> opportunity to talk about this.
> For starters, let's be clear about what the kernel community is actually
> losing from closed-door discussions. 

Makes sense to me, but IMO it should also be describing what companies
are losing with closed-door discussions: money and time to market. 

The usual excuse for innersource development practices is that this speeds
up product development. In practice, this is often a false premise.

Investing on closed door discussions and then send patch series only
when internal development is done has two major drawbacks from company PoV:

- Other companies with faster/better upstream companies may end having
  solutions merged upstream quicker, reducing or eliminating company market 
  competitive advantages. Also, it means that the internal development will
  need to restart from the beginning, to follow the kAPI interfaces that
  were  proposed/added by other vendors;

- Even if the company is the first to upstream, maintainers may not
  agree with the developed solution, requiring substantial changes,
  and delaying product delivery.

> E.g., if a company wants to fix their
> driver, and an employee suggests approach A in an internal discussion, but
> someone else prefers approach B, which is then shared publicly on the
> mailing lists--is the real issue that the community did not get a chance to
> learn about approach A? To discuss it, weigh the pros and cons, and share
> opinions? If so, we should note that for published patches preceded by an
> internal debate, it's encouraged to include some context in the cover
> letters about why different approaches were _not_taken.
> >
> > Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> > ---
> > CC: workflows@vger.kernel.org
> > CC: linux-doc@vger.kernel.org
> > ---
> >  .../maintainer/feature-and-driver-maintainers.rst     | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/Documentation/maintainer/feature-and-driver-maintainers.rst b/Documentation/maintainer/feature-and-driver-maintainers.rst
> > index f04cc183e1de..ac7798280201 100644
> > --- a/Documentation/maintainer/feature-and-driver-maintainers.rst
> > +++ b/Documentation/maintainer/feature-and-driver-maintainers.rst
> > @@ -83,6 +83,17 @@ bugs as well, if the report is of reasonable quality or indicates a
> >  problem that might be severe -- especially if they have *Supported*
> >  status of the codebase in the MAINTAINERS file.
> >  
> > +Open development
> > +----------------
> > +
> > +Discussions about user reported issues, and development of new code
> > +should be conducted in a manner typical for the larger subsystem.
> > +It is common for development within a single company to be conducted
> > +behind closed doors. However, maintainers must not redirect discussions
> > +and development related to the upstream code from the upstream mailing lists
> > +to closed forums or private conversations. Reasonable exceptions to this
> > +guidance include discussions about security related issues.
> > +
> >  Selecting the maintainer
> >  ========================
> >    
> 
> 
> Thanks,
> 
> Carlos
> 



Thanks,
Mauro
