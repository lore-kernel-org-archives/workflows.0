Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050FE40848
	for <workflows@vger.kernel.org>; Wed, 28 Feb 2024 17:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143100; cv=none; b=BMa75hNWXAdMWGVfnuvaOx9lVFzKw3XvHZJJfDLc74pehy6D5+y38x49gK21quVddwCIAF5yiu4rV65qhe7Mugd7znVaJHyMlO1nE+OpTYVdPs9bdwxUU/8/X438o5ivPt7XDp8qz2/fzAyGhBvz2SnOQDwDmVph6rt7DmCWDzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143100; c=relaxed/simple;
	bh=+iM3fQgNnRsoxneYmBsW/G8jsKY5yQWeAWebk0zjZ5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/SCNQ9me2A3v/nWRZOI9v2llEat+kLRtG1DqFdsiIIRsO2u77OwZfXKlFGmky8rMM11i7nFzNoWD48KMTyCzasp+7hPOH0HqBAcIR8Yo/wtIqIEzhWuPCFG8X9i0sh7UOFGG27qIMitU70eGvL05Tj7viQrC1VL8tSfrHXuiIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 41SHw510014019;
	Wed, 28 Feb 2024 18:58:05 +0100
Date: Wed, 28 Feb 2024 18:58:05 +0100
From: Willy Tarreau <w@1wt.eu>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, users@kernel.org, tools@kernel.org,
        workflows@vger.kernel.org
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
Message-ID: <Zd90LW6jZvBBP7X1@1wt.eu>
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
 <20240228050007.GB18047@1wt.eu>
 <701aad76-2706-4e33-b8ba-9c76282e26d1@sirena.org.uk>
 <20240228-ethereal-swine-of-renovation-b1d7c7@meerkat>
 <Zd9RcdLAiEdB/7w2@1wt.eu>
 <20240228-urban-petrel-of-serenity-037e7d@lemur>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240228-urban-petrel-of-serenity-037e7d@lemur>

On Wed, Feb 28, 2024 at 12:52:43PM -0500, Konstantin Ryabitsev wrote:
> On Wed, Feb 28, 2024 at 04:29:53PM +0100, Willy Tarreau wrote:
> > > Another use for this that I could think is a way to summarize digests.
> > > Currently, if you choose a digest subscription, you will receive a single
> > > email with message subjects and all the new messages as individual
> > > attachments. It would be interesting to see if we can send out a "here's
> > > what's new" summary with links to threads instead.
> > 
> > Indeed!
> > 
> > > The challenge would be to do it in a way that doesn't bankrupt LFIT in the
> > > process. :)
> > 
> > That's exactly why it would make sense to invest in one large machine
> > and let it operate locally while "only" paying the power bill.
> 
> I'm not sure how realistic this is, if it takes 10 minutes to process a single
> 4000-word thread. :)

I know. People are getting way better perfs with GPUs as well as on Macs
particularly. I have not investigated such options at all, I'm only
relying on commodity hardware. I shared the commands so that those
interested and with the hardware can attempt it as well. I don't know
how far we can shrink that time.

> With ChatGPT it would probably cost thousands of dollars
> daily if we did this for large lists (and it doesn't really make sense to do
> this on small lists anyway, as the whole purpose behind the idea is to
> summarize lists with lots of traffic).

Sure.

> For the moment, I will document how I got this working and maybe look into
> further shrinking the amount of data that would be needed to be sent to the
> LLM. I will definitely need to make it easy to use a local model, since
> relying on a proprietary service (of questionable repute in the eyes of many)
> would not be in the true spirit of what we are all trying to do here.

I tend to think that these solutions will evolve very quickly both hosted
and local, and it's prudent not to stick to a single approach anyway.

> As I
> said, I was mostly toying around with $25 worth credits that I had with
> OpenAI.

And that was a great experience showing really interesting results!

Cheers,
Willy
