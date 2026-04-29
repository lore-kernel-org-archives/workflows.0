Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82471A6836;
	Wed, 29 Apr 2026 06:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777443100; cv=none; b=T0YQqtnflaE4nGTRlSh4RK0ylcvZJ0Ra4Kx/7XR/GgoDQiL0fbKSN5mCriiTY/HeihFe+Fj2eCFmJSn4KbJyfFgli5VBvCsb75v8szntRJxT399jd/Nqpi1tQacDGme4W5sw3Wz9KY6uOuJLq07qwr85pF0b0IYHdid+eUFRXWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777443100; c=relaxed/simple;
	bh=CJs8jF6llRJpWYEn4dnQ1SCq36IBUOgC+VrqXKKY5Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hr0wOasxe74flylZkcS5C9cB6ppv/K8ZFaOsJs+2eawilJlSmAo7CvDcfQlxhRI7p1GoVNVKvYMtdyc4XSY9iX/Aio37ocpsc8NZxoAOmZRwdOE6LyfgNK0S5zfPhgJbE4XpeHMF9JOml+Yz5YLGEHwxX6KgP9QeEj16DgmCsQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=YsNbopzd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UiVKCUjm; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="YsNbopzd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UiVKCUjm"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id ED831EC00A6;
	Wed, 29 Apr 2026 02:11:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 29 Apr 2026 02:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1777443097; x=1777529497; bh=PtMSSFPudZ
	bkj2num2SuaqgZPiuR96idPDfiqtdkOTI=; b=YsNbopzdY9ukF7XqMPcyOEWa5E
	RfqcdHd2tJG7DNsA7x28HMjaLsl1G7rOxcTZ/Anf0hJp7JObw/mIYbCvaER2+7MY
	sv2YXozd47hR7DIMbUZiWKKcKzOeGOhVphm+Deyg34rs7zjb9tcbsHPIgtvTIVW/
	8mokq6RqLaMGl8K3tpPFNLY/csj6zu3ihjLWsgyfHIl6DhWT+cypJyZM0NB+IIsH
	vaBLDdkUODRDRPlqRQF5xhi0mJc1bzwnoBrgwo6quc6EACDGXGK23eemTKmkun5y
	z12AFgoD6eRJ8Ch2lXq5EMyQV4BOyDiZ5wMV4gUzb3tHnBS06I74gi2jfJVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1777443097; x=1777529497; bh=PtMSSFPudZbkj2num2SuaqgZPiuR96idPDf
	iqtdkOTI=; b=UiVKCUjmmnGkHXgbII8UjeDWKJSJ8NCpZZ2konlHowCyDmt9Ykg
	+YZ4gdbOxP7quxBItfhYNarNGHk4gcw09KYc57ODBPb1TSpy/y/DunYAt1Gc/beP
	U3BPVwqnQ1ojhvZR9CJyWD3D7RAQIqc4TgtC17qXrMrOrGqjZsPEaw1CDNXSaK+R
	x3ITjZzboB76yjttd7O3DW3Uwj0lpOEz4iQjkdlcBiCuaXGUrpVJtXz6SG6hrsT2
	y+Ju4ZfXBuVUbY6a98f41R8/g2eX+VLQRy3v5SACaUchnoeEsPJ/rj0V7uUZupTW
	b5gHg6k0cbfBFrLspYQnz6e8IGAFGSnZ4SQ==
X-ME-Sender: <xms:GaHxaeFXXi-GGn_DWT6L2sQCy3fS_tRFEN7f9rKAoxLouPcId6jhQg>
    <xme:GaHxaQQPxEtGAn-eBY4Go0GtA1dPkbRV0XTvRFc81LmLed3ucmfUM2yMvIFlybpYC
    jPeph0hU1Jw9vK0ryz5dUv7G06QZk5CRsPqFRBiZwKF9h742A>
X-ME-Received: <xmr:GaHxaYcCVZaXQDPis8h63L5SDUx5bRph2B7u_Hgl6WhpmipJqt6Da0gZYe5W>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekfeeilecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:GaHxaWgnbXZU4r6sfQ-X7GA0x0bUBYuOYFStobaxj20NWRjQmbcv8g>
    <xmx:GaHxabLZtrvjodSHVSshdHp2Z4zOXzMIy7oZLsq4oggSmXmWO37GUQ>
    <xmx:GaHxabFbzYlqCIzYne_IAY7kyWDnTBNToaCjtz1qea-vofMxIylMYA>
    <xmx:GaHxaZ2s3vQXjLoCvSfgxmgIbxIDNFF__Db4W7_SVv-laCEjjaC8oA>
    <xmx:GaHxaW4YpQTsZPjAV8RqMWrFjN-NbegM2297N3BWILcxP_HqdFXShwNE>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Apr 2026 02:11:36 -0400 (EDT)
Date: Wed, 29 Apr 2026 00:10:51 -0600
From: Greg KH <greg@kroah.com>
To: Willy Tarreau <w@1wt.eu>
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Documentation: security-bugs: explain what is and is
 not a security bug
Message-ID: <2026042945-duress-extenuate-939f@gregkh>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-3-w@1wt.eu>
 <2026042753-ozone-jigsaw-4ad5@gregkh>
 <ae-Acm2XJ3sR34Il@1wt.eu>
 <2026042724-bullhorn-bobtail-ae6f@gregkh>
 <ae-LVyDQPVwxesCO@1wt.eu>
 <2026042804-overbook-ripeness-73dd@gregkh>
 <afF2d6RzRf2Flnv7@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afF2d6RzRf2Flnv7@1wt.eu>

On Wed, Apr 29, 2026 at 05:09:43AM +0200, Willy Tarreau wrote:
> On Tue, Apr 28, 2026 at 03:13:01PM -0600, Greg KH wrote:
> > > > We can point at other files, as this list is going to get long over
> > > > time, which is a good thing.
> > > 
> > > Sure. I'm just unsure where this could be enumerated, as it's likely
> > > that there would be just one or two lines max per subsystem for the
> > > majority of them. Or we could have a totally separate file, "threat
> > > model", that goes into great lengths detailing all this with sections
> > > per category or subsystem when they start to grow maybe, and refer only
> > > to that one from security-bugs ?
> > 
> > I think a separate file is good, I know I need to write up what the USB
> > model is, and it's different from PCI, and different from other
> > subsystems.  All should probably be documented eventually.
> 
> Would you be interested in me trying to initiate a new "threat-model.rst"
> file that tries to unroll the points mentioned in the list ? I'm concerned
> that that withuot having many details initially, it could look a bit odd,
> because the list we currently have would be more suitable for an "other"
> section.

Sure, a small file to start with would be good for people to work off
of and add to.

> > > > > > (like what the IB subsystem does which I
> > > > > > don't think you listed above, or the USB subsystem.)
> > > > > 
> > > > > Indeed I didn't list IB (I'm never sure about it, I seem to remember
> > > > > we simply trust any peer, is that right?), nor did I make specific
> > > > > mentions for USB which is implicitly covered by "hardware emulation
> > > > > or modification".
> > > > 
> > > > Ah, but USB does cover "some" modification of devices, so this is going
> > > > to be something that is good to document over time, if for no other
> > > > reason to keep these scanning tools in check from hallucinating crazy
> > > > situations that are obviously not a valid thing we care about.
> > > 
> > > OK but does this mean you still want to get these reports in the end ?
> > 
> > I want a patch if a user cares about that threat-model (as Android does
> > but no one else) as it's up to the user groups that want to change the
> > default kernel's behavior like this to actually submit patches to do so.
> 
> Yes, OK, but we want them in any case. That's the idea I tried to convey
> in the proposed doc (maybe not well enough), basically "this is a bug and
> it is worth reporting, but no need to involve s@k.o for this".

Yes, you conveyed that, sorry if I insinuated otherwise.

thanks,

greg k-h
