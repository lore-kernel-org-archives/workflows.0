Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D1D6A004
	for <workflows@vger.kernel.org>; Wed, 28 Feb 2024 19:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709147788; cv=none; b=WzG1i047DLB6t6AA+ezK1QMsxIv4dPeUYNVcVMqTFd2lqsWxFqvHcTloC3fMAI1yWqk3Hn6+A+iHeLj2iZt6roX+SGqE/BD/nsmDujx98scwYUcAGqvRg19MN7GX3ny0O/XLfxmE8DpwaBKItcnsZxiNE9BzEAyeFRq1PZIrIcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709147788; c=relaxed/simple;
	bh=LkddQYeRa67+aFPRqPqT1yNBE4/TmUZkLBPaGqXoZM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqnzFq4VvBeI2BO9q7mzq04e5WynFx4S6GoupedtkoL1ssHuTNg89/h2NjaveFrULh2NJ8NSDOddQ4No7juwfhw5mqJftl1KQsafiQuPE+oedPkcZjfPUZBLoUDW1CbScu1NmP8vlmzNxzVJl+wA1JOznUrPZVCcQzIwF9D65mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CXKo+HNq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CXKo+HNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64754C433F1;
	Wed, 28 Feb 2024 19:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709147787;
	bh=LkddQYeRa67+aFPRqPqT1yNBE4/TmUZkLBPaGqXoZM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CXKo+HNqJczHJ3wglchg0ko4MGOsMXuiyVeOt8Z5/m53ocITFpr1ko7ZTr56FtJ0c
	 C7gajTyZW8sQcKGQl8EaPD0+Yr7UNiF6HmVO3JAK0gB1jELOX+W7gxetVINddvkeuh
	 wVKv97XzilWIqqSNiZYnAxfxpF2gYVE/LV79ilu0=
Date: Wed, 28 Feb 2024 14:16:24 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Mark Brown <broonie@kernel.org>, users@kernel.org, tools@kernel.org, 
	workflows@vger.kernel.org
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
Message-ID: <20240228-kind-obedient-chinchilla-ad7c49@lemur>
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
 <20240228050007.GB18047@1wt.eu>
 <701aad76-2706-4e33-b8ba-9c76282e26d1@sirena.org.uk>
 <20240228-ethereal-swine-of-renovation-b1d7c7@meerkat>
 <Zd9RcdLAiEdB/7w2@1wt.eu>
 <20240228-urban-petrel-of-serenity-037e7d@lemur>
 <Zd90LW6jZvBBP7X1@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zd90LW6jZvBBP7X1@1wt.eu>

On Wed, Feb 28, 2024 at 06:58:05PM +0100, Willy Tarreau wrote:
> > For the moment, I will document how I got this working and maybe look into
> > further shrinking the amount of data that would be needed to be sent to the
> > LLM. I will definitely need to make it easy to use a local model, since
> > relying on a proprietary service (of questionable repute in the eyes of many)
> > would not be in the true spirit of what we are all trying to do here.
> 
> I tend to think that these solutions will evolve very quickly both hosted
> and local, and it's prudent not to stick to a single approach anyway.

Well, in theory, and given time and budget, we can totally imagine a service
for maintainers that is trained on the entirety of lore and continuously
updated. It would be like lei on steroids.

Imagine a session like the following, typed by an imaginary maintainer:

    >>> Are there any new patches posted for me?

    Using your previously specified criteria, the following relevant series have
    been submitted since your last inquiry:

     1. [PATCH 0/5] foodrv: fixes to match the kernel coding style
     2. [PATCH v2] foodrv: initial support for foodev-alpha3000
     3. [PATCH v3 000/255] mm: remove the FLUB allocator
     4. [PATCH RFC v17 00/23] foodrv: rewrite in rust

    >>> Remove any series that received negative reviews and any threads that I already replied to.

    After removing the patch series that received negative reviews from automated
    testing tools and the series containing your reply, the following threads
    remain:

     1. [PATCH 0/5] foodrv: fixes to match the kernel coding style
     2. [PATCH v2] foodrv: initial support for foodev-alpha3000

    >>> Apply these series to my tree in individual branches and queue tests.

     1. Applied as review/foodrv-fixes-match-kernel-coding-style
     2. Applied as review/v2-foodrv-initial-support-foodev-alpha3000
     3. Pushed to ci.corpforge.example.com for automated testing

    >>> Any new relevant discussions?

    Using your previously specified criteria, the following new discussions are
    relevant to you:

     1. CVE-5555-1212: denial of service in foodrv device drivers
     2. [Bug 5551212] foodrv melted my keyboard!
     3. Is anyone else getting weird results running test t/barbaz_123?

    >>> Summarize the bug report.

    The bug report, submitted by Krazy Person <krazy@example.com>, claims that the
    version of foodrv shipping with stable kernel 6.6.18 melted their keyboard due
    to sonar feedback loop between their tinfoil hat and the CIA monitoring
    devices implanted in their USB cables.

    >>> Close this bug report as invalid. Politely explain that this is not possible.

    Posted a new comment from Busy Maintainer:

    Hello, thank you for your bug report. At this time, we do not believe that
    interaction between foodrv and the keyboard would lead to a thermal event
    of this magnitude.

    Bug 5551212 closed as RESOLVED/INVALID.

    >>> Send the other two threads to my inbox and include any future updates.

    lei: sending to your inbox:

     1. CVE-5555-1212: denial of service in foodrv device drivers (5 messages)
     2. Is anyone else getting weird results running test t/barbaz_123? (72 messages)

    lei: configured to retrieve any further thread updates

    >>> (etc)

Large parts of this can be accomplished today already, some with minor
integration functions (lei, bugtracker, git, etc). We should, of course, worry
about LLM hallucinating or just being plain buggy, but we can certainly
imagine a scenario where this is a usable workflow alongside the more
traditional reading and replying to mail, and it's not even from the
realm of some trek-inspired fantasy.

-K
