Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411F11DF736;
	Tue, 28 Apr 2026 21:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777410824; cv=none; b=cECAjkp6FPFISlMKaD2v0Nlt6YQQM5IVE0NN4ERZ0tobtBO2YIXNIYP5TJNENLDdA0uykmM+v7n5qVAKNkcrYnrP7RjZFGJiCefa9HpzY7uWpJUfODa792ECPr7mo7T+82AKIXduM7F3ZrM/VGaMPU3bsgQiatzcabiwcuPz0+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777410824; c=relaxed/simple;
	bh=pvFfouGz0fRKLx/nWtHy8IvY2k3qLX8XlSvjWbKWUdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSgWa71HzOnwngpYDzv+Aft7vdAtNXDjYVcRgVi+mtuQ3Lfzf1wyONcACoo8STbhKVUZPqDTX/do7RZfVsTMV+4PXI4LdwxfCw2TG/UJ+q+jT/6smbcipAp0KhsZpcDmeh2FYqHuRZ+yCkuqqA8K/aHs2WtiXPIo/CKXcFmDHSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=HG/jYlH6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tZ09Mvsv; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="HG/jYlH6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tZ09Mvsv"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D1E717A024B;
	Tue, 28 Apr 2026 17:13:40 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 28 Apr 2026 17:13:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1777410820; x=1777497220; bh=kg+/CO84lr
	gmx9miVmWNRpo+kO9PtHxpDH4OOtg+03k=; b=HG/jYlH6KXR1nSZprykHm+hepW
	378L2CQex8IhBL5KjvIqYb0G7yuHW2MpyNc5be5/D4IQ15SW9Uk0j4Z82+3fu8eD
	+hl9+hL0MaOUhCGsLOGWQ82RxXjgJ1M1GLEgWc9sDRrmtpOJxxe6mGkgBaXgrSPn
	RSUsW4WvUOXUdehLefYOcXZwZEVZ/gEQODDhlpdO8Qh81Nl2RxvAgybeUxV6IJ7W
	uHLQQ/BnGzjNmqAICr/Lwv34Oce880gTq8f47RFiq43GaonN7mkZ2MQPn9mK9eDp
	2SwvB9UzLe8uqnpMtNlh5aiZYRj3UELId9T3yMNDbAMjUkI3DwtzobKbdFpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1777410820; x=1777497220; bh=kg+/CO84lrgmx9miVmWNRpo+kO9PtHxpDH4
	OOtg+03k=; b=tZ09Mvsvo/3Egz+UGWXlekk2gkeGXaN/2oA5pEtrbYD5fL1OqFW
	uPCnt5qbfsxFN/N2+ZWA8zW4e0g5YOKuXiF30HbH8SS7k2zoSx4LWyyUWUFNVemQ
	3frfupYWtj64uz1SaHwcm0Q444l7AfSKf+dE6AU63vAcmuksQciqxibOFNAxYdZe
	unagH0dC/otKHqcAbVR09ZSfEX2jyaQHWL53znQAKFs8QraUQ3p+ZMY1CCC7Xfvl
	azH9ZMHJTYxEE+48gE+y6GsWNE25HeUFxmjryoD8rQYPlp9ZoOgVc7svWLXl79SW
	G0YZEZc6Aa/Kie1wppBJbNMXgvU2+sxs89w==
X-ME-Sender: <xms:BCPxaZSx2YqqFjsKjXT7TIgFHyUO7arnF2PSdDncw8IWm_c_3Iijcg>
    <xme:BCPxaTsS5PwQgjw70xP83lEztacHXRTyXGLAWDV636dhIaUJdiX1YEtviIIF8VyV5
    yOKnG01srqA0FfDbVRQ_aYBsDUDbL11cdzlIDO8YSPySQmveg>
X-ME-Received: <xmr:BCPxafLKjWy0LTVfqIihZKHfACBT1AQAfv81XrLnzgiCS46n5Q1XVIWj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekvdeiudcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:BCPxafeeTj3mxqV8XGeuwZO8X0EsafEVpT-R4UAjSwQ8_lbhX6350g>
    <xmx:BCPxaZU79TQb-sTmnEiIsO2nQq8mrAGXfNx-ZBre3vpuzYH34xqm2Q>
    <xmx:BCPxaVj7kkw9igEIm3Ip4HPr9W6ycS9O7cxp7Vcg76K9h1fspZrasw>
    <xmx:BCPxabiwZ3Aa9hgXnXqTcD7L4ClNq-yqFaQ88Lm9Qsbi3RZfXVgEdw>
    <xmx:BCPxaYkvJ3xagaxMICjP27aWfqV0aNVYH-gCwMdAXkSagKzOfu2DWgNa>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Apr 2026 17:13:39 -0400 (EDT)
Date: Tue, 28 Apr 2026 15:13:01 -0600
From: Greg KH <greg@kroah.com>
To: Willy Tarreau <w@1wt.eu>
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Documentation: security-bugs: explain what is and is
 not a security bug
Message-ID: <2026042804-overbook-ripeness-73dd@gregkh>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-3-w@1wt.eu>
 <2026042753-ozone-jigsaw-4ad5@gregkh>
 <ae-Acm2XJ3sR34Il@1wt.eu>
 <2026042724-bullhorn-bobtail-ae6f@gregkh>
 <ae-LVyDQPVwxesCO@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae-LVyDQPVwxesCO@1wt.eu>

On Mon, Apr 27, 2026 at 06:14:15PM +0200, Willy Tarreau wrote:
> On Mon, Apr 27, 2026 at 09:35:04AM -0600, Greg KH wrote:
> > On Mon, Apr 27, 2026 at 05:27:46PM +0200, Willy Tarreau wrote:
> > > On Mon, Apr 27, 2026 at 07:48:23AM -0600, Greg KH wrote:
> > > > On Sun, Apr 26, 2026 at 06:39:13PM +0200, Willy Tarreau wrote:
> > > > > +In the Linux kernel's threat model, an issue is **not** a security bug, and
> > > > > +should not be reported to the security list, when triggering it requires the
> > > > > +reporter to first undermine the system they are attacking.  This includes, but
> > > > > +is not limited to, behavior that only manifests after the administrator has
> > > > > +explicitly enabled it (loading a module, setting a sysctl, writing to a debugfs
> > > > > +knob, or otherwise using an interface documented as privileged or unsafe); bugs
> > > > > +reachable only through root or CAP_SYS_ADMIN or CAP_NET_ADMIN on a machine the
> > > > > +actor already fully controls, with no further privilege boundary being crossed;
> > > > > +prediction of random numbers that only works in a totally silent environment
> > > > > +(such as IP ID, TCP ports or sequence numbers that can only be guessed in a
> > > > > +lab), issues that appear only in debug, lockdep, KASAN, fault-injection,
> > > > > +CONFIG_NOMMU, or other developer-oriented kernel builds that are not intended
> > > > > +for production use; problems seen only under development simulators, emulators,
> > > > > +or fuzzing harnesses that present hardware or input states which cannot occur
> > > > > +on real systems; bugs that require modified or emulated hardware; missing
> > > > > +hardening or defence-in-depth suggestions with no demonstrable exploit path
> > > > > +(including local ASLR bypass); mounting file systems that would be fixed or
> > > > > +rejected by fsck; and bugs in out-of-tree modules or vendor forks, which should
> > > > > +be reported to the relevant vendor.  Functional and performance regressions,
> > > > > +and disagreements with documented kernel policy (for example, "root can load
> > > > > +modules"), are likewise ordinary bugs or feature requests rather than security
> > > > > +issues, and should be reported via the usual channels.
> > > > 
> > > > This is a great list to start with, but perhaps we should put it in list
> > > > form so that it's easier to read?
> > > 
> > > In fact that's what I tried first and it was super long with many short
> > > lines, making it possibly worse. But maybe aggregating several short
> > > entries on a line by similarities could work, I can give it a try.
> > > 
> > > > Also, I can see this turning into a separate document eventually as
> > > > different subsystems should have a chance to weigh in on what they
> > > > consider the threat model to be
> > > 
> > > My fear if we redirect to other files is that it won't be read again.
> > > However, we could possibly suggest to always look for the subsystem's
> > > specific rules in this subsytem's doc, leaving enough freedom to
> > > maintainers to reject more things.
> > 
> > AI tools are good at following links, so I wouldn't worry about that.
> 
> Yes but let's not forget the minority of humble humans still sending
> honest reports ;-)
> 
> > We can point at other files, as this list is going to get long over
> > time, which is a good thing.
> 
> Sure. I'm just unsure where this could be enumerated, as it's likely
> that there would be just one or two lines max per subsystem for the
> majority of them. Or we could have a totally separate file, "threat
> model", that goes into great lengths detailing all this with sections
> per category or subsystem when they start to grow maybe, and refer only
> to that one from security-bugs ?

I think a separate file is good, I know I need to write up what the USB
model is, and it's different from PCI, and different from other
subsystems.  All should probably be documented eventually.

> > > > (like what the IB subsystem does which I
> > > > don't think you listed above, or the USB subsystem.)
> > > 
> > > Indeed I didn't list IB (I'm never sure about it, I seem to remember
> > > we simply trust any peer, is that right?), nor did I make specific
> > > mentions for USB which is implicitly covered by "hardware emulation
> > > or modification".
> > 
> > Ah, but USB does cover "some" modification of devices, so this is going
> > to be something that is good to document over time, if for no other
> > reason to keep these scanning tools in check from hallucinating crazy
> > situations that are obviously not a valid thing we care about.
> 
> OK but does this mean you still want to get these reports in the end ?

I want a patch if a user cares about that threat-model (as Android does
but no one else) as it's up to the user groups that want to change the
default kernel's behavior like this to actually submit patches to do so.

thanks,

greg k-h
