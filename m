Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A333E715F;
	Wed, 13 May 2026 10:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668529; cv=none; b=D/jkrm2pQsWtAtNuAHrEYaw42Ll7Xuq25AsV3+MSyFEqGDLw55Z51fZqzy0em5BjS2xvhqiHKpCdKkEtX1r9+TZChfJniSbM+727YAPmOvvdCOetl6h3Pgtp/ekxDYVGJ4fjyFLFXocmTQr9BgEsw895lAycJoiKdx7WARldZdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668529; c=relaxed/simple;
	bh=uvIaEeGdRdNZZ5XLsCCdLcnfYp1OhrITljnlyckqV/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3xMGlk5Xezp+gvJ+OSfnzBaVaoZ4aDW3BHZ8qjN0hDhx1s9mx6RkqWuPWDidhZSCcuBQmVsTzvm6OLe3rIABp8PEtZWT8gybxPfUOESV7vpkxpBZnEx6ppSNcGMuiQdUTZznQlL232ORfqolYDk4n57Etb0aYOTAVO0moTHy2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=xy2t8P3f; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qi+Yd5yN; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="xy2t8P3f";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qi+Yd5yN"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 092F1EC00C3;
	Wed, 13 May 2026 06:35:26 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 13 May 2026 06:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1778668526; x=1778754926; bh=jUWHX9q4Mu
	S0OptvpTvpGkg1pPI8mQYwY3VqKdqzxHI=; b=xy2t8P3f31Y/anTQP8L9ISbpDn
	0lax1QvksSjT3PA10lgyoM031O08n4y6kkftNdzUzfCYBuKtKAPRzqgpWkMkSZO1
	12p3sRGNvLqy0f4A3c6jW4FuuYsxiPtewMfnPgL9ffNVCIA48y1VFPwdy4CydCwp
	AW4DuFQH2mXJhFa3PIW6lyF5dcriK4lV7jT7zClSP+Ckct9rMGq62XIxk1ZpTEpg
	ZSknx63URX79JnWxvg6DSb/c6HTZz3zqPpaXYEPsEBMYaq+V3jDCS6OJFnkVVMv4
	BGjaf3Y0aRc4KvRW1UJ3RYeRlRZ17GChfiipR+mW3rgrrdApw1dXdcpXPv3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778668526; x=1778754926; bh=jUWHX9q4MuS0OptvpTvpGkg1pPI8mQYwY3V
	qKdqzxHI=; b=qi+Yd5yNx1lteZQW+xEcPgjN9O1ZS0bEbgNvRHFt7Oz5q3Ol8tU
	F206NNN2d8gkP3aZLA9mvsK7zi4ruCq6ydTv2Kxr+mDfzZdNnr+ymQP5fd7HUaDY
	x6GQ/I81CE1tZJv2bgRQOwoirq2CH1ovJGeEOx9Jv0dmZvx9Qm3SPkjn+mHp8BIB
	wvg55YxT5ky+StRF06D6fUSG7CA+cnU8AOrCf7XfrjZHgEbGHZC+XW01DcSiegtu
	ar1JDk8uoiWTBHSbXQ1/i57iA3jXvbirno3wY/VrZKO49zY3qB8cw6ZXNJ/f+Pqx
	1Zn7o7ciEruN+dAuF26tXOVbCfTEeioQ/pA==
X-ME-Sender: <xms:7VMEauHX16FNPiNeSyKiPdTQ30VqMLLBGWyGfqUaSFuXf7XjLnbP8g>
    <xme:7VMEagSPfzJAxfWAuwc4A-X-M8BE64bkT09qdWLZJgsOekQ2DnXXO1IwU6yvbG2ha
    zHRBTdVJY0Wc7OwW1cTQnLzu1cLByE17Dkm1h7riUuojBlQMQ>
X-ME-Received: <xmr:7VMEaoeCKknae1ZYapqwqSxDaLOKUC9tisPkZX1b6uetxKXc9VQL-iw5lyiyPK9p1V6VoFi96iGwUtfuhRtTFWn8Ag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdeggeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvd
    eljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtohepfiesudifthdrvghupdhrtg
    hpthhtoheplhgvohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehskhhhrghnsehl
    ihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepshgvtghurhhithihse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopeifohhrkhhflhhofihssehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:7VMEaminVGyN2FMdbf66uLd373xZ2b2DyYcSMXBkopdqczKVLDgrhA>
    <xmx:7VMEarJZSGwnx8dXLcTaukIdqdJTfBnQX8HiiZCOHKlbX8_BiqAzCw>
    <xmx:7VMEarHbwHAfn47drsBG0fR9rVauAB4ADL6epfU6vhBl8bYBj__ZxA>
    <xmx:7VMEap0sjA_MApgFPuDBgUgE2uMaR0WIrkd9t62xnRKz5j9FQsl0gQ>
    <xmx:7lMEam6Y0kgH30FM1YHnQIsZq7EMWfBVdwQcfvzo-CCrAy5q5-fVZ4q4>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 May 2026 06:35:25 -0400 (EDT)
Date: Wed, 13 May 2026 12:29:34 +0200
From: Greg KH <greg@kroah.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Willy Tarreau <w@1wt.eu>, Leon Romanovsky <leon@kernel.org>,
	skhan@linuxfoundation.org, security@kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <2026051333-puzzle-smokiness-8096@gregkh>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-3-w@1wt.eu>
 <87wlx8o87g.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wlx8o87g.fsf@trenco.lwn.net>

On Tue, May 12, 2026 at 11:20:51AM -0600, Jonathan Corbet wrote:
> Willy Tarreau <w@1wt.eu> writes:
> 
> > The use of automated tools to find bugs in random locations of the kernel
> > induces a raise of security reports even if most of them should just be
> > reported as regular bugs. This patch is an attempt at drawing a line
> > between what qualifies as a security bug and what does not, hoping to
> > improve the situation and ease decision on the reporter's side.
> >
> > It defers the enumeration to a new file, threat-model.rst, that tries
> > to enumerate various classes of issues that are and are not security
> > bugs. This should permit to more easily update this file for various
> > subsystem-specific rules without having to revisit the security bug
> > reporting guide.
> 
> One thing here:
> 
> [...]
> 
> > +* **Capability-based protection**:
> > +
> > +  * users not having the ``CAP_SYS_ADMIN`` capability may not alter the
> > +    kernel's configuration, memory nor state, change other users' view of the
> > +    file system layout, grant any user capabilities they do not have, nor
> > +    affect the system's availability (shutdown, reboot, panic, hang, or making
> > +    the system unresponsive via unbounded resource exhaustion).
> 
> That is pretty demonstrably not true, and will likely elicit challenges
> at some point.  There are a lot of "make me root" capabilities that
> enable users to do all of those things; consider CAP_DAC_OVERRIDE as an
> obvious example.  I think that just about all of the capabilities will
> enable at least one of those things - that's why the capabilities exist
> in the first place.  So I think this needs to be written far more
> generally.

You are right, there are more capabilities, but we get bug reports all
the time that basically come down to "a user with CAP_SYS_ADMIN can go
and do..." which are pointless for us to be handling.  Just got one a
few minutes ago, so LLMs are churning this crap out quite frequently.

So any rewording of this to prevent us from getting these pointless
reports would be great.

> As a lower-priority thing, lockdown mode is meant to at least try to
> provide some stronger guarantees, and lockdown circumvention seems to be
> normally be viewed as a security bug.  Worth a mention?

lockdown issues are best discussed on the list where the lockdown people
are as most of us feel that really isn't a "security" thing at all :)

thanks,

greg k-h
