Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CD134D910;
	Mon, 27 Apr 2026 16:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306459; cv=none; b=K4coH6DysKzwghMdxhn7ZPcf2DyI8AREpNF88QO15PjcbTsSij/dgPtvQciJIzpUFT7bRy3qRBolOS/AiaEmJKHWRVGRkz+izT9Ag5VhYhudYKuyjMFNq+cE/uUm8hx+fvYpmKInOPnzxa9MJLCIqzjQDTVNGce35d1cNJViMVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306459; c=relaxed/simple;
	bh=JXAuhzZDHwLXCqoGeoY65zJQMZVOrnCkofyUbtuMB9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEVOutvG429lXA5Rf8OOaWoxAqnqSyz/ac12HK+2h7lT6Fzm2VPtVZXH0Fa0O49J6+/a1pv/pdfY5baBp2uoJDczTyxo7DbT0Ftale8JCjfwG6kdAFCijA5Q56aSt7+c9mIs5sGFUwiDahaD2j7vd/3c8QwRREWtZXDpWbrIeOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=K2Fiagkg; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="K2Fiagkg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1777306456; bh=wQy4Ri40T/dYzKZzY2CCm8DmK9slEdzxWIEmjYx5pQo=;
	h=From:Message-ID:From;
	b=K2Fiagkg5wkep+hbfFnZuZOVeK5F2svSRasl0BI+o7rHBEZxNlrGpsJzY59cOB8gi
	 5KbNWQuy17vUTJnjojTSEUDh3yZApgvCu+fxzdyqBHC40aVHQ2osU+ZGxriocM/in/
	 W2GNd6xDGcTWOJkIKARHFISfA3wT8sMP9p2R4rVc=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id EF5DEC0B7D;
	Mon, 27 Apr 2026 18:14:15 +0200 (CEST)
Date: Mon, 27 Apr 2026 18:14:15 +0200
From: Willy Tarreau <w@1wt.eu>
To: Greg KH <greg@kroah.com>
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Documentation: security-bugs: explain what is and is
 not a security bug
Message-ID: <ae-LVyDQPVwxesCO@1wt.eu>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-3-w@1wt.eu>
 <2026042753-ozone-jigsaw-4ad5@gregkh>
 <ae-Acm2XJ3sR34Il@1wt.eu>
 <2026042724-bullhorn-bobtail-ae6f@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026042724-bullhorn-bobtail-ae6f@gregkh>

On Mon, Apr 27, 2026 at 09:35:04AM -0600, Greg KH wrote:
> On Mon, Apr 27, 2026 at 05:27:46PM +0200, Willy Tarreau wrote:
> > On Mon, Apr 27, 2026 at 07:48:23AM -0600, Greg KH wrote:
> > > On Sun, Apr 26, 2026 at 06:39:13PM +0200, Willy Tarreau wrote:
> > > > +In the Linux kernel's threat model, an issue is **not** a security bug, and
> > > > +should not be reported to the security list, when triggering it requires the
> > > > +reporter to first undermine the system they are attacking.  This includes, but
> > > > +is not limited to, behavior that only manifests after the administrator has
> > > > +explicitly enabled it (loading a module, setting a sysctl, writing to a debugfs
> > > > +knob, or otherwise using an interface documented as privileged or unsafe); bugs
> > > > +reachable only through root or CAP_SYS_ADMIN or CAP_NET_ADMIN on a machine the
> > > > +actor already fully controls, with no further privilege boundary being crossed;
> > > > +prediction of random numbers that only works in a totally silent environment
> > > > +(such as IP ID, TCP ports or sequence numbers that can only be guessed in a
> > > > +lab), issues that appear only in debug, lockdep, KASAN, fault-injection,
> > > > +CONFIG_NOMMU, or other developer-oriented kernel builds that are not intended
> > > > +for production use; problems seen only under development simulators, emulators,
> > > > +or fuzzing harnesses that present hardware or input states which cannot occur
> > > > +on real systems; bugs that require modified or emulated hardware; missing
> > > > +hardening or defence-in-depth suggestions with no demonstrable exploit path
> > > > +(including local ASLR bypass); mounting file systems that would be fixed or
> > > > +rejected by fsck; and bugs in out-of-tree modules or vendor forks, which should
> > > > +be reported to the relevant vendor.  Functional and performance regressions,
> > > > +and disagreements with documented kernel policy (for example, "root can load
> > > > +modules"), are likewise ordinary bugs or feature requests rather than security
> > > > +issues, and should be reported via the usual channels.
> > > 
> > > This is a great list to start with, but perhaps we should put it in list
> > > form so that it's easier to read?
> > 
> > In fact that's what I tried first and it was super long with many short
> > lines, making it possibly worse. But maybe aggregating several short
> > entries on a line by similarities could work, I can give it a try.
> > 
> > > Also, I can see this turning into a separate document eventually as
> > > different subsystems should have a chance to weigh in on what they
> > > consider the threat model to be
> > 
> > My fear if we redirect to other files is that it won't be read again.
> > However, we could possibly suggest to always look for the subsystem's
> > specific rules in this subsytem's doc, leaving enough freedom to
> > maintainers to reject more things.
> 
> AI tools are good at following links, so I wouldn't worry about that.

Yes but let's not forget the minority of humble humans still sending
honest reports ;-)

> We can point at other files, as this list is going to get long over
> time, which is a good thing.

Sure. I'm just unsure where this could be enumerated, as it's likely
that there would be just one or two lines max per subsystem for the
majority of them. Or we could have a totally separate file, "threat
model", that goes into great lengths detailing all this with sections
per category or subsystem when they start to grow maybe, and refer only
to that one from security-bugs ?

> > > (like what the IB subsystem does which I
> > > don't think you listed above, or the USB subsystem.)
> > 
> > Indeed I didn't list IB (I'm never sure about it, I seem to remember
> > we simply trust any peer, is that right?), nor did I make specific
> > mentions for USB which is implicitly covered by "hardware emulation
> > or modification".
> 
> Ah, but USB does cover "some" modification of devices, so this is going
> to be something that is good to document over time, if for no other
> reason to keep these scanning tools in check from hallucinating crazy
> situations that are obviously not a valid thing we care about.

OK but does this mean you still want to get these reports in the end ?

Willy
