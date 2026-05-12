Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C1E357D06;
	Tue, 12 May 2026 19:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778613193; cv=none; b=CMdZSgEeaMRSInrbKUrr3WGh+mMsAAofJzol8hfLAzV+cnFtE9y09q48dmiGQ5IryhhNxlmrefw6v2uDzYcDoaBpE/D0KzAekp1UIXXDQon6ISpeZ6I/+xlR7pYbUgLTmqtwNuD6f1+NnriYLg6uh7IG8tKo45Qtgqb5ShGzFPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778613193; c=relaxed/simple;
	bh=IxV5UJvufS94UUI6ki4WXGhhWmxfbnyc+yI53yhcT50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sLzhOoBiMl1I5DqIen2Ar5cknR45t3c4ZJ2JUcz445GU9Antqv4dyfl8ZGIF+wavLrufF/VHB//+OVFOWLXCFrYvruoMGuw+X3hEXMcmBq8Wg0dVHjCkoC0fSMqBLyR16QVvtmL2rUngWdbFMJeg8YvgG0w42bmCkmVj9LRm+JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=hKdT4zmq; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="hKdT4zmq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778613182; bh=4Y9g1AiYuERfDhIQV8zbFsBF9ETEEsbHBkYJ6TE7AwI=;
	h=From:Message-ID:From;
	b=hKdT4zmqtinVvvazdwOZKPLbIlabK7Er1S9W3k3WziC6T2CNf8DlehgLzcuGkt52M
	 DCFMCWf7Z0Im6s7Sxov+HDmyCJO09g/MxpGDUFDNjgEAexf6Ue8OwIC+TzgfC6tFO9
	 gCEduRbd+NWIKY+oU3mmHDy4FVCIPDnMztEo3Jkg=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id BDE03C09D3;
	Tue, 12 May 2026 21:13:01 +0200 (CEST)
Date: Tue, 12 May 2026 21:13:01 +0200
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: greg@kroah.com, Leon Romanovsky <leon@kernel.org>,
        skhan@linuxfoundation.org, security@kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Documentation: security-bugs: new updates
 covering triage and AI
Message-ID: <agN7vVSD4NDQlBLL@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <871pfgpn2a.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871pfgpn2a.fsf@trenco.lwn.net>

On Tue, May 12, 2026 at 11:14:37AM -0600, Jonathan Corbet wrote:
> Willy Tarreau <w@1wt.eu> writes:
> 
> > This series tries to translate recent discussions on the security list
> > on how to better handle reports. It details:
> >   - when not to Cc: the security list
> >   - what classes of bugs do not need to be handled privately
> >   - minimum requirements for AI-assisted reports
> >
> > As usual, this is probably perfectible but can already help in the short
> > term as we can point it to reporters, so barring any strong disagreement,
> > better continue to proceed in small incremental improvements and observe
> > the effects.
> 
> OK, I've applied the series to docs-fixes; after a short exposure in
> linux-next I'll ship it Linusward.

Thank you!

> I have a couple of comments on the individual changes that might merit
> an eventual add-on patch.

Yes, feel free to suggest. I'm not fond of how the pub/priv decision is
stretched into multiple sections and I'd like to rework it to have a
dedicate section "public or private" which describes how to take the
decision then later we can explain whom to contact depending on this
choice. It's not much different from what we have but it would clarify
certain points. So in any case I think I'll propose an update later, so
anything you can propose to improve the situation is more than welcome!

Thanks!
Willy
