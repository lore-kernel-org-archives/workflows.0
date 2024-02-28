Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF213BBD9
	for <workflows@vger.kernel.org>; Wed, 28 Feb 2024 15:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709133325; cv=none; b=JJAcuP24r0N8JJ3KKbzn49eTGd0KGZ+VRKzL5OnFkDhO2QDmSq0YdjDiqBsuzJFy+JxEqCcjMZhM5Qp7+Vbd7D5FC4RRLkwN6OsBwTymIJbf3/EZGmmogyaK+1DjQXUp8p3NtlWEATCsepgzHNtjQXtY2A4edJqLuWMxF5E9NVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709133325; c=relaxed/simple;
	bh=OO6UMGw9oGEtPg1LEjzW4kAK7jOJy5Lo4TOaTYmff8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9nJpdHGX2LTrk8rfvoHx6HjH+swwU9rsmlOXmFsRS0a+yqolg3+08kkb1Vyr/jYTCHNZs0+M8JmYFWZiuH8Gt43QHHJN4JxYx4C/AHx8ZgSNIybR8vvI5L8xMb0UCmpPI/nSsVFtMt8rpN/xomF3bCiJn9Hqi3bBRcXiKm4ees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 41SFF79f030230;
	Wed, 28 Feb 2024 16:15:07 +0100
Date: Wed, 28 Feb 2024 16:15:07 +0100
From: Willy Tarreau <w@1wt.eu>
To: Hannes Reinecke <hare@suse.de>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
        tools@kernel.org, workflows@vger.kernel.org,
        Jon Corbet <corbet@lwn.net>
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
Message-ID: <Zd9N+28A9dfSzT67@1wt.eu>
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
 <20240228050007.GB18047@1wt.eu>
 <4fa1cbc7-0f9d-47bf-8ff7-a9b17456431e@suse.de>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fa1cbc7-0f9d-47bf-8ff7-a9b17456431e@suse.de>

On Wed, Feb 28, 2024 at 04:04:28PM +0100, Hannes Reinecke wrote:
> On 2/28/24 06:00, Willy Tarreau wrote:
> > Hi Konstantin,
> > 
> [ .. ]
> > And because of this I didn't find on what boundaries to cut the analysis,
> > If it's "since last time I read my email", it can only be done locally
> > and will be per-user. If it's a summary of a final thread, it's not
> > super interesting and it's better explained (IMHO) on LWN where the
> > hot topics are summarized and developed. If it's the list of threads
> > of the day, I've suspected that there are so many that it's unlikely
> > I'd read all of them every evening or every morning. I've been wondering
> > if an interesting approach would be to only summarize long threads,
> > since most short ones are a patch, a review and an ACK and do not need
> > to be summarized, but I think that most of us seeing a subject repeat
> > over many e-mails will just look at a few exchanges there to get an
> > idea of what's going on.
> > 
> [ snip ]
> 
> Out of personal interest I really have to chime in here.
> You are aware, though, that following this line of thought
> and improving the underlying model (which really shouldn't
> be too hard given the vast body of training data which is LKML)
> we will actually putting LWN and its editors out of business.

No, really, and I mentioned it in the first message, LWN provides good
explanations, links to articles, personal opinions, references etc. I
wouldn't put LWN and a chatbot on the same level at all! One has skilled
writers knowing their topic and explaining how stuff works and why
certain choices are made, the other one is basically the chatty coworker
that everyone prefers not to hear for too long.

Here it's "just" a rough summary of a conversation and it's not capable
of dealing with too large a context. I really love to read LWN to *learn*
some very interesting stuff. A summary like the ones Konstantin and I
shared is more aimed at letting you decide if you're interested in going
deepeer into that thread. And BTW my initial experiments were clearly on
this: "am I interested in reading that thread or should I skip it".

> I would be _VERY_ interesting having a discussion here with the
> relevant parties (Hello Jon!) to see which direction we as a
> community will want to go. Maybe Plumbers and/or Kernel Summit in Vienna
> would be a good place to start.

Most likely, yes.

Willy
