Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FF22F0673;
	Sat,  2 May 2026 06:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777702033; cv=none; b=seFHTZQ2CcSd3aqCEo9QjfpbKQSVW9TcwRbllOVCGlM+vD+ksg80zU/by9VcoxznqZYOA0sbnw6s80oX6MaIMxlg/rJcwvnwu2X56/L01HPrZtO+j+AxufQP4fTsbVyDQgcfUsd4AQr6Ii981bDzV4oQhtrKEtFa1Qe925NbKlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777702033; c=relaxed/simple;
	bh=mZH1Ywc8JIa1yFFkEYwhLkgEK44DLORqzfpgH+dlfoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QmGYYAL9rMYpp1XFBniLwvr5NbQzi3SIYPJ8GK3TZX3HL3hwyiKYLe7mj2GxHmPCeL18iypvWhtEk9VFzIEmlWUhEjW1+u2hXrxGhAB4t2Mhn+sNlAnyvWJO7ZqPjJrqkapsGPEAjpSQgiq8MW2RJt0UuFDSrXdLTG2arW3AR2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=Gc3f1ZRd; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="Gc3f1ZRd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1777702029; bh=ZB38LQXr254bYq/wdyTLMI+aWdPO5vNjqpNMweDOsjE=;
	h=From:Message-ID:From;
	b=Gc3f1ZRdDRUhL/O/PK695Crvs0G18Qp3AHMvLmcCh5rBxtqpw0gZGARQLN7qZFeb0
	 +8730sAYzBK84VlgzY63cs3PGl91kEgPMRIx7We5L4Rv/7G/OBxvNz0P0iV9OX17nt
	 ZopwHW/GfXm+uGd0AzcFI1MLpdFYhhGFeLCm3IJA=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 2ED1CC0AA3;
	Sat, 02 May 2026 08:07:09 +0200 (CEST)
Date: Sat, 2 May 2026 08:07:08 +0200
From: Willy Tarreau <w@1wt.eu>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Greg KH <greg@kroah.com>, leon@kernel.org, security@kernel.org,
        Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Qubes Developer Mailing List <qubes-devel@googlegroups.com>
Subject: Re: [PATCH 2/3] Documentation: security-bugs: explain what is and is
 not a security bug
Message-ID: <afWUjN1FbIHIK99Z@1wt.eu>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-3-w@1wt.eu>
 <2026042753-ozone-jigsaw-4ad5@gregkh>
 <ae-Acm2XJ3sR34Il@1wt.eu>
 <2026042724-bullhorn-bobtail-ae6f@gregkh>
 <ae-LVyDQPVwxesCO@1wt.eu>
 <2026042804-overbook-ripeness-73dd@gregkh>
 <1d3f8659-8c69-47f6-bb38-4c1d06cf8307@gmail.com>
 <afWNHZoN64fldbUK@1wt.eu>
 <a8e60dfe-2965-4a4b-89fb-ce5991395dc5@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8e60dfe-2965-4a4b-89fb-ce5991395dc5@gmail.com>

On Sat, May 02, 2026 at 01:51:08AM -0400, Demi Marie Obenour wrote:
> On 5/2/26 01:35, Willy Tarreau wrote:
> > Hi Demi Marie,
> > 
> > On Sat, May 02, 2026 at 01:20:10AM -0400, Demi Marie Obenour wrote:
> >>>>> Ah, but USB does cover "some" modification of devices, so this is going
> >>>>> to be something that is good to document over time, if for no other
> >>>>> reason to keep these scanning tools in check from hallucinating crazy
> >>>>> situations that are obviously not a valid thing we care about.
> >>>>
> >>>> OK but does this mean you still want to get these reports in the end ?
> >>>
> >>> I want a patch if a user cares about that threat-model (as Android does
> >>> but no one else) as it's up to the user groups that want to change the
> >>> default kernel's behavior like this to actually submit patches to do so.
> >> FYI, I don't think this is limited to Android.  Chrome OS definitely
> >> cares about malicious USB devices, and the whole purpose of USBGuard is
> >> to prevent a USB device from being able to compromise the system unless
> >> authorized.  I believe Qubes OS also cares, as it supports USB device
> >> assignment to virtual machines.  CCing qubes-devel for confirmation.
> >>
> >> What should that patch look like?  Could there be a way for these user
> >> groups to be informed of vulnerabilities in the USB subsystem, so that
> >> they can take responsibility for fixing them before they become public?
> > 
> > I've posted a proposal elsewhere in the same thread:
> > 
> >    https://lore.kernel.org/lkml/afSxSX8RK0Z4kkOI@1wt.eu/
> 
> I saw that, but it's still not quite clear what is meant here.
> My understanding is that those concerned about malicious USB devices
> are generally concerned about _arbitrary_ malicious USB devices.
> The one thing a USB device shouldn't be able to spoof is the port
> it is plugged into, and userspace tools like USBGuard can use that
> information.  But to do that, they have to trust that the device
> can't harm the system if it isn't assigned to any drivers.

The goal sought by that early document precisely is to draw the line
between what is a regular bug and hwat is a kernel bug. The kernel
currently doesn't consider problems posed by a crafted USB device as a
security issue because the kernel trusts the hardware in runs on. Of
course there can be valid reasons to disagree with this, but it's just
the current situation and the purpose of the document is to clarify it
so that bugs are reported to the right place and handled efficiently.

> >> It does make sense for those who care about the security of a subsystem
> >> to be responsible for vulnerabilities in that system, but right now
> >> I'm not sure how one would offer to take up that responsibility.
> > 
> > I think that at least some subsystems will want to add their own
> > restrictions based on the bug reports they keep receiving, and I hope
> > it can help distros figure where there's a gap between is promised to
> > users and what the kernel promises, that needs to be filled by userland
> > verification tools for example.
> > 
> > Willy
> 
> I think there might be another category, which is were there is a
> third party who is much more interested in the security of a subsystem
> than its primary maintainers are.  I suspect that Google is said
> third party in multiple such cases, especially various USB drivers.
> In particular, exploiting the kernel via USB is a common attack
> technique used in the wild by tools like Cellebrite.

Possibly that such ones might appear there at some point. The best
way for these might be to have such teams try to step up as
co-maintainers for the parts they care about though.

> In these cases, I think it makes sense to funnel vulnerability
> reports to the people who actually seriously care about fixing them.
> For instance, problems in USB might be funneled to the Chrome OS and
> Android security teams.  They will get fixed much more quickly, and
> upstream maintainers won't be flooded with reports that don't have
> attached patches.

Trust me, patches written behind closed doors rarely resist publication
and discovery by the maintainer. And treating bugs as regular ones in
fact tends to make them move faster than as security ones. No need to
go back-and-forth asking for data that reporters hesitate to share, nor
to have to first convince them that their bug needs to be fixed even
though they were planning on speaking about them at a conference, etc.

Cheers,
Willy
