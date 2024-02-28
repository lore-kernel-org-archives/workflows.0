Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC2820B17
	for <workflows@vger.kernel.org>; Wed, 28 Feb 2024 05:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709097087; cv=none; b=ovZ/HvuNt6UFN2uSTmUH91WB+hwpIcOSf2gAUJgYAcYg+a3TMr7DV3xuwvpd1BySxcV2W0IJfTTVwv1qltO/DWWtvomdMpVWV4wkVG+XKVpJ7Q1dcqrPHtugQ9P1YUjbLczDGGmlYQDFmJUjvgsoLSymS0KaOnRSFYzOzd2iPF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709097087; c=relaxed/simple;
	bh=l9gx1ScmkWEJZhISf4PaqVwHu7BGnpOlZzqbeui3NgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWP0vyuK5ziH8Ds2th/tde8OwEzmW+Ds3IbgQPO1Thx3ZE/vVw5JNTEVuKC6xKB0lOyIsPS9EQd791YO+neZdJzdg5gqQWhm7UbjOMw7GVR5IWzgIBZveBJZ4bUy2/exxZgO84V/YEvLBVmWAZOtYg1BnRFeNGaGUtzGaEAYoyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 41S507nE018380;
	Wed, 28 Feb 2024 06:00:07 +0100
Date: Wed, 28 Feb 2024 06:00:07 +0100
From: Willy Tarreau <w@1wt.eu>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org, workflows@vger.kernel.org
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
Message-ID: <20240228050007.GB18047@1wt.eu>
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227-flawless-capybara-of-drama-e09653@lemur>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Konstantin,

On Tue, Feb 27, 2024 at 05:32:34PM -0500, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> I was playing with shell-gpt and wrote a quickie integration that would allow
> retrieving (slimmed-down) threads from lore, feeding them to ChatGPT, and
> asking it to provide some basic analysis of the thread contents. Here's a
> recorded demo session:
> 
> https://asciinema.org/a/643435
> 
> A few notes:
> 
> 1. This is obviously not a replacement for actually reading email, but can
>    potentially be a useful asset for a busy maintainer who just wants a quick
>    summary of a lengthy thread before they look at it in detail.
> 2. This is not free or cheap! To digest a lengthy thread, you can expect
>    ChatGPT to generate enough tokens to cost you $1 or more in API usage fees.
>    I know it's nothing compared to how expensive some of y'all's time is, and
>    you can probably easily get that expensed by your employers, but for many
>    others it's a pretty expensive toy. I managed to make it a bit cheaper by
>    doing some surgery on the threads before feeding them to chatgpt (like
>    removing most of the message headers and throwing out some of the quoted
>    content), but there's a limit to how much we can throw out before the
>    analysis becomes dramatically less useful.
> 3. This only works with ChatGPT-4, as most threads are too long for
>    ChatGPT-3.5 to even process.
> 
> So, the question is -- is this useful at all? Am I wasting time poking in this
> direction, or is this something that would be of benefit to any of you? If the
> latter, I will document how to set this up and commit the thread minimization
> code I hacked together to make it cheaper.

Amusing, I've run experiments about something comparable with my own
e-mails (I'd like to get a few lines summary before reading them), and
thought about being able to summarize long LKML threads to still know
what is currently going on without having to spend a lot of time on
all of them.

I figured a number of shortcomings about this: I suspect that those
most interested in such output are either, a bit like me, not much
active on kernel development, or focus on a specific area and mostly
want to stay aware of ongoing changes in other areas they're really
not familiar with.

And because of this I didn't find on what boundaries to cut the analysis,
If it's "since last time I read my email", it can only be done locally
and will be per-user. If it's a summary of a final thread, it's not
super interesting and it's better explained (IMHO) on LWN where the
hot topics are summarized and developed. If it's the list of threads
of the day, I've suspected that there are so many that it's unlikely
I'd read all of them every evening or every morning. I've been wondering
if an interesting approach would be to only summarize long threads,
since most short ones are a patch, a review and an ACK and do not need
to be summarized, but I think that most of us seeing a subject repeat
over many e-mails will just look at a few exchanges there to get an
idea of what's going on.

Ideally having a link in each thread to a place where a summary is
being held could be nice, except that it's not how such tools work.
You certainly don't want to re-run the analysis on a whole thread
every time it grows by a few messages due to processing time and
cost.

Also regarding processing costs, I've had extremely good results using
the Mixtral-8x7B LLM in instruct mode running locally. It has a 32k context
like GPT4. And if not enough, given that most of a long thread's contents
is in fact quoted text, it could be sufficient to drop multiple indents
to preserve a response and its context while dropping most of the repeat
(it cuts your example thread in roughly half). But this still takes quite
a bit of processing time: processing the 14 mails from the thread above
took 13 minutes on a 80-core Ampere Altra system (no GPU involved here).
This roughly costs 1 minute per e-mail, that's a lot per day, not counting
the time needed to tune the prompt to get the best results!

Overall, while I think that some people might find "something like this"
useful, most of them would want it "slightly different" to be useful to
them.

Just my two cents,
Willy
