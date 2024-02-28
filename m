Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA8E15B99E
	for <workflows@vger.kernel.org>; Wed, 28 Feb 2024 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709134206; cv=none; b=Q1ppDxFY7Tmx2jKTkRPyQ9aRcGEzPL5Y7lxSjJUJYYSVs+pdfu0Kf87HUrT4WtmAf+7lG0l//gJKO/M0ozYredXZOacHjS/G/iDainO8RhcCuRS/ZpEJISuXHwyqgQX3pmEYsNCZwELYLMymAuVLihaEkwYrtfeneDKbgCPSPX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709134206; c=relaxed/simple;
	bh=HzW25ttHcNHplZqxmuYBxPaJ0rm4NAnA0NCbj23oNVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KFFInnlkRbYovJ0GKyZViyXz6nj5+VNPHHg3KHdAxL6S8XD4tFEs4meImHT8IHIUIBE6cbA20LaJ/pnfEMjsnrcZdKzHEZrh0wvq/ekHVaMzU46Gj5Mdf7WutiqFJr9KdGY98ofG/pVK2G5I3irPgYAH5qrp3BT7d9oOXzCQ9Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 41SFTrQv032070;
	Wed, 28 Feb 2024 16:29:53 +0100
Date: Wed, 28 Feb 2024 16:29:53 +0100
From: Willy Tarreau <w@1wt.eu>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, users@kernel.org, tools@kernel.org,
        workflows@vger.kernel.org
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
Message-ID: <Zd9RcdLAiEdB/7w2@1wt.eu>
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
 <20240228050007.GB18047@1wt.eu>
 <701aad76-2706-4e33-b8ba-9c76282e26d1@sirena.org.uk>
 <20240228-ethereal-swine-of-renovation-b1d7c7@meerkat>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240228-ethereal-swine-of-renovation-b1d7c7@meerkat>

On Wed, Feb 28, 2024 at 10:22:41AM -0500, Konstantin Ryabitsev wrote:
> On Wed, Feb 28, 2024 at 02:03:31PM +0000, Mark Brown wrote:
> > > I figured a number of shortcomings about this: I suspect that those
> > > most interested in such output are either, a bit like me, not much
> > > active on kernel development, or focus on a specific area and mostly
> > > want to stay aware of ongoing changes in other areas they're really
> > > not familiar with.
> > 
> > I can imagine using this sort of thing for the case where I get to my
> > inbox in the morning and there's some enormous thread appeared overnight
> > with people arguing and I'm trying to get a handle on what the various
> > subthreads are all about.  The demo didn't cover exactly that case but
> > it looked like it might be able to give some sort of useful steer.
> 
> Another use for this that I could think is a way to summarize digests.
> Currently, if you choose a digest subscription, you will receive a single
> email with message subjects and all the new messages as individual
> attachments. It would be interesting to see if we can send out a "here's
> what's new" summary with links to threads instead.

Indeed!

> The challenge would be to do it in a way that doesn't bankrupt LFIT in the
> process. :)

That's exactly why it would make sense to invest in one large machine
and let it operate locally while "only" paying the power bill.

Willy
