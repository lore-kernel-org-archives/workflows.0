Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C20340A6B;
	Wed, 29 Apr 2026 03:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777432193; cv=none; b=T2sw8iRhJynJ12VL0IqC0e2GbvSG2m80a0L/ShW04lyNhCDY9GWi/p0n3eSFABG7upUEJoLXirYfxK8Ywhbv59gLS7/sifPkmR1SKSr62AHVBT8zK7C7ozPI3rRxISgBTery4ZWa0Zf9CW2fSIZsRWCVTAQxHaD5VcFiDWY5K2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777432193; c=relaxed/simple;
	bh=jadScjLDJJBA6eS9wryo4ObcA4JIF7RMq3Yb3HSKsrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=snn74JkRDknzYcYZDtqDyGSzrKR9lZyZHpiHsEZ4GTwzDEiGyP5QDLuMMqSMLo6WpTB9T8R1VjDcuNbHTl/6VXjgapj48NHJ4VV5m4E+pgrjr264CNl28+URHuD4CLAGZucnhPmOCy4SU1zfMR7N61LgQX2T1Y/XV46nzSlrbgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=pLeDsANZ; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="pLeDsANZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1777432183; bh=aqmIfBa7W9Z7GLnm1P0nwBo9e2Sx+GmVmQU+p6BbR1Y=;
	h=From:Message-ID:From;
	b=pLeDsANZ0LZTLiIkf6ycKf6N8iFUoUn+88y9Zefs22UFc+3ymPXfqD924P4dWBqnl
	 x/QjEY6/U3AuI3wW/7Jcw8rSldcfzlqe7SvXKqyCfZQKV+i+2FqI8GVw6ot6hPLg2d
	 LZEAd+MWHRuP0/mxSmyw1d0ZNtci/az8+60o6Zwc=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 83BBEC0B83;
	Wed, 29 Apr 2026 05:09:43 +0200 (CEST)
Date: Wed, 29 Apr 2026 05:09:43 +0200
From: Willy Tarreau <w@1wt.eu>
To: Greg KH <greg@kroah.com>
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Documentation: security-bugs: explain what is and is
 not a security bug
Message-ID: <afF2d6RzRf2Flnv7@1wt.eu>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-3-w@1wt.eu>
 <2026042753-ozone-jigsaw-4ad5@gregkh>
 <ae-Acm2XJ3sR34Il@1wt.eu>
 <2026042724-bullhorn-bobtail-ae6f@gregkh>
 <ae-LVyDQPVwxesCO@1wt.eu>
 <2026042804-overbook-ripeness-73dd@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026042804-overbook-ripeness-73dd@gregkh>

On Tue, Apr 28, 2026 at 03:13:01PM -0600, Greg KH wrote:
> > > We can point at other files, as this list is going to get long over
> > > time, which is a good thing.
> > 
> > Sure. I'm just unsure where this could be enumerated, as it's likely
> > that there would be just one or two lines max per subsystem for the
> > majority of them. Or we could have a totally separate file, "threat
> > model", that goes into great lengths detailing all this with sections
> > per category or subsystem when they start to grow maybe, and refer only
> > to that one from security-bugs ?
> 
> I think a separate file is good, I know I need to write up what the USB
> model is, and it's different from PCI, and different from other
> subsystems.  All should probably be documented eventually.

Would you be interested in me trying to initiate a new "threat-model.rst"
file that tries to unroll the points mentioned in the list ? I'm concerned
that that withuot having many details initially, it could look a bit odd,
because the list we currently have would be more suitable for an "other"
section.

> > > > > (like what the IB subsystem does which I
> > > > > don't think you listed above, or the USB subsystem.)
> > > > 
> > > > Indeed I didn't list IB (I'm never sure about it, I seem to remember
> > > > we simply trust any peer, is that right?), nor did I make specific
> > > > mentions for USB which is implicitly covered by "hardware emulation
> > > > or modification".
> > > 
> > > Ah, but USB does cover "some" modification of devices, so this is going
> > > to be something that is good to document over time, if for no other
> > > reason to keep these scanning tools in check from hallucinating crazy
> > > situations that are obviously not a valid thing we care about.
> > 
> > OK but does this mean you still want to get these reports in the end ?
> 
> I want a patch if a user cares about that threat-model (as Android does
> but no one else) as it's up to the user groups that want to change the
> default kernel's behavior like this to actually submit patches to do so.

Yes, OK, but we want them in any case. That's the idea I tried to convey
in the proposed doc (maybe not well enough), basically "this is a bug and
it is worth reporting, but no need to involve s@k.o for this".

thanks,
Willy
