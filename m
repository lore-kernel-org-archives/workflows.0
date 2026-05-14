Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8710527F75C;
	Thu, 14 May 2026 13:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764400; cv=none; b=N3GsyvBwHYdiSaTV8dOIx7swaD815b76zSUQkzAib0Hdv65Kim/4zrFrN9pCWsqN5wE+mJsbQxadMibUaZBTZxJBJHUlzhhjhNzZjxqNOyy7/9dCtcKs3L2ZD0bARK8XPVI/XUbAxNEiKsL95UbUE4wwE66uE9dmv+KgjslvVNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764400; c=relaxed/simple;
	bh=1nFOUIa/8pPk0LZvW1qt9ilqeeejD5PegI/nT7rHgaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kX92jN2pdWL81sF5++UCRjxPxcnjUTccx00ukL4gL/BBz5pHsnWG+olXL98ZQCRo8bzM4b6svpv0XokXexchrGmWJSFkc3pSvfdx/7Gywl6Cp6xjVUORtmHkSp5Ox5c+1N3wVHZjcohdqP5AWQIQHegh0yfqXtFE7ZW3xp2xEnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=YfD+rVQB; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="YfD+rVQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778764395; bh=ZqsfaPzfQtB4bi3pAMOrz9KbTiQ+zkLQUt9ZC+CcUFY=;
	h=From:Message-ID:From;
	b=YfD+rVQBhuMw155j9kxJ/CVs/uh7BfqFjzm4KV8YK3KcPdW2Rf6/jMCzuFB39LwOK
	 /zesVFMQnUF6/iqiC3SHLYn4tweWZjS/l29HVduzhAQ57XsCWzffiU7pddyWI9DAqp
	 XHwxVDq7uIoc+qWxuCwfn/I+UY4/QhTAbATbzL4U=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 7FDBEC0A34;
	Thu, 14 May 2026 15:13:15 +0200 (CEST)
Date: Thu, 14 May 2026 15:13:15 +0200
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>,
        skhan@linuxfoundation.org, security@kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <agXKa7Jhu9zMCnv2@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-3-w@1wt.eu>
 <87wlx8o87g.fsf@trenco.lwn.net>
 <2026051333-puzzle-smokiness-8096@gregkh>
 <agRfFoMC2Gcu0Esz@1wt.eu>
 <87ecjfmpzj.fsf@trenco.lwn.net>
 <agR1-2Sj1KO9oM2k@1wt.eu>
 <87fr3v6my2.fsf@trenco.lwn.net>
 <agVQWKR63Nqs8rp-@1wt.eu>
 <87wlx6uqob.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wlx6uqob.fsf@trenco.lwn.net>

On Thu, May 14, 2026 at 06:22:12AM -0600, Jonathan Corbet wrote:
> Willy Tarreau <w@1wt.eu> writes:
> 
> >> (While I was there, I noticed that threat-model.rst has no SPDX line;
> >> what's your preference there?)
> >
> > I didn't notice any was needed, I tried to get inspiration from other
> > files for the format (I'm still not familiar with the rst format
> > though this time I could successfully install the tools).
> 
> In theory every file in the kernel tree is supposed to have one; many
> documentation files lag a bit behind on that front, but we try...

OK thanks for the background.

> > Same for
> > the label at the top BTW, I just did what I found somewhere else,
> > probably security-bugs.rst which is similar (no SPDX line and has a
> > label). So regarding SPDX, I do not have any preference. If one is
> > needed, let's pick what's used by default, I do not care, as long
> > as it allows the doc to be published.
> 
> The top-of-file label got started somewhere and has been cargo-culted
> extensively since then; it has proved hard to eradicate.

I'm not surprised, everyone likely does like me: look at another file
to see what it should look like, and does it again. Apparently in
security-bugs it was added 10 years ago by this:

  609d99a3b72e3 ("Documentation/HOWTO: add cross-references to other documents")

> As for SPDX, the most common is the basic:
> 
> .. SPDX-License-Identifier: GPL-2.0

This works for me for the new file. For existing security-bugs, why
not do the same at the same time ? Before SPDX tags it has been covered
by GPL-2.0 as well via the COPYING file, and further contributions did
not change its license. And in the worst case a total of 10 people
touched the 3 names of that file over its Git history, I doubt there
would be too much resistance against an update.

Willy
