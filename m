Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92EA34887C;
	Mon, 27 Apr 2026 15:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777304143; cv=none; b=C5FoDX0EirIguIzfsJo+ZfxygZLSYAFJ2oBYT4oZBjRLXkVpDSHKoVo/PSmRgI2R7Y94HCuUniXabLlxpaacVglvye9MFM9gn4zau25SQRpTX5sKifMkTxP4Nom14jRE5M+dTy4LmUeF56ubQa7apkc5TvMz/CUBXpUn/D1oX8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777304143; c=relaxed/simple;
	bh=qi7yuSfEazg5kgXfZq5qW1mwfVkrD1zSzxuVoyWkCxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=st17vvY979YIltHGr8Np7ctP5XmqqpEEniXXwwir2QEsNjFmV+eCKZRBJYiOcVemiNoxL4wAsDFyLz2HjgJbjnhfoXBZMtyoBnViQ1X3tKTeKA1LC+kY06KtWxGgW3m4a8K1g37GYNLOu9tZRQO0OUCxTnXUhI2U34HQvR4KP7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=a2AlP7Yk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y6cvXUeE; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="a2AlP7Yk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y6cvXUeE"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E98601400042;
	Mon, 27 Apr 2026 11:35:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 27 Apr 2026 11:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1777304140; x=1777390540; bh=n3LqwQdBrN
	Y2ZhPnhkO7mVtkL2Axo5QKuPVPxeNs2kM=; b=a2AlP7YkoWcb8C0OWYsuy6vJ4P
	++DjuBucdKshrxX/nBbcKfPNZhRr7pEVw5oEY7CeRnKZjauatAeyEoKJf0YZxHez
	noip13lzxwSfzsfW/oc7qq1JrDOFMPkDiZ3L4myrx3Af3q6PIqf4E+osYflw3DNP
	PWVHaUb9VgGdNCkBbQS3AyhxgxRTGaEXfYf/lLc6KshnG5O3WzLHjyvLihcDapKm
	8Uhzxi3rZljH8f2IvUaKHQdUL9L+PejaRdkMJjUOZ1q8+FJhU++2qNdX38EVN5QV
	EQwTEUKW0ybEO2MMPWnfLeyXCMIu/NOypi0bbacv8Ys2jkiSntAjuZ6dnK5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1777304140; x=1777390540; bh=n3LqwQdBrNY2ZhPnhkO7mVtkL2Axo5QKuPV
	PxeNs2kM=; b=Y6cvXUeEMlvAXuCZBSSJZSwo+ANNAudxHVRnuDyxSQ7yV8/QXGt
	zr/b5nhDbO9dQwreAZhFphHGGpid5+w2/YVaHcc/e3gzovdV5n6uiMPBTbVD0fc5
	SgTM7vepQe6fZoXaU4y+xhzBwmhQz1lZiQoTuRPyWuBhEV4a0X4fzQzbxF/42cFb
	p7355+5ErhjJUNSMstCNgTmvaPXFyUG8fUS51x1lPvRNY4gLIubOIQGcwHwpt0PP
	DLJ96+VKCJQL8Zv+Ul8yfvt5Ik7PISMdcn+xOu8drGu8weNiaIA1QGm3d5gzeyC2
	9D+k0PPtcyHXHwGi1OpXlraclG9zAH0HeGw==
X-ME-Sender: <xms:TILvaUbJ3mCam6Hn3g0HQfzjSDNH6EVdnxChBLmngqsAm43_aH6vMA>
    <xme:TILvaaGc5Yb8bf6-_xERO35f-W2-I_YtmeYZYBg7w6att2JwNYr2FonlT7WZWCbbW
    ssy52ic-G9VOl-W9-u7j-dJ8toPiY53ubBqYLS5o4cGcz5CyA>
X-ME-Received: <xmr:TILvaXogamr26lMk7ixJ78uyxBtG3rwNTQDE76F-4hVu-E3swnqR_5bBDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejledtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    peifsedufihtrdgvuhdprhgtphhtthhopehlvghonheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepshgvtghurhhithihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhr
    sggvtheslhifnhdrnhgvthdprhgtphhtthhopehskhhhrghnsehlihhnuhigfhhouhhnug
    grthhiohhnrdhorhhgpdhrtghpthhtohepfihorhhkfhhlohifshesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:TILvaVwSyx6azYtVLmKhI0j8zYPSOtMiRWKGU_X4RM1lr1gs4zC6_Q>
    <xmx:TILvaRM4Co2il8fGGf96I310b_3lfdp9PMiCOTYoFLuc7rGtgd9u0w>
    <xmx:TILvaVeOICqO5BKutqIpf7KPFSDwAj25BaXv5U93Ru6fLYnQ0108-g>
    <xmx:TILvad6dmPw2NRVhl7putbBUSLDajo75QueTZRPVZ66puX3clN3Esw>
    <xmx:TILvacP-UYLnN6RIOFopt1YYuC75-4jYec-wBozpmklMHQlwICN2qRxe>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Apr 2026 11:35:40 -0400 (EDT)
Date: Mon, 27 Apr 2026 09:35:04 -0600
From: Greg KH <greg@kroah.com>
To: Willy Tarreau <w@1wt.eu>
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Documentation: security-bugs: explain what is and is
 not a security bug
Message-ID: <2026042724-bullhorn-bobtail-ae6f@gregkh>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-3-w@1wt.eu>
 <2026042753-ozone-jigsaw-4ad5@gregkh>
 <ae-Acm2XJ3sR34Il@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae-Acm2XJ3sR34Il@1wt.eu>

On Mon, Apr 27, 2026 at 05:27:46PM +0200, Willy Tarreau wrote:
> On Mon, Apr 27, 2026 at 07:48:23AM -0600, Greg KH wrote:
> > On Sun, Apr 26, 2026 at 06:39:13PM +0200, Willy Tarreau wrote:
> > > +In the Linux kernel's threat model, an issue is **not** a security bug, and
> > > +should not be reported to the security list, when triggering it requires the
> > > +reporter to first undermine the system they are attacking.  This includes, but
> > > +is not limited to, behavior that only manifests after the administrator has
> > > +explicitly enabled it (loading a module, setting a sysctl, writing to a debugfs
> > > +knob, or otherwise using an interface documented as privileged or unsafe); bugs
> > > +reachable only through root or CAP_SYS_ADMIN or CAP_NET_ADMIN on a machine the
> > > +actor already fully controls, with no further privilege boundary being crossed;
> > > +prediction of random numbers that only works in a totally silent environment
> > > +(such as IP ID, TCP ports or sequence numbers that can only be guessed in a
> > > +lab), issues that appear only in debug, lockdep, KASAN, fault-injection,
> > > +CONFIG_NOMMU, or other developer-oriented kernel builds that are not intended
> > > +for production use; problems seen only under development simulators, emulators,
> > > +or fuzzing harnesses that present hardware or input states which cannot occur
> > > +on real systems; bugs that require modified or emulated hardware; missing
> > > +hardening or defence-in-depth suggestions with no demonstrable exploit path
> > > +(including local ASLR bypass); mounting file systems that would be fixed or
> > > +rejected by fsck; and bugs in out-of-tree modules or vendor forks, which should
> > > +be reported to the relevant vendor.  Functional and performance regressions,
> > > +and disagreements with documented kernel policy (for example, "root can load
> > > +modules"), are likewise ordinary bugs or feature requests rather than security
> > > +issues, and should be reported via the usual channels.
> > 
> > This is a great list to start with, but perhaps we should put it in list
> > form so that it's easier to read?
> 
> In fact that's what I tried first and it was super long with many short
> lines, making it possibly worse. But maybe aggregating several short
> entries on a line by similarities could work, I can give it a try.
> 
> > Also, I can see this turning into a separate document eventually as
> > different subsystems should have a chance to weigh in on what they
> > consider the threat model to be
> 
> My fear if we redirect to other files is that it won't be read again.
> However, we could possibly suggest to always look for the subsystem's
> specific rules in this subsytem's doc, leaving enough freedom to
> maintainers to reject more things.

AI tools are good at following links, so I wouldn't worry about that.
We can point at other files, as this list is going to get long over
time, which is a good thing.

> > (like what the IB subsystem does which I
> > don't think you listed above, or the USB subsystem.)
> 
> Indeed I didn't list IB (I'm never sure about it, I seem to remember
> we simply trust any peer, is that right?), nor did I make specific
> mentions for USB which is implicitly covered by "hardware emulation
> or modification".

Ah, but USB does cover "some" modification of devices, so this is going
to be something that is good to document over time, if for no other
reason to keep these scanning tools in check from hallucinating crazy
situations that are obviously not a valid thing we care about.

thanks,

greg k-h
