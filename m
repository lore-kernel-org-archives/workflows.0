Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB2C3594A;
	Sat,  2 May 2026 05:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777700135; cv=none; b=JhPb5Wf88cqv1JNZNlWmlB2th0vcck3AaqG+pg2iiOWZ5Z7kgft7vP1dnqZd9Xec+KF1rsRsLTX5GzrtDTKXIn+hou6HLD/sZ+wfKoMiAZf8LU0qhyxWzLUEdCix6/LY9XldqdZjCUkAnk9Bj+C13PKR7mTavyf1IKk9ZyhH8Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777700135; c=relaxed/simple;
	bh=NuJDl2pe+reaQrSlPcFwDpVUl415ZVHGIZDfBL+TpIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYVgZ+wV5SeNwGaEF8B9deRrG1iFOfR+67zdYca6mx7VQRjMDc63m77vty/NoUv928cC8r4DT6BeXQI6cpEmXsTmFaXfH4eNH5dcZW72bOOqAo03d9whO3E7fs26Pu4V5w5mvyLqCiPhS78UFhAIioCrIWXCgdIvium53LW7/v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=qSkYB2yd; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="qSkYB2yd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1777700125; bh=4qi3hB4McMDo6C6hmEOc+7dZ3cJGCCMPkRF4LpqLkzw=;
	h=From:Message-ID:From;
	b=qSkYB2ydwqTGqCJ1j7/3rMjQqdSjff4zLOaAORrkwPIKPQ+5Q9LW/R/g0N3hhnF/H
	 robicwilvJaz9PgA58DcyBrJxvxuIBmPf0003/0GHgP1N/ZZVZUxRG2HxsIHlnzj8u
	 +G9UuDVnRoGW3yq5Q+8IWFVlqfxVABu4VBiKLKUc=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 8E6F3C0A2C;
	Sat, 02 May 2026 07:35:25 +0200 (CEST)
Date: Sat, 2 May 2026 07:35:25 +0200
From: Willy Tarreau <w@1wt.eu>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Greg KH <greg@kroah.com>, leon@kernel.org, security@kernel.org,
        Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Qubes Developer Mailing List <qubes-devel@googlegroups.com>
Subject: Re: [PATCH 2/3] Documentation: security-bugs: explain what is and is
 not a security bug
Message-ID: <afWNHZoN64fldbUK@1wt.eu>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-3-w@1wt.eu>
 <2026042753-ozone-jigsaw-4ad5@gregkh>
 <ae-Acm2XJ3sR34Il@1wt.eu>
 <2026042724-bullhorn-bobtail-ae6f@gregkh>
 <ae-LVyDQPVwxesCO@1wt.eu>
 <2026042804-overbook-ripeness-73dd@gregkh>
 <1d3f8659-8c69-47f6-bb38-4c1d06cf8307@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d3f8659-8c69-47f6-bb38-4c1d06cf8307@gmail.com>

Hi Demi Marie,

On Sat, May 02, 2026 at 01:20:10AM -0400, Demi Marie Obenour wrote:
> >>> Ah, but USB does cover "some" modification of devices, so this is going
> >>> to be something that is good to document over time, if for no other
> >>> reason to keep these scanning tools in check from hallucinating crazy
> >>> situations that are obviously not a valid thing we care about.
> >>
> >> OK but does this mean you still want to get these reports in the end ?
> > 
> > I want a patch if a user cares about that threat-model (as Android does
> > but no one else) as it's up to the user groups that want to change the
> > default kernel's behavior like this to actually submit patches to do so.
> FYI, I don't think this is limited to Android.  Chrome OS definitely
> cares about malicious USB devices, and the whole purpose of USBGuard is
> to prevent a USB device from being able to compromise the system unless
> authorized.  I believe Qubes OS also cares, as it supports USB device
> assignment to virtual machines.  CCing qubes-devel for confirmation.
> 
> What should that patch look like?  Could there be a way for these user
> groups to be informed of vulnerabilities in the USB subsystem, so that
> they can take responsibility for fixing them before they become public?

I've posted a proposal elsewhere in the same thread:

   https://lore.kernel.org/lkml/afSxSX8RK0Z4kkOI@1wt.eu/

> It does make sense for those who care about the security of a subsystem
> to be responsible for vulnerabilities in that system, but right now
> I'm not sure how one would offer to take up that responsibility.

I think that at least some subsystems will want to add their own
restrictions based on the bug reports they keep receiving, and I hope
it can help distros figure where there's a gap between is promised to
users and what the kernel promises, that needs to be filled by userland
verification tools for example.

Willy
