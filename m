Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5155D730
	for <workflows@vger.kernel.org>; Thu, 29 Feb 2024 09:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199040; cv=none; b=s9WUBXehEcC5oekIAzuashbNH/pYcBYIWS6k3al8cgT0dPkRknUP7NDtmBXcEkbLyD9M8UaNmaMvqT1581S6FKMWfHKAVcvG8bV2Ji8HAMZ2kTaxEeERT+7eu9e0E3d2qpv4dHZS4G1FkG6RRl99tIeKoSzZ5bnec/pk3b1JCWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199040; c=relaxed/simple;
	bh=9qGGAbuf/x20ROeb4KA6+GgplMcOYlv1HIvFZSgu+QI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SRKEl0byFtGAivabf9OL4luiiKR04EIUyxxrbmtwg2fPATyIcb8PpuZ024LZZPsoZyDyOxpxhUj1mvOeemSJ4msPCStU7EiEghjTM+GwvL/ZBoaqH/j3cEC8XDacg56VL1TwqhWgln6zVA6tnNtNXLkTWg9sUzlSYoOPZyuq+60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=kOTno5Qr; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=T/KGnrnu; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="kOTno5Qr";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="T/KGnrnu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1709199037;
	bh=9qGGAbuf/x20ROeb4KA6+GgplMcOYlv1HIvFZSgu+QI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=kOTno5Qr5m59x5m94E9Nngu8Yhv0fwJWj1Q8wWnSxziqZzPcGvPDAKNayw6AZR3bU
	 ysgQtvVGwF0y4oYfBb7BbdLyERfLW0feVQwXMM6EiVdCtPIts0YHIkqcIlrDz5kemh
	 Cl7r4tC3k7KnvkFQ8aVhXTGWKxOMtR6faBVlK9YU=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 360461286C85;
	Thu, 29 Feb 2024 04:30:37 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id OxIsbgPY5qNf; Thu, 29 Feb 2024 04:30:37 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1709199036;
	bh=9qGGAbuf/x20ROeb4KA6+GgplMcOYlv1HIvFZSgu+QI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=T/KGnrnuvCfoMTAmjAC8qOUliAXk1ZQ6G8d0FTNvYMA3iFJPRa13VzlZVnPyN+LeC
	 bRCS6ULpzgdaEQgs/vxDX82svNvCsoVXAxb1bELojnVVQEa0TIM/gR+4d1VVCyZEyJ
	 8h6YrTsdUh4O4q7rk7qPyHDZ3EV1gAbnH+Cc/xj0=
Received: from [10.0.15.72] (unknown [49.231.15.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 50E3B1286BFE;
	Thu, 29 Feb 2024 04:30:35 -0500 (EST)
Message-ID: <b2797ce67bdb6aa94cff92f21b72965396e932a1.camel@HansenPartnership.com>
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Bart Van Assche <bvanassche@acm.org>, Konstantin Ryabitsev
	 <konstantin@linuxfoundation.org>, users@kernel.org, tools@kernel.org, 
	workflows@vger.kernel.org
Date: Thu, 29 Feb 2024 16:30:31 +0700
In-Reply-To: <964843ca-891b-4039-94b3-ed1046df2d69@acm.org>
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
	 <964843ca-891b-4039-94b3-ed1046df2d69@acm.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2024-02-28 at 10:55 -0800, Bart Van Assche wrote:
> On 2/27/24 14:32, Konstantin Ryabitsev wrote:
> > I was playing with shell-gpt and wrote a quickie integration that
> > would allow
> > retrieving (slimmed-down) threads from lore, feeding them to
> > ChatGPT, and
> > asking it to provide some basic analysis of the thread contents.
> > Here's a
> > recorded demo session:
> > 
> > https://asciinema.org/a/643435
> > 
> > A few notes:
> > 
> > 1. This is obviously not a replacement for actually reading email,
> > but can
> >     potentially be a useful asset for a busy maintainer who just
> > wants a quick
> >     summary of a lengthy thread before they look at it in detail.
> > 2. This is not free or cheap! To digest a lengthy thread, you can
> > expect
> >     ChatGPT to generate enough tokens to cost you $1 or more in API
> > usage fees.
> >     I know it's nothing compared to how expensive some of y'all's
> > time is, and
> >     you can probably easily get that expensed by your employers,
> > but for many
> >     others it's a pretty expensive toy. I managed to make it a bit
> > cheaper by
> >     doing some surgery on the threads before feeding them to
> > chatgpt (like
> >     removing most of the message headers and throwing out some of
> > the quoted
> >     content), but there's a limit to how much we can throw out
> > before the
> >     analysis becomes dramatically less useful.
> > 3. This only works with ChatGPT-4, as most threads are too long for
> >     ChatGPT-3.5 to even process.
> > 
> > So, the question is -- is this useful at all? Am I wasting time
> > poking in this direction, or is this something that would be of
> > benefit to any of you? If the latter, I will document how to set
> > this up and commit the thread minimization code I hacked together
> > to make it cheaper.
> 
> Please do not publish the summaries generated by ChatGPT on the web.
> If these summaries would be published on the world wide web, ChatGPT
> or other LLMs probably would use these summaries as input data. If
> there would be any mistakes in these summaries, then these mistakes
> would end up being used as input data by multiple LLMs.

I don't believe this is true: any output from an LLM trained on the web
will have only add a neutral bias to the existing web content (it won't
push a learning model one way or another because it's the output
summary of the current learning).  Or to put it another way if mistakes
are made in the summary because of the training, training a model on
the mistaken output won't increase (or decrease) the number of mistakes
it makes next time.  Now if the model was only partially trained it
will bias towards the partial training, but most models try to be fully
trained.

James

